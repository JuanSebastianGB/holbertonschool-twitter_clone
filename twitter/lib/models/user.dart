class User {
  String? key;
  String? userId;
  String? email;
  String? displayName;
  String? userName;
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
    this.userName = 'userName',
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
        userName: map['userName'],
        imageUrl: map['imageUrl'],
        followers: map['followers'],
        following: map['following'],
        followersList: map['followersList'],
        followingList: map['followingList'],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "userId": userId,
        "email": email,
        "displayName": displayName,
        "userName": userName,
        "imageUrl": imageUrl,
        "followers": followers,
        "following": following,
        "followersList": followersList,
        "followingList": followingList,
      };
}
