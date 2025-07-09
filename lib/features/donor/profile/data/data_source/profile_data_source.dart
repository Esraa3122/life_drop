import 'package:life_drop/core/service/graphql/api_service.dart';
import 'package:life_drop/features/auth/data/models/user_role_response.dart';

class ProfileDataSource {
  const ProfileDataSource(this._api);

  final ApiService _api;

  //Get User Profile
  Future<UserRoleResponse> getUserInfo() async {
    final response =
        await _api.userRole();
    return response;
  }
}
