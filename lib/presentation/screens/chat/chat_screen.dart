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
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              foregroundImage: NetworkImage('data:image/jpeg;base64,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'),
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Text('Mi hermano el chepe'),
          ],
        ),
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