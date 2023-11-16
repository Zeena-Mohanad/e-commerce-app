import 'package:e_commerce_app/Provider/sign_up_provider.dart';
import 'package:e_commerce_app/view/Account%20Info/account_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Scaffold(
        appBar: AppBar(
          leading: const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFD9D9D9),
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
          title: const Text('User name'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountInfo()),
                  );
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: Text('Orders'),
              ),
              ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text('Notifications'),
              ),
              ListTile(
                leading: Icon(Icons.support_agent_outlined),
                title: Text('Support'),
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('About'),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
