// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media/models/auth_model.dart';

import 'package:social_media/services/auth_service.dart';
import 'package:social_media/view/chagepassword.dart';
import 'package:social_media/view/settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: AuthService().getLoggedUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final UserModel? user = snapshot.data;
          print('Snapshot data: $user');

          if (user != null) {
            print('User: ${user.username}');
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  user.username ?? 'Unknown User',
                  style: const TextStyle(fontSize: 22),
                ),
                actions: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.menu_rounded,
                            color: Colors.black, size: 30),
                      );
                    },
                  )
                ],
              ),
              endDrawer: drawer(),
              body: DefaultTabController(
                length: 3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Gap(20),
                            SizedBox(
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child: const CircleAvatar(
                                      minRadius: 40,
                                      backgroundColor: Colors.blueAccent,
                                    ))),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                blacktext(
                                    user.following!.length.toString(), 20),
                                greytext('Followers')
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                blacktext(
                                    user.followers!.length.toString(), 20),
                                greytext('Following')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 100)
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            print('User data is null');
            return const Text('User data is null');
          }
        }
      },
    );
  }
}

Drawer drawer() {
  var icons = [
    Icons.edit,
    Icons.password_outlined,
    Icons.settings,
    // CupertinoIcons.gift,
    // Icons.star,
    // CupertinoIcons.question_circle,
    // Icons.share,
    // Icons.settings
  ];
  var titletxt = [
    'Edit profile',
    'Change PassWord',
    'Settings',
    // 'Refer a friend',
    // 'wishlist',
    // 'Help',
    // 'Share my profile',
    // 'Settings'
  ];

  return Drawer(
    width: 280,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text('Settings', style: TextStyle(fontSize: 22)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: titletxt.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(titletxt[index]),
                leading: Icon(
                  icons[index],
                  color: Colors.black,
                ),
                onTap: () {
                  navigateToPage(context, index);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

void navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordChangeScreen()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
      break;
    // Add cases for other pages here
  }
}

Text blacktext(String txt, double? size) {
  return Text(
    txt,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: size, color: Colors.black),
  );
}

Text greytext(String txt) => Text(
      txt,
      style: const TextStyle(color: Colors.black54),
    );
