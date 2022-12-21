class User {
  String? key;
  String? userId;
  String? email;
  String? displayName;
  String? imageUrl;
  int? followers;
  int? following;
  List<String>? followersList;
  List<String>? followingList;

  User({
    this.key = 'key',
    this.userId = 'userId',
    this.email = 'email',
    this.displayName = 'displayName',
    this.imageUrl = 'imageUrl',
    this.followers = 0,
    this.following = 0,
    this.followersList = const [''],
    this.followingList = const [''],
  });

  static User fromJson(Map<dynamic, dynamic> map) => User(
        key: map['key'],
        userId: map['userId'],
        email: map['email'],
        displayName: map['displayName'],
        imageUrl: map['imageUrl'],
        followers: map['followers'],
        following: map['following'],
        followersList: map['followersList'],
        followingList: map['followingList'],
      );

  Map<dynamic, dynamic> toJson() => {
        "key": key,
        "userId": userId,
        "email": email,
        "displayName": displayName,
        "imageUrl": imageUrl,
        "followers": followers,
        "following": following,
        "followersList": followersList,
        "followingList": followingList,
      };
}
