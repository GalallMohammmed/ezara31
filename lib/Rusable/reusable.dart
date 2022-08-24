import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaulTextFormField({
  String? label,
  Icon? prifix,
  IconButton? suffix,
  required String? Function(String?)? valid,
  bool isShown = true,
  double radius = 0,
  // TextInputType type;
  required TextEditingController controller,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: prifix,
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    validator: valid,
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    obscureText: isShown,
  );
}

Widget defaultButton({
  Function? onPress,
  double radius = 0,
  Color? color,
  required String buttonName,
  double width = double.infinity,
  double height = 40.0,
}) {
  return MaterialButton(
    onPressed: (){
      print('click');
      onPress != null ? onPress() : (){};
    },
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

void navigte_to({
  required screen,
  required var context,
}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen();
  }));
}

void printFullData(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element)=>print(element.group(0)));
}
