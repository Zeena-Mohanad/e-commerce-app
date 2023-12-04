import 'package:e_commerce_app/Provider/sign_up_provider.dart';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:e_commerce_app/view/LogIn%20page/login.dart';
import 'package:e_commerce_app/view/Navigation%20Bar/bottom_navigation_bar.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_button.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_text.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_text_field.dart';
import 'package:e_commerce_app/view/Verification%20page/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswodController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController genderController = TextEditingController();

    Future<void> registration() async {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String repeatPassword = confirmPasswodController.text.trim();
      String gender = genderController.text.trim();

      SignUpBody signUpBody = SignUpBody(
          name: name,
          email: email,
          password: password,
          repeatPassword: repeatPassword,
          phone: phone,
          gender: gender);
      var provider = Provider.of<SignUpProvider>(context, listen: false);

      await provider.postSignUp(signUpBody);
      if (provider.isBack) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VerificationPage()),
        );
      }
    }

    return Scaffold(body: SafeArea(
      child: Consumer<SignUpProvider>(builder: (context, data, widget) {
        return data.loading
            ? Center(
                child: Container(
                  child: SpinKitThreeBounce(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: CustomText(
                        text: 'Welcome',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CustomText(
                        text: 'Create Account',
                      ),
                    ),
                    CustomTextField(
                      label: 'User Name',
                      hintText: 'Write your name here',
                      controller: nameController,
                    ),
                    CustomTextField(
                      label: 'Email',
                      hintText: 'email_example@gmail.com',
                      controller: emailController,
                    ),
                    CustomTextField(
                      label: 'Password',
                      hintText: 'min 8 characters',
                      controller: passwordController,
                    ),
                    CustomTextField(
                      label: 'Confirm Password',
                      hintText: 'Confirm password',
                      controller: confirmPasswodController,
                    ),
                    CustomTextField(
                      label: 'Phone Number',
                      hintText: 'must be 11 number',
                      controller: phoneController,
                    ),
                    CustomTextField(
                      label: 'gender',
                      hintText: 'male or female',
                      controller: genderController,
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: registration,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInPage()),
                            );
                          },
                          child: const Text(
                            'already have an account?',
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
              ));
      }),
    ));
  }
}
