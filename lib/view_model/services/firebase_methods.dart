import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FireBaseFunctions {
  var variable;
  Future<dynamic> createUser({
    context,
    int? docID,
    String? userName,
    int? userID,
    String? userProfile,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // final userData = Provider.of<UserProfileProvider>(context, listen: false);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      // dynamic user = (await auth.createUserWithEmailAndPassword(
      //         email: userEmail!, password: '12345678'))
      // .user;
      // if (user != null) {
      // universalProvider.setStoredataonFireBase(true);
      // debugPrint('Account Created successfully');

      ///
      // await _firestore
      //   .collection('chatroom')
      //   .doc(widget.chatRoomId)
      //   .collection('chats')
      //   .add(messages);
      ///

      // user.updateProfile(displayName: '$userName');
      getFirebaseDocument(docID, userName, userID, userProfile);
      // await firestore
      //     .collection('allusers')
      //     .doc(docID.toString())
      //     .collection('user')
      //     .add({
      //   "name": userName,
      //   "id": userID,
      // });
      return 'user';
      // } else {
      //   debugPrint('Account Creation Failed');
      // }
    } catch (signUpError) {
      debugPrint('catch exception occur');
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// `foo@bar.com` has alread been registered.
        }
      }
    }
  }

  Future<dynamic> createUserwithEmail({
    context,
    String? userEmail,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      dynamic user = (await auth.createUserWithEmailAndPassword(
              email: userEmail!, password: '12345678'))
          .user;
      if (user != null) {
        return 'user';
      } else {
        debugPrint('Account Creation Failed');
      }
    } catch (signUpError) {
      debugPrint('catch exception occur');
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// `foo@bar.com` has alread been registered.
        }
      }
    }
  }

  Future<void> loginUser({
    context,
    String? userEmail,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // final userData = Provider.of<UserProfileProvider>(context, listen: false);
    try {
      dynamic user = (await auth.signInWithEmailAndPassword(
              email: '$userEmail', password: '12345678'))
          .user;
      if (user != null) {
        debugPrint('Account Login successfully');
        return user;
      } else {
        debugPrint('Account Login Failed');
      }
    } catch (signUpError) {
      debugPrint('catch exception occur In Login');
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// `foo@bar.com` has alread been registered.
        }
      }
    }
  }

  Future<void> logoutUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (auth.currentUser != null) {
        await auth.signOut();
        debugPrint('Sign Out From Firebase');
      } else {
        debugPrint('No User is Signed In');
      }
    } catch (signOutError) {
      debugPrint('catch exception occur In Logout');
      if (signOutError is PlatformException) {}
    }
  }

  Future getFirebaseDocument(
    int? docID,
    String? userName,
    int? userID,
    String? userProfile,
  ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    variable = (await FirebaseFirestore.instance
            .collection('allusers')
            .doc(docID.toString())
            .get())
        .exists;

    debugPrint('variable');
    debugPrint(variable.toString());
    if (variable == false) {
      debugPrint('Account Created successfully');
      await firestore
          .collection('allusers')
          .doc(docID.toString())
          .collection('user')
          .doc(userID.toString())
          .set({
        "name": userName,
        "id": userID,
        "status": 'null',
        "profile": '.png',
      });
      await firestore
          .collection('allusers')
          .doc(docID.toString())
          .collection('chatcount')
          .doc(docID.toString())
          .set({
        "count": '0',
      });
    }
  }

  Future CreateOneUser({
    context,
    String? userName,
    int? userID,
    String? userProfile,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    variable = (await FirebaseFirestore.instance
            .collection('users')
            .doc(userID.toString())
            .get())
        .exists;

    debugPrint('variable');
    debugPrint(variable.toString());
    if (variable == false) {
      debugPrint('Account Created successfully');
      await firestore.collection('users').doc(userID.toString()).set({
        "name": userName,
        "id": userID.toString(),
        "status": 'null',
        "profile": '.png',
      });
    }
  }
}
