import 'package:life_drop/core/language/lang_keys.dart';
import 'package:life_drop/core/service/graphql/api_result.dart';
import 'package:life_drop/core/utils/app_strings.dart';
import 'package:life_drop/features/auth/data/data_source/auth_data_source.dart';
import 'package:life_drop/features/auth/data/models/login_request_body.dart';
import 'package:life_drop/features/auth/data/models/login_response.dart';
import 'package:life_drop/features/auth/data/models/sign_up_request_body.dart';
import 'package:life_drop/features/auth/data/models/sign_up_response.dart';
import 'package:life_drop/features/auth/data/models/user_role_response.dart';

class AuthRepos {
  const AuthRepos(this._dataSource);
  final AuthDataSource _dataSource;

  //Loign
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body: body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }

  //Get User Role
  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);
    return response;
  }

  //SignUp
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      final response = await _dataSource.signUp(body: body);

      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }

  // add user id in firebase to used with notfication data base
  Future<void> addUserIdFirebase({required String userId}) async {
    await _dataSource.addUserIdFirebase(userId: userId);
  }
}
