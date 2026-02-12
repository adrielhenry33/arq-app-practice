import 'package:arq_app/app/models/user_model.dart';
import 'package:arq_app/app/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerStatefulWidget {
  final UserModel? user;
  const ProfileView({super.key, this.user});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileView();
}

class _ProfileView extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final useProvider = ref.read(userViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.deepPurpleAccent[400]),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: 50,
                  child: Center(
                    child:  Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,

                  child: GestureDetector(
                    onTap: () async {
                      await ref
                          .read(userViewModelProvider.notifier)
                          .setProfilePick();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.white),
                      ),
                      child: Icon(Icons.edit, size: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
