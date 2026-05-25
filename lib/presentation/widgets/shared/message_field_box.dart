import 'package:flutter/material.dart';

class  MessageFiledBox extends StatelessWidget {
  const MessageFiledBox ({super.key});

  @override
  Widget build(BuildContext context) {


    final outlineInputBorder = UnderlineInputBorder(

      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius:  BorderRadius.circular(50)
      
    );


    final inputDecoration = InputDecoration(

        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,

          filled: true,
          suffixIcon: IconButton(

            icon: const Icon (Icons.send_outlined),
            onPressed: (){

              print('valor de la caja de texto');
            },

          ),
        );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value ');
        
      },
      onChanged: (value) {
        print('Changed $value');
      },

      );
  }
}