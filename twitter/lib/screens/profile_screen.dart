import 'package:flutter/material.dart';

import '../models/user.dart';
import '../providers/auth_state.dart';

class ProfileScreen extends StatefulWidget {
  final String userID;
  const ProfileScreen({Key? key, required this.userID}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getAsync();
  }

  dynamic user;
  dynamic auth;
  dynamic postsList;

  Future<void> getAsync() async {
    try {
      user = await User().getUserByID(widget.userID);
      auth = await Auth().getCurrentUserModel();
    } catch (e) {
      debugPrint('$e');
    }
    if (mounted) setState(() {});
  }

  String buttonText = 'None';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: User().getUserByID(widget.userID),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Scaffold(
              backgroundColor: Color.fromARGB(255, 247, 246, 246),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (user == null || auth == null) {
            return const Scaffold(
              backgroundColor: Color.fromARGB(255, 247, 246, 246),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          User data = snapshot.data as User;

          if (data.userID == auth.userID) {
            buttonText = 'Edit profile';
          } else if (data.followersList.contains(auth.userID)) {
            buttonText = 'Unfollow';
          } else {
            buttonText = 'Follow';
          }

          return Scaffold(
            body: ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(data.coverImgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ]),
          );
        });
  }
}
