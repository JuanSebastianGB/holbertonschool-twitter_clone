import 'package:flutter/material.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;

  var searchIcon = const Icon(
    Icons.settings,
    color: Colors.lightBlue,
  );

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey.shade200,
      //   title: TextField(
      //     controller: _searchController,
      //     decoration: InputDecoration(
      //       hintText: 'Search',
      //       hintStyle: const TextStyle(
      //         color: Colors.grey,
      //       ),
      //       border: InputBorder.none,
      //       prefixIcon: const Icon(
      //         Icons.search,
      //         color: Colors.lightBlue,
      //       ),
      //       suffixIcon: IconButton(
      //         onPressed: () {
      //           setState(() {
      //             if (searchIcon.icon == Icons.settings) {
      //               searchIcon = const Icon(
      //                 Icons.close,
      //                 color: Colors.lightBlue,
      //               );
      //             } else {
      //               searchIcon = const Icon(
      //                 Icons.settings,
      //                 color: Colors.lightBlue,
      //               );
      //             }
      //           });
      //         },
      //         icon: searchIcon,
      //       ),
      //     ),
      //   ),
      // ),

      body: ListView(children: const [
        UsersSearchResultsWidget(
          name: 'Mohamed',
          username: '@mohamed',
          imgUrl: 'https://avatars.githubusercontent.com/u/85411745?v=4',
          bio: '',
          isVerified: true,
        ),
        UsersSearchResultsWidget(
          name: 'PinkTuna',
          username: '@PinkTuna',
          imgUrl: 'https://avatars.githubusercontent.com/u/85411745?v=4',
          bio: '',
          isVerified: true,
        ),
        UsersSearchResultsWidget(
          name: 'Tommy',
          username: '@Tommy',
          imgUrl: 'https://avatars.githubusercontent.com/u/85411745?v=4',
          bio: '',
          isVerified: true,
        ),
        UsersSearchResultsWidget(
          name: 'MyBalls',
          username: '@YourMouth',
          imgUrl: 'https://avatars.githubusercontent.com/u/85411745?v=4',
          bio: '',
          isVerified: true,
        ),
      ]),
      bottomNavigationBar: const BottomBarMenu(),
    );
  }
}
