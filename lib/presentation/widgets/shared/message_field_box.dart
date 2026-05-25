import 'package:flutter/material.dart';

class  MessageFiledBox extends StatelessWidget {
  const MessageFiledBox ({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();

    final focusnode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(

      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius:  BorderRadius.circular(50)
      
    );


    final inputDecoration = InputDecoration(

        hintText: 'end your message with a "?"',

        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,

          filled: true,
          suffixIcon: IconButton(

            icon: const Icon (Icons.send_outlined),
            onPressed: (){
              final textValue = textController.value.text;
              print('button: $textValue');
              textController.clear();
            },

          ),
        );

    return TextFormField(
      onTapUpOutside: (event) {
        focusnode.unfocus();
      },
      focusNode: focusnode,
      controller: textController,
      decoration: inputDecoration,
       
      onFieldSubmitted: (value) {
        print('Submit value $value ');
        textController.clear();
        focusnode.requestFocus();
      },

      );
  }
}