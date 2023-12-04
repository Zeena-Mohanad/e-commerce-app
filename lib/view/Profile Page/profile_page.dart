import 'package:e_commerce_app/Provider/log_in_provider.dart';
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
          title: Consumer<LogInProvider>(builder: (context, login, widget) {
            if (login.isBack == true) {
              return Text(login.);
            }
            return const Text('User name');
          }),
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
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: Text('Orders'),
              ),
              const ListTile(
                leading: Icon(Icons.notifications_outlined),
                title: Text('Notifications'),
              ),
              const ListTile(
                leading: Icon(Icons.support_agent_outlined),
                title: Text('Support'),
              ),
              const ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('About'),
              ),
              Consumer<LogInProvider>(builder: (context, login, widget) {
                return FutureBuilder(
                    future: login.isLoggedIn(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Future is still loading
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle error
                        return Text('Error: ${snapshot.error}');
                      } else {
                        if (snapshot.data == true) {
                          return GestureDetector(
                            onTap: () {
                              login.logout();
                              Navigator.pushNamed(context, '/home');
                            },
                            child: const ListTile(
                              leading: Icon(Icons.logout_outlined),
                              title: Text('Logout'),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const ListTile(
                              leading: Icon(Icons.app_registration_outlined),
                              title: Text('Register'),
                            ),
                          );
                        }
                      }
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
