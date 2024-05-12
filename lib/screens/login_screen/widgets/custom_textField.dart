import 'package:flutter_tech_assignment/consts/consts.dart';

Widget customTextField(
    {required bool isObscure,
    required String hintText,
    String? Function(String?)? validator,
    Widget? icon}) {
  return Container(
    margin: const EdgeInsets.only(top: verticalMargin),
    child: TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: white,
        suffixIcon: icon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),
      ),
    ),
  );
}
