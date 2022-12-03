import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/users_list_model.dart';
import 'api_status.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (SUCCESS == response.statusCode) {
        return Success(
          response: userListModelFromJson(response.body),
        );
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
