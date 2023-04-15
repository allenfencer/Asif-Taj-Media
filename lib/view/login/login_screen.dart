import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/constants/constants.dart';
import 'package:tech_media/utils/providers/login_provider.dart';

import '../../global widgets/custom_button.dart';
import '../../global widgets/input_field.dart';
import '../../utils/routes/route_name.dart';

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
              ChangeNotifierProvider(
                create: (_) => LoginProvider(),
                child: Consumer<LoginProvider>(
                  builder: (context, value, child) {
                    return Center(
                        child: CustomButton(
                      isLoading: value.loading,
                      buttonText: 'Login',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          value.login(context, emailController.text,
                              passwordController.text);
                        }
                      },
                    ));
                  },
                ),
              ),
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
