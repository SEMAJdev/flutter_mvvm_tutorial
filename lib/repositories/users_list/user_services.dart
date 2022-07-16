import 'dart:io';

import '../../models/users_list/users_list_model.dart';
import '../../utilities/constants.dart';
import 'package:http/http.dart' as http;
import '../api_status.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST_API);
      var response = await http.get(url);
      if(SUCCESS == response.statusCode){
        return Success(code: SUCCESS, response: usersModelFromJson(response.body));
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Fornat');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }

  }
}