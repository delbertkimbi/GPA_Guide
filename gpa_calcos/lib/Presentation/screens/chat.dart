import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/initial_chat.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:image_picker/image_picker.dart';

class ChatAI extends StatefulWidget {
  const ChatAI({super.key});

  @override
  State<ChatAI> createState() => _ChatAIState();
}

class _ChatAIState extends State<ChatAI> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Calcos",
    profileImage: "assets/try.png",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color4,
            )),
        centerTitle: true,
        backgroundColor: MainColors.color2,
        elevation: 0,
        title: Text(
          "Calcos AI",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Stack(
      children: [
        Opacity(
          opacity: messages.isEmpty ? 1.0 : 0.0,
          child: const InitialChatScreen(),
        ),
        DashChat(
          inputOptions: InputOptions(trailing: [
            IconButton(
              onPressed: _sendMediaMessage,
              icon: const Icon(
                Icons.image,
              ),
            )
          ]),
          currentUser: currentUser,
          onSend: _sendMessage,
          messages: messages,
        ),
      ],
    );
  }

  // void _sendMessage(ChatMessage chatMessage) {
  //   setState(() {
  //     messages = [chatMessage, ...messages];
  //   });
  //   try {
  //     String question = chatMessage.text;
  //     List<Uint8List>? images;
  //     if (chatMessage.medias?.isNotEmpty ?? false) {
  //       images = [
  //         File(chatMessage.medias!.first.url).readAsBytesSync(),
  //       ];
  //     }
  //     gemini
  //         .streamGenerateContent(
  //       question,
  //       images: images,
  //     )
  //         .listen((event) {
  //       ChatMessage? lastMessage = messages.firstOrNull;
  //       if (lastMessage != null && lastMessage.user == geminiUser) {
  //         lastMessage = messages.removeAt(0);
  //         String response = event.content?.parts?.fold(
  //                 "", (previous, current) => "$previous ${current.text}") ??
  //             "";
  //         lastMessage.text += response;
  //         setState(
  //           () {
  //             messages = [lastMessage!, ...messages];
  //           },
  //         );
  //       } else {
  //         String response = event.content?.parts?.fold(
  //                 "", (previous, current) => "$previous ${current.text}") ??
  //             "";
  //         ChatMessage message = ChatMessage(
  //           user: geminiUser,
  //           createdAt: DateTime.now(),
  //           text: response,
  //         );
  //         setState(() {
  //           messages = [message, ...messages];
  //         });
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        String response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";

        // Process the response text
        response = _processResponseText(response);

        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          // ... (rest of the code remains the same)
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }

  String _processResponseText(String text) {
    // Remove unnecessary characters (replace with your specific logic)
    text = text.replaceAll(RegExp(r"[^\w\s\!\?\.]"), "");

    // Basic formatting (replace with your desired formatting rules)
    text = text.replaceAll(r"\b([A-Z][a-z]+)\b",
        r"**\1**"); // Bolden words starting with uppercase

    return text;
  }
}
