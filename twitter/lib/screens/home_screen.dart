import 'package:flutter/material.dart';
import 'package:twitter/models/post.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/edit_post_screen.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/post_widget.dart';
import 'package:twitter/widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getAsync();
  }

  dynamic auth;
  Future<void> getAsync() async {
    try {
      auth = await Auth().getCurrentUserModel();
    } catch (e) {
      debugPrint('$e');
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (auth == null) {
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 246, 246),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.blue),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      drawer: const SideBarMenu(),
      body: FutureBuilder(
        future: Post().getAllPostList(),
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data == []) {
            return Center(
              child: Text(
                'There is no posts yet.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                ),
              ),
            );
          }
          List postsList = snapshot.data as List;
          return SafeArea(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return PostWidget(post: postsList[index]);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPostScreen(
              userID: auth.userID,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBarMenu(),
    );
  }
}
