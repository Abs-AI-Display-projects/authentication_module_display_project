
import 'package:maligali/BusinessLogic/utils/error/failure.dart';

class ValidationException extends Failure implements Exception{
  final String errorMsg;

  ValidationException(this.errorMsg) : super(errorMsg);
}