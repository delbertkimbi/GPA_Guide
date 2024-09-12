import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          // navigate to chat screen
          // navigate to chat screen
          final chatProvider = context.read<ChatProvider>();
          // prepare chat room
          await chatProvider.prepareChatRoom(
            isNewChat: true,
            chatID: '',
          );
          chatProvider.setCurrentIndex(newIndex: 1);
          chatProvider.pageController.jumpToPage(1);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No chat foune, start a new chat!',
            ),
          ),
        ),
      ),
    );
  }
}
/*
Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/wonder.png"), // Replace with your image path
          SizedBox(height: 10.0.h),
          Text(
            "Welcome to Guide AI. Ask me anything \nor send a picture to get started.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w500,
              color: MainColors.color1,
            ),
          ),
        ],
      ),
    );
 */