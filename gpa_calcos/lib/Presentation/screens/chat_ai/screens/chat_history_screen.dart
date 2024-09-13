import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/initial_chat.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/colors.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/boxes.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/providers/chat_provider.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/screens/chat_screen.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/widgets/chat_history_widget.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/widgets/empty_history_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../hive/chat_history.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
  // scroll controller
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0.0) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, chatProvider, child) {
      // auto scroll to bottom on new message
      chatProvider.addListener(() {
        if (chatProvider.inChatMessages.isNotEmpty) {
          _scrollToBottom();
        }
      });

      return Scaffold(
          backgroundColor: AppColors.color4,
          appBar: AppBar(
            backgroundColor: AppColors.color2,
            centerTitle: true,
            title: const Text(
              'Guide AI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.color2,
            onPressed: () async {
              // navigate to chat screen
              // navigate to chat screen
              final chatProvider = context.read<ChatProvider>();
              // prepare chat room
              await chatProvider.prepareChatRoom(
                isNewChat: true,
                chatID: '',
              );

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            },
            label: const Text(
              'New Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          body: ValueListenableBuilder<Box<ChatHistory>>(
            valueListenable: Boxes.getChatHistory().listenable(),
            builder: (context, box, _) {
              final chatHistory =
                  box.values.toList().cast<ChatHistory>().reversed.toList();
              return chatHistory.isEmpty
                  ? const InitialChatScreen()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '  Your Chat History',
                                style: TextStyle(
                                  color: AppColors.color1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                ' (long press to delete)',
                                style: TextStyle(
                                  color: AppColors.color1.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: chatHistory.length,
                              itemBuilder: (context, index) {
                                final chat = chatHistory[index];
                                return ChatHistoryWidget(chat: chat);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ));
    });
  }
}
