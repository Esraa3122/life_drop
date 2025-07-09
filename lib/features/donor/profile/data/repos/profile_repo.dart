import 'package:life_drop/core/service/graphql/api_result.dart';
import 'package:life_drop/core/utils/app_strings.dart';
import 'package:life_drop/features/auth/data/models/user_role_response.dart';
import 'package:life_drop/features/donor/profile/data/data_source/profile_data_source.dart';

class ProfileRepo {
  const ProfileRepo(this._dataSource);

  final ProfileDataSource _dataSource;

  //Get User Profile
  Future<ApiResult<UserRoleResponse>> getUserProfile() async {
    try {
      final response = await _dataSource.getUserInfo();
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
