import 'package:e_commerce_app/Provider/log_in_provider.dart';
import 'package:e_commerce_app/Provider/sign_up_provider.dart';
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
  //String? gender;
  late LogInProvider logInProvider; // Use late for non-nullable variable

  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    logInProvider = Provider.of<LogInProvider>(context, listen: false);
    phoneController = TextEditingController(text: logInProvider.userData.phone);
    nameController = TextEditingController(text: logInProvider.userData.name);
    emailController = TextEditingController(text: logInProvider.userData.email);
    genderController =
        TextEditingController(text: logInProvider.userData.gender);
  }

  Future<void> updateUserInfo() async {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String gender = genderController.text.trim();

    SignUpBody signUpBody =
        SignUpBody(name: name, email: email, phone: phone, gender: gender);
    var provider = Provider.of<LogInProvider>(context, listen: false);

    await provider.putUser(signUpBody);
    if (provider.isBack) {}
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                    info: 'Mobile Number',
                  ),
                  InfoTextField(
                    controller: phoneController,
                  ),
                  const InfoText(
                    info: 'User Name',
                  ),
                  InfoTextField(
                    controller: nameController,
                  ),
                  const InfoText(
                    info: 'Gender',
                  ),
                  InfoTextField(
                    controller: genderController,
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
    );
  }
}
