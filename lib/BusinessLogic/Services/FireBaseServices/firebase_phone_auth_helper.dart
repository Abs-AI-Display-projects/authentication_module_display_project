import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:maligali/BusinessLogic/utils/error/validation_exception.dart';

class FirebasePhoneAuthHelper {
  String? _verificationId;
  PhoneAuthCredential? _credential;
  bool isOTPTimeOut = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Completer<String?> completer = Completer<String?>();

  void _verificationCompleted(PhoneAuthCredential credential) async {
    _credential = credential;
  }

  void _verificationFailed(FirebaseAuthException exception) {
    completer.completeError(exception);
  }

  void _codeSent(String verificationId, int? resendToken) async {
    _verificationId = verificationId;
    completer.complete(verificationId);
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    isOTPTimeOut = true;
  }

  Future<String?> sendVerificationCode(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
        timeout: Duration(seconds: 60));

    return await completer.future;
  }

  Future<bool> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return true;
  }
}
