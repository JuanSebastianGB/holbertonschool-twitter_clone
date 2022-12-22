import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signin_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

String circleAvatarString =
    'https://intranet.hbtn.io/assets/holberton-logo-full-default-9c9d1742abc6ffb045e9b4af78ba85770bf39126bcf2c43af9d6a53ee4aabd3d.png';

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  void initState() {
    super.initState();
  }

  User? user;
  Future<void> getAsync() async {
    try {
      user = await Auth().getCurrentUserModel();
    } catch (e) {
      debugPrint(e.toString());
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(20),
                child: Align(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              circleAvatarString,
                            ),
                            radius: 30.0,
                          ),
                          const SizedBox(
                            width: 200,
                          )
                        ],
                      ),
                      const Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text("${user?.followers} Followers"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text("${user?.following} Following"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmark'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.flash_on),
            title: const Text('Moments'),
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Settings and privacy'),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('Help Center'),
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SingIn(),
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}
