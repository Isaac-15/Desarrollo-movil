import 'package:flutter/material.dart';

class  MessageFiledBox extends StatelessWidget {
  
  final ValueChanged<String> onValue;

  const MessageFiledBox ({
    super.key,
    required this.onValue
    });

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
              final textValue = textController.value.text.trim();
              
              textController.clear();
              onValue(textValue);
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
        final textValue = value.trim();
        
        textController.clear();
        focusnode.requestFocus();
        onValue(textValue);
      },

      );
  }
}