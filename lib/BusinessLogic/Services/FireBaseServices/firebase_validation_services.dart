import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maligali/BusinessLogic/utils/error/validation_exception.dart';

class FirebaseValidationServices {
  
  static Future<bool> checkUserTokenExistence(String uid) async {
    var result =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (result.get('userToken').isNotEmpty()) {
      return true;
    } else {
      throw ValidationException('معرف المستخدم غير موجود جاري انشاء معرف جديد');
    }
  }

  static Future<bool> checkUserPhoneNumberExistence(String phoneNumber) async {
    var result = await FirebaseFirestore.instance
        .collection('users')
        .where('ownerNumber', isEqualTo: phoneNumber)
        .get();
    if (result.docs.isNotEmpty) {
      return true;
    } else {
      throw ValidationException('رقم الهاتف غير مسجل بالخدمة');
    }
  }
}
