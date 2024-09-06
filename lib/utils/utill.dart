import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// this class is made for using utility function

//custom decoration for text field
decoration({focusNode, hintText, required String string}) => InputDecoration(
    filled: true,
    fillColor:
        // focusNode.hasFocus
        //     ?
        // const Color.fromRGBO(224, 255, 250, 1)
        //     :
        const Color.fromRGBO(247, 250, 248, 1),
    contentPadding: const EdgeInsets.all(8),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color.fromRGBO(111, 121, 120, 1), width: 0.2)),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromRGBO(224, 255, 250, 1)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.red),
    ),

    // Rich text is use to color astrick mark
    label: RichText(
      text: TextSpan(
          text: hintText,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(154, 165, 177, 1)),
          children: const [
            // TextSpan(
            //     text: focusNode.hasFocus
            //         ? ''
            //         : string.isNotEmpty
            //             ? ''
            //             : ' *',
            //     style: const TextStyle(
            //       fontWeight: FontWeight.w400,
            //       fontSize: 14,
            //       color: Colors.red,
            //     ))
          ]),
    ),

    //The label will float when the input is focused
    floatingLabelBehavior: FloatingLabelBehavior.auto);

boxDec() => const BoxDecoration(
    border: Border(
        left: BorderSide(
          width: 3,
          color: Colors.red,
        ),
        right: BorderSide(
          width: 3,
          color: Colors.red,
        ),
        top: BorderSide(
          width: 3,
          color: Colors.red,
        ),
        bottom: BorderSide(
          width: 3,
          color: Colors.red,
        )));

Widget buildLoading() => const Center(
    heightFactor: 50,
    widthFactor: 50,
    child: CircularProgressIndicator(
      color: Color.fromRGBO(65, 203, 195, 1),
    ));

showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: const Color.fromRGBO(65, 203, 195, 1),
      textColor: Colors.white);
}
