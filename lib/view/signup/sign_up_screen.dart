import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/utils/providers/sign_up_provider.dart';

import '../../global widgets/custom_button.dart';
import '../../global widgets/input_field.dart';
import '../../utils/routes/route_name.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String emailPattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ChangeNotifierProvider(
            create: (context) => SignUpProvider(),
            child: Consumer<SignUpProvider>(
              builder: (context, provider, child) {
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InputField(
                          editingController: userNameController,
                          hintText: 'Username',
                          textInputType: TextInputType.name,
                          hintIcon: Icons.person,
                          formValidator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Username cannot be empty';
                            } else {
                              return null;
                            }
                          },
                          onFieldSubmitted: (val) {}),
                      const SizedBox(
                        height: 20,
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
                          hintIcon: Icons.lock,
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
                        isLoading: provider.loading,
                        buttonText: 'Sign up',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            provider.signUp(context, userNameController.text,
                                emailController.text, passwordController.text);
                          }
                        },
                      )),
                      const SizedBox(
                        height: 70,
                      ),
                      Center(
                          child: CustomButton(
                        buttonText: 'Already have an account?',
                        function: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteName.loginScreen, (route) => false);
                        },
                      )),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
