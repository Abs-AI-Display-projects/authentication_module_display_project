import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:maligali/BusinessLogic/Models/auth_owner_model.dart';
import 'package:maligali/BusinessLogic/Services/FireBaseServices/firebase_phone_auth_helper.dart';
import 'package:maligali/BusinessLogic/Services/FireBaseServices/firebase_validation_services.dart';
import 'package:maligali/BusinessLogic/utils/error/validation_exception.dart';
import 'package:maligali/BusinessLogic/utils/function/helper_function.dart';
import 'package:maligali/BusinessLogic/utils/shareable%20_data.dart';
import '../../Models/store_owner_model.dart';
import '../../utils/error/failure.dart';
import '../../utils/flutter_secure_storage_functions.dart';
import '../../view_models/subscriptions_view_model.dart';
import 'auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebasePhoneAuthHelper phoneAuthHelper;
  final FirebaseFirestore firestore;
  final FirebaseMessaging firebaseMessaging;
  AuthRepoImplementation(
      this.phoneAuthHelper, this.firestore, this.firebaseMessaging);

  @override
  Future<Either<Failure, bool>> signup(AuthUserModel owner) async {
    // TODO: implement signup

    try {
      String? userToken = await FirebaseMessaging.instance.getToken();
      await firestore.collection('users').doc(owner.uid).set(owner.toJson());
      ShareableData.authUserModel = owner;
      await storeUIDAndPhoneNumberInStorage(owner.uid, owner.storeOwnerNumber);
      await SubscriptionsViewModel().initializeFreeTrialSubscription();
      return right(true);
    } catch (e) {
      return left(failureFunction(e));
    }
  }

  @override
  Future<Either<Failure, bool>> login(String phone, String uid) async {
    // TODO: implement login
    try {
      String? userFCMToken = await firebaseMessaging.getToken();
      var doc = await firestore.collection('users').doc(uid).get();
      if (doc.get('userToken') != userFCMToken) {
        await doc.reference.update({'userToken': userFCMToken});
      }
      ShareableData.authUserModel = AuthUserModel.fromDocumentSnapshot(doc);
      await storeUIDAndPhoneNumberInStorage(uid, phone);
      await SubscriptionsViewModel().setSubscriptionDataInMemoryOnSignIn(uid);
      return right(true);
    } catch (e) {
      return left(failureFunction(e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserPhoneNumberExistence(
      String phone) async {
    try {
      await FirebaseValidationServices.checkUserPhoneNumberExistence(phone);
      return right(true);
    } catch (e) {
      return left(failureFunction(e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserTokenExistence(String uid) async {
    try {
      await FirebaseValidationServices.checkUserTokenExistence(uid);
      return right(true);
    } catch (e) {
      return left(failureFunction(e));
    }
  }

  @override
  Future<Either<Failure, String>> sendVerificationCode(
      String phoneNumber) async {
    try {
      String? verificationId =
          await phoneAuthHelper.sendVerificationCode(phoneNumber);

      if (verificationId != null || verificationId!.isNotEmpty) {
        return right(verificationId);
      } else {
        throw ValidationException('حدث خطأ اثناء ارسال كود التحقق حاول لاحقاً');
      }
    } catch (e) {
      var x = e;
      return left(failureFunction(e));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    try {
      await phoneAuthHelper.signInWithPhoneNumber(verificationId, smsCode);
      return right(true);
    } catch (e) {
      return left(failureFunction(e));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      clearStorageAttributes();
      clearTokenAndData();
      StoreOwner().clearOwnerData();
      return right(true);
    } catch (e) {
      return left(failureFunction(e));
    }
  }
}
