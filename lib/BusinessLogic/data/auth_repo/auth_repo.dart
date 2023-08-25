import 'package:dartz/dartz.dart';

import '../../Models/auth_owner_model.dart';
import '../../Models/store_owner_model.dart';
import '../../utils/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> signup(AuthUserModel owner);
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, bool>> login(String phone , String uid);
  Future<Either<Failure, bool>> checkUserTokenExistence(String uid);
  Future<Either<Failure, bool>> checkUserPhoneNumberExistence(String phone);
  Future<Either<Failure, String>> sendVerificationCode(String phoneNumber);
  Future<Either<Failure, bool>> signInWithPhoneNumber(
      String verificationId, String smsCode);

   
}
