import 'package:firebase_auth/firebase_auth.dart';
import 'package:maligali/BusinessLogic/utils/error/failure.dart';

import '../error/validation_exception.dart';

List<String> splitLogLatForShopGPSLocation(String shopGPSLocation) {
  return shopGPSLocation.split('-');
}

String gatherLogLatForShopGPSLocation(
    {required String lng, required String lat}) {
  return lat + "-" + lng;
}

Failure failureFunction(Object e) {
  switch (e.runtimeType) {
    case FirebaseAuthException:
      return FirebaseFailure.firebaseAuthException(e as FirebaseAuthException);
    case FirebaseException:
      return FirebaseFailure.firebaseFireStoreException(e as FirebaseException);
    case ValidationException:
      return e as ValidationException;
    default:
      return FirebaseFailure(e.toString());
  }
}
