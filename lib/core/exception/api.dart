import 'package:bit_coin_ticket/core/exception/base.dart';

class ApiRequestFailedException extends BaseException {
  ApiRequestFailedException({int? statuscode})
      : super("Api request failed with statuscode $statuscode");
}