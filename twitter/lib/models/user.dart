import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final usersRef =
    FirebaseFirestore.instance.collection('users').withConverter<User>(
          fromFirestore: (snapshot, _) {
            User.fromJson(snapshot.data()!);
            return User.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (user, _) => user.toJson(),
        );

class User {
  String? key;
  String? userID;
  String? email;
  String? displayName;
  String? userName;
  String? imageUrl;
  int? followers;
  int? following;
  List<dynamic>? followersList;
  List<dynamic>? followingList;
  String? bio;
  String? coverImgUrl;
  bool isVerified;

  User({
    String key = '',
    String userID = '',
    String email = '',
    String userName = '',
    String displayName = '',
    String imageUrl =
        'https://freepngimg.com/thumb/google/66726-customer-account-google-service-button-search-logo.png',
    int followers = 0,
    int following = 0,
    List<dynamic> followersList = const [],
    List<dynamic> followingList = const [],
    String bio = 'No bio available',
    String coverImgUrl =
        'https://images.wondershare.com/repairit/aticle/2021/08/twitter-header-photo-issues-1.jpg',
    bool isVerified = false,
  }) : this._(
          key: uuid.v4(),
          userID: userID,
          email: email,
          userName: randomAlphaNumeric(8),
          displayName: displayName,
          imageUrl: imageUrl,
          followers: followers,
          following: following,
          followersList: followersList,
          followingList: followingList,
          bio: bio,
          coverImgUrl: coverImgUrl,
          isVerified: isVerified,
        );

  User._({
    required this.key,
    required this.userID,
    required this.email,
    required this.userName,
    required this.displayName,
    required this.imageUrl,
    required this.followers,
    required this.following,
    required this.followersList,
    required this.followingList,
    required this.bio,
    required this.coverImgUrl,
    required this.isVerified,
  });

  static User fromJson(Map<dynamic, dynamic> map) => User(
        key: map['key'],
        userID: map['userId'],
        email: map['email'],
        displayName: map['displayName'],
        userName: map['userName'],
        imageUrl: map['imageUrl'],
        followers: map['followers'],
        following: map['following'],
        followersList: map['followersList'],
        followingList: map['followingList'],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "userId": userID,
        "email": email,
        "displayName": displayName,
        "userName": userName,
        "imageUrl": imageUrl,
        "followers": followers,
        "following": following,
        "followersList": followersList,
        "followingList": followingList,
      };

  Future<User> getUserByID(String userID) async {
    Query query = usersRef.where("userID", isEqualTo: userID);
    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs.first.data() as User;
  }
}
