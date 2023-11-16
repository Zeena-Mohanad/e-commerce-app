import 'package:e_commerce_app/view/Account%20Info/info_text.dart';
import 'package:e_commerce_app/view/Account%20Info/info_text_field.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  String? gender;

  TextEditingController phoneController =
      TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController birthController = TextEditingController(text: '');
  TextEditingController locationController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController genderController = TextEditingController(text: '');

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
        child: Padding(
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
                info: 'Date of birth (optional)',
              ),
              InfoTextField(
                controller: birthController,
              ),
              const InfoText(
                info: 'Location',
              ),
              InfoTextField(
                controller: locationController,
              ),
              const InfoText(
                info: 'Gender',
              ),
              InfoTextField(
                controller: genderController,
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
            ],
          ),
        ),
      ),
    );
  }
}
