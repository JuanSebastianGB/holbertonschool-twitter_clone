import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire_base_auth;
import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  error,
  wrongError,
  noUserError
}

class Auth extends ChangeNotifier {
  fire_base_auth.FirebaseAuth auth = fire_base_auth.FirebaseAuth.instance;

  final usersRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data() ?? {}),
        toFirestore: (user, _) => user.toJson(),
      );

  Future attemptSignUp({
    required String email,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    if (password != passwordConfirmation) return Errors.matchError;

    try {
      fire_base_auth.UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return usersRef
          .add(User(
            userID: userCredential.user!.uid,
            email: email,
            displayName: name,
            userName: '@${name}Holberton',
          ))
          .then((value) => Errors.none)
          .catchError((onError) => Errors.error);
    } on fire_base_auth.FirebaseAuthException catch (firebaseError) {
      switch (firebaseError.code) {
        case 'email-already-in-use':
          return Errors.existsError;
        case 'weak-password':
          return Errors.weakError;
        case 'invalid-email':
          return Errors.wrongError;
        default:
          return Errors.error;
      }
    }
  }

  Future attemptLogin({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Errors.none;
    } on fire_base_auth.FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          return Errors.noUserError;
        case 'wrong-password':
          return Errors.wrongError;
        default:
          return Errors.error;
      }
    }
  }

  Future logout() async => await auth.signOut();

  Future getCurrentUserModel() async {
    QuerySnapshot querySnapshot = await usersRef.get();
    List<User>? users =
        querySnapshot.docs.map((doc) => doc.data()).cast<User>().toList();
    for (var user in users) {
      if (user.userID == auth.currentUser?.uid) return user;
    }
    return {} as User;
  }
}
