import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String imgUrl;
  final bool isVerified;

  const UsersSearchResultsWidget(
      {Key? key,
      required this.name,
      required this.username,
      required this.bio,
      required this.imgUrl,
      required this.isVerified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      title: Text(
        name,
        style: GoogleFonts.mulish(
          fontSize: 12,
        ),
      ),
      subtitle: Text(
        '@$username',
        style: GoogleFonts.mulish(
          fontSize: 12,
        ),
      ),
    );
  }
}
