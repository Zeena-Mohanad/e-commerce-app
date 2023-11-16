import 'package:e_commerce_app/Provider/log_in_provider.dart';
import 'package:e_commerce_app/models/log_in_body.dart';
import 'package:e_commerce_app/view/Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_button.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_text.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_text_field.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey();

    Future<void> logIn() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      LogInBody logInBody = LogInBody(email: email, password: password);
      var provider = Provider.of<LogInProvider>(context, listen: false);

      await provider.postLogIn(logInBody);
      if (provider.isBack) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainNavigationBar()),
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: formKey,
            child: Consumer<LogInProvider>(builder: (context, data, widget) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: 'Welcome back'),
                  CustomTextField(
                    label: 'Email',
                    hintText: 'Write your email',
                    controller: emailController,
                  ),
                  CustomTextField(
                    label: 'Password',
                    hintText: 'Write your password',
                    controller: passwordController,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: logIn,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(fontSize: 16),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              );
                            },
                            child: const Text(
                              'Create account',
                              style: TextStyle(fontSize: 16),
                            )),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
