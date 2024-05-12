import 'package:flutter/cupertino.dart';
import 'package:flutter_tech_assignment/consts/consts.dart';
import 'package:flutter_tech_assignment/screens/login_screen/widgets/custom_logo_container.dart';
import 'package:flutter_tech_assignment/screens/login_screen/widgets/form_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(gradient: bgGradient),
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo container
              customLogoContainer(context),
              //welcome flutter text
              const Text(
                welcomeText,
                style: TextStyle(
                    fontSize: largeText,
                    color: black,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                continueText,
                style: TextStyle(
                    fontSize: mediumText,
                    color: grey,
                    fontWeight: FontWeight.w400),
              ),
              //form section
              formSection(context, formKey),
              // formSection(context, formKey)
            ],
          ),
        ),
      ),
    );
  }
}
