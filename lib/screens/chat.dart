import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(
      id: "0",
      firstName: "nada",
      profileImage:
          "assets/images/vecteezy_profile-user-icon-isolated-on-white-background-vector-eps10_ 1.png");
  ChatUser geminUser = ChatUser(
      id: "1",
      firstName: "Ella",
      profileImage: "assets/images/480-[Converted] 3.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Image.asset("assets/images/480-[Converted] - Copy.png"),
        title: const Text(
          "SproutAssistant",
          style: TextStyle(color: Color.fromARGB(255, 15, 85, 63)),
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
        inputOptions: InputOptions(trailing: [
          IconButton(
            onPressed: _sendMediaMessage,
            icon: Icon(Icons.image),
            color: Color(0xff4F7569),
          )
        ]),
        currentUser: currentUser,
        onSend: _SendMessage,
        messages: messages);
  }

  void _SendMessage(ChatMessage chatMessage) {
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
        ChatMessage? LastMessage = messages.firstOrNull;
        if (LastMessage != null && LastMessage.user == geminUser) {
          LastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          LastMessage.text += response;
          setState(() {
            messages = [LastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
          user: currentUser,
          createdAt: DateTime.now(),
          text: "Describe this image?",
          medias: [
            ChatMedia(url: file.path, fileName: "", type: MediaType.image)
          ]);
      _SendMessage(chatMessage);
    }
  }
}
