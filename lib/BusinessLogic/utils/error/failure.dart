import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errorMsg);

  factory FirebaseFailure.firebaseAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case "ERROR_INVALID_PHONE_NUMBER":
        return FirebaseFailure("ادخل رقم هاتف صحيح");
      case "ERROR_MISSING_VERIFICATION_CODE":
        return FirebaseFailure("حدث خطأ اعد المحاولة ");
      case "ERROR_INVALID_VERIFICATION_CODE":
        return FirebaseFailure("رمز تحقق خاطئ");
      case "ERROR_MISSING_VERIFICATION_ID":
        return FirebaseFailure("انتهت صلاحية رمز التحقق");
      case "ERROR_INVALID_VERIFICATION_ID":
        return FirebaseFailure("رمز تحقق خاطئ");
      case "ERROR_SESSION_EXPIRED":
        return FirebaseFailure("انهت الجلسة حاول لاحقا");
      case "ERROR_QUOTA_EXCEEDED":
        return FirebaseFailure("تم تخطي عدد محاولات التحقق اليوم حاول لاحقاً");
      case "ERROR_APP_NOT_VERIFIED":
        return FirebaseFailure("حدثت مشكلة يرجى معاودة المحاولة لاحقاً");
      case "auth/captcha-check-failed":
        return FirebaseFailure("يرجى التأكد من عملية التحقق");
      default:
        return FirebaseFailure("حدث خطأ إعد المحاولة لاحقاً");
    }
  }



  // refrance => https://firebase.flutter.dev/docs/storage/handle-errors/
  factory FirebaseFailure.firebaseFireStoreException(FirebaseException error) {
    switch (error.code.toUpperCase()) {
      case 'STORAGE/UNKNOWN':
        return FirebaseFailure('حدث خطأ غير متوقع');
      case 'STORAGE/OBJECT-NOT-FOUND':
        return FirebaseFailure('لم نستطع الوصول الى البيانات المطلوبة');
      case 'STORAGE/BUCKET-NOT-FOUND':
        return FirebaseFailure('حدث خطأ في الوصول الى حزمة البيانات');
      case 'STORAGE/PROJECT-NOT-FOUND':
        return FirebaseFailure('تعذر الوصول الى قاعدة البيانات');
      case 'STORAGE/QUOTA-EXCEEDED':
        return FirebaseFailure('لقد تم تخطي حد طلبات البيانات حاول لاحقاً');
      case 'STORAGE/UNAUTHENTICATED':
        return FirebaseFailure(
            'غير مسموح لك بالوصول الى قاعدة البيانات الرجاء اعادة مصادقة  الحساب');
      case 'STORAGE/UNAUTHORIZED':
        return FirebaseFailure(
            'ليس لديك الصلاحيات اللازمة للوصول لتلك الملفات');
      case 'STORAGE/RETRY-LIMIT-EXCEEDED':
        return FirebaseFailure(
            'لقد تخطيت عدد محاولات  اعادة المحاولة الرجاء عاود المحاولة لاحقاً');
      case 'STORAGE/INVALID-CHECKSUM':
        return FirebaseFailure('حاول رفع الملفات مجدداً');
      case 'STORAGE/CANCELED':
        return FirebaseFailure('لقد تم الغاء العملية من طرفك');
      case 'STORAGE/INVALID-EVENT-NAME':
        return FirebaseFailure('حدث غير متوقع');
      case 'STORAGE/INVALID-URL':
        return FirebaseFailure('رابط غير صحيح');
      case 'STORAGE/INVALID-ARGUMENT':
        return FirebaseFailure('محاولة ادخل ملف غير مدعوم');
      case 'STORAGE/SERVER-FILE-WRONG-SIZE':
        return FirebaseFailure('حجم الملف خاطئ ');
      default:
        return FirebaseFailure('خطأ غير معروف الرجاء ابلاغنا بالمشكلة');
    }
  }
}
