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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(30),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (searchIcon.icon == Icons.settings) {
                      searchIcon = const Icon(
                        Icons.close,
                        color: Colors.lightBlue,
                      );
                    } else {
                      searchIcon = const Icon(
                        Icons.settings,
                        color: Colors.lightBlue,
                      );
                    }
                  });
                },
                icon: searchIcon,
              ),
            ),
          ),
        ),
      ),
      body: ListView(children: const [
        UsersSearchResultsWidget(
          name: 'Mario',
          username: '@SuperMario',
          imgUrl:
              'https://cdn.pocket-lint.com/r/s/1200x/assets/images/153339-games-news-does-mario-sunbathing-pic-mean-mario-sunshine-for-switch-is-near-image1-9zsg71zrml.jpg',
          bio: "I'm-a gonna get you! - Mario Kart 7 and Mario Kart Wii",
          isVerified: true,
        ),
        UsersSearchResultsWidget(
          name: 'Peach',
          username: '@PrincessPeach',
          imgUrl:
              'https://play.nintendo.com/images/Masthead_Peach.17345b1513ac044897cfc243542899dce541e8dc.9afde10b.png',
          bio: "'Aww, sweet! I did it, yay!' From Mario Kart 7",
          isVerified: true,
        ),
        UsersSearchResultsWidget(
          name: 'Bowser',
          username: '@KingBowserKoopa',
          imgUrl:
              'https://i.pinimg.com/originals/07/02/53/0702539dbbe80e8cb200300984a9823a.png',
          bio: "I'm the biggest, baddest brute around, and don't you forget it",
          isVerified: false,
        ),
        UsersSearchResultsWidget(
          name: 'Crash',
          username: '@CrashBandicoot',
          imgUrl:
              'https://upload.wikimedia.org/wikipedia/en/1/16/Crash_Bandicoot.png',
          bio: "And wiping Crash Bandicoot off the face of the earth forever!",
          isVerified: true,
        ),
      ]),
      bottomNavigationBar: const BottomBarMenu(),
    );
  }
}
