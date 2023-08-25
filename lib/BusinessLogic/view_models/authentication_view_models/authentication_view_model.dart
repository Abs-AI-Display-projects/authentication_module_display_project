import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:maligali/BusinessLogic/Services/FireBaseServices/firebase_phone_auth_helper.dart';
import 'package:maligali/BusinessLogic/data/auth_repo/auth_repo.dart';
import 'package:maligali/BusinessLogic/data/auth_repo/auth_repo_implementation.dart';
import 'package:maligali/BusinessLogic/utils/globalSnackBar.dart';
import '../../Models/auth_owner_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthenticationServices extends ChangeNotifier {
  final AuthRepo _authRepo = AuthRepoImplementation(FirebasePhoneAuthHelper(),
      FirebaseFirestore.instance, FirebaseMessaging.instance);
  String previousRoute = '';
  String smsCode = "";
  String vreficationID = '';
  AuthUserModel? authUserModel;

  Future<bool> checkUserPhoneNumberExistence(String phone) async {
    bool phoneNumberExist = false;
    var result = await _authRepo.checkUserPhoneNumberExistence(phone);
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      phoneNumberExist = false;
    }, (value) {
      phoneNumberExist = value;
    });

    return phoneNumberExist;
  }

  Future<bool> checkUserTokenExistence(String uid) async {
    bool userTokenExistence = false;
    var result = await _authRepo.checkUserTokenExistence(uid);
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      userTokenExistence = false;
    }, (value) {
      userTokenExistence = value;
    });
    return userTokenExistence;
  }

  Future<String?> sendVerificationCode(String phoneNumber) async {
    String? verificationID;
    var result = await _authRepo.sendVerificationCode(phoneNumber);
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      verificationID = null;
    }, (value) {
      verificationID = value;
      this.vreficationID = value;
    });
    return verificationID;
  }

  Future<bool> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    bool isSignIn = false;
    var result = await _authRepo.signInWithPhoneNumber(verificationId, smsCode);
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      isSignIn = false;
    }, (value) {
      isSignIn = value;
    });
    return isSignIn;
  }

  Future<bool> login(String phone, String uid) async {
    bool canLogin = false;
    var result = await _authRepo.login(phone, uid);
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      canLogin = false;
    }, (value) {
      canLogin = value;
    });

    return canLogin;
  }

  Future<bool> logout() async {
    bool isLogedOut = false;
    var result = await _authRepo.logout();
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      isLogedOut = false;
    }, (value) {
      isLogedOut = value;
    });

    return isLogedOut;
  }

  Future<bool> signup(AuthUserModel owner) async {
    bool cansSignup = false;
    var result = await _authRepo.signup(owner);
    result.fold((failure) {
      displaySnackBar(text: failure.errorMsg);
      cansSignup = false;
    }, (value) {
      cansSignup = value;
    });

    return cansSignup;
  }
}
