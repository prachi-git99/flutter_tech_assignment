import 'package:flutter_tech_assignment/consts/consts.dart';
import '../../home_screen/home_screen.dart';
import 'custom_button.dart';
import 'custom_textField.dart';

Widget formSection(context, formKey) {
  return Form(
      key: formKey,
      child: Column(children: [
        //text fields
        customTextField(
          isObscure: false,
          hintText: userHintText,
        ),
        customTextField(
          isObscure: true,
          hintText: passwordHintText,
          icon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
        ),
        //forgot password button
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: const Text(forgotPassword,
                    style: TextStyle(color: primaryColor)))),
        //login button
        customButton(
            context: context,
            onTap: () {
              if (formKey.currentState.validate()) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "homeScreen", (route) => false);
              }
            })
      ]));
}
