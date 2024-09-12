import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/colors.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/chat_history.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/providers/chat_provider.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/utility/utilites.dart';
import 'package:provider/provider.dart';

class ChatHistoryWidget extends StatelessWidget {
  const ChatHistoryWidget({
    super.key,
    required this.chat,
  });

  final ChatHistory chat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Card(
        color: Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          leading: CircleAvatar(
            backgroundColor: AppColors.color2,
            radius: 30,
            child: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
          ),
          title: Text(
            chat.prompt,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.color1,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            chat.response,
            maxLines: 2,
            style: TextStyle(
              color: AppColors.color1,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.color1,
          ),
          onTap: () async {
            // navigate to chat screen
            final chatProvider = context.read<ChatProvider>();
            // prepare chat room
            await chatProvider.prepareChatRoom(
              isNewChat: false,
              chatID: chat.chatId,
            );
            chatProvider.setCurrentIndex(newIndex: 1);
            chatProvider.pageController.jumpToPage(1);
          },
          onLongPress: () {
            // show my animated dialog to delete the chat
            showMyAnimatedDialog(
              context: context,
              title: 'Delete Chat',
              content: 'Are you sure you want to delete this chat?',
              actionText: 'Delete',
              onActionPressed: (value) async {
                if (value) {
                  // delete the chat
                  await context
                      .read<ChatProvider>()
                      .deletChatMessages(chatId: chat.chatId);

                  // delete the chat history
                  await chat.delete();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
