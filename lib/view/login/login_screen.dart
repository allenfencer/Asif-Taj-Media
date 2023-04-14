import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/res/components/input_field.dart';
import 'package:tech_media/utils/routes/route_name.dart';

import '../../res/components/custom_button.dart';
import '../signup/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String emailPattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  void loginUser() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log in',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              InputField(
                  editingController: emailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  hintIcon: Icons.alternate_email_rounded,
                  formValidator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Email cannot be empty';
                    } else if (!RegExp(emailPattern).hasMatch(value)) {
                      return 'Invalid email format';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (val) {}),
              const SizedBox(
                height: 20,
              ),
              InputField(
                  obscureText: true,
                  editingController: passwordController,
                  hintText: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  hintIcon: Icons.alternate_email_rounded,
                  formValidator: (value) {
                    if (value!.isEmpty || value == '') {
                      return 'Password cannot be empty';
                    } else if (value.length < 8) {
                      return 'Password must be atleast 8 characters';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (val) {}),
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: CustomButton(
                isLoading: isLoading,
                buttonText: 'Login',
                function: loginUser,
              )),
              const SizedBox(
                height: 70,
              ),
              Center(
                  child: CustomButton(
                buttonText: 'Don\'t have an account?',
                function: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.signupScreen, (route) => false);
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
