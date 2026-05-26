import 'package:aplicacion_chat/domain/entities/message.dart';
import 'package:aplicacion_chat/presentation/providers/chat_provider.dart';
import 'package:aplicacion_chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:aplicacion_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:aplicacion_chat/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=47'),
          ),
        ),
        title: const Text('Mi Pastelito'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            MessageFiledBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}