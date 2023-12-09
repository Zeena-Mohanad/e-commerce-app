import 'package:e_commerce_app/Provider/log_in_provider.dart';
import 'package:e_commerce_app/models/sign_up_body.dart';
import 'package:e_commerce_app/view/Account%20Info/info_text.dart';
import 'package:e_commerce_app/view/Account%20Info/info_text_field.dart';
import 'package:e_commerce_app/view/Sign%20Up%20page/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswodController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();

  Future<void> updateUserInfo() async {
    String email = nameController.text.trim();
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String repeatPassword = confirmPasswodController.text.trim();

    SignUpBody signUpBody = SignUpBody(
      email: email,
      name: name,
      password: password,
      repeatPassword: repeatPassword,
      phone: phone,
    );
    var provider = Provider.of<LogInProvider>(context, listen: false);

    try {
      // Await putUser
      await provider.putUser(signUpBody);
    } catch (e) {
      print('Failed to update user info: $e');
    }
  }

  late LogInProvider logInProvider; // Use late for non-nullable variable

  @override
  void initState() {
    super.initState();
    logInProvider = Provider.of<LogInProvider>(context, listen: false);
    emailController = TextEditingController(text: logInProvider.userData.email);
    phoneController = TextEditingController(text: logInProvider.userData.phone);
    nameController = TextEditingController(text: logInProvider.userData.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Account Info',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InfoText(
                      info: 'Email',
                    ),
                    InfoTextField(
                      controller: emailController,
                    ),
                    const InfoText(
                      info: 'User Name',
                    ),
                    InfoTextField(
                      controller: nameController,
                    ),
                    const InfoText(
                      info: 'Password',
                    ),
                    InfoTextField(
                      controller: passwordController,
                    ),
                    const InfoText(
                      info: 'Confirm Password',
                    ),
                    InfoTextField(
                      controller: confirmPasswodController,
                    ),
                    const InfoText(
                      info: 'Mobile Number',
                    ),
                    InfoTextField(
                      controller: phoneController,
                    ),
                  ],
                ),
              ),

              // Row(
              //   children: [
              //     Expanded(
              //       child: RadioListTile(
              //         contentPadding: EdgeInsets.zero,
              //         title: const Text('Male'),
              //         value: 'male',
              //         groupValue: gender,
              //         onChanged: (value) {
              //           setState(() {
              //             gender = value.toString();
              //           });
              //         },
              //       ),
              //     ),
              //     Expanded(
              //       child: RadioListTile(
              //         contentPadding: EdgeInsets.zero,
              //         title: const Text('Female'),
              //         value: 'female',
              //         groupValue: gender,
              //         onChanged: (value) {
              //           setState(() {
              //             gender = value.toString();
              //           });
              //         },
              //       ),
              //     ),
              //   ],
              // )
              CustomButton(text: 'Apply Changes', onPressed: updateUserInfo),
            ],
          ),
        ),
      ),
    );
  }
}
