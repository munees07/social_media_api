import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/controller/user_provider.dart';
import 'package:social_media/models/usersmodel.dart';
import 'package:social_media/services/user_services.dart';

class FollowPage extends StatelessWidget {
  const FollowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchAllUserData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error${snapshot.error}'),
                );
              } else {
                return Consumer<UserProvider>(
                    builder: (context, provider, child) {
                  return provider.users.isEmpty
                      ? const Center(
                          child: Text('No Users Available'),
                        )
                      : ListView.builder(
                          itemCount: provider.users.length,
                          itemBuilder: (context, index) {
                            final UsersModel data = provider.users[index];
                            final bool isFollowing =
                                provider.isFollowingUser(data.id!);
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Card(
                                child: ListTile(
                                  trailing: ElevatedButton(
                                      onPressed: () {
                                        if (isFollowing) {
                                          UserService().unFollowUser(data.id!);
                                          provider.removeFollowing(data.id!);
                                        } else {
                                          UserService().followUser(data.id!);
                                          provider.addFollowing(data.id!);
                                        }
                                      },
                                      child:  Text(isFollowing?'Unfollow': 'Follow')),
                                  title: Text(data.username!.toString()),
                                ),
                              ),
                            );
                          },
                        );
                });
              }
            }));
  }

  Future<void> fetchAllUserData(BuildContext context) async {
    final provider = Provider.of<UserProvider>(context, listen: false);
    await provider.fetchUsers(context);
  }
}
