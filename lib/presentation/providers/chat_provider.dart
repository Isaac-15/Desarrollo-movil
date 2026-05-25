import 'package:aplicacion_chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [

    Message(text: 'hola amor',fromWho: FromWho.me),
    Message(text: 'ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    notifyListeners();

  } 

}