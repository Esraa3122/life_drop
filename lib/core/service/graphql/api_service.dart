import 'package:dio/dio.dart';
import 'package:life_drop/core/app/upload_image/model/upload_image_response.dart';
import 'package:life_drop/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:life_drop/features/admin/dashboard/data/models/porducts_number_response.dart';
import 'package:life_drop/features/admin/dashboard/data/models/users_number_response.dart';
import 'package:life_drop/features/admin/users/data/models/get_all_users_response.dart';
import 'package:life_drop/features/auth/data/models/login_response.dart';
import 'package:life_drop/features/auth/data/models/sign_up_response.dart';
import 'package:life_drop/features/auth/data/models/user_role_response.dart';

import 'package:retrofit/http.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(graphql)
  Future<LoginResponse> login(
    @Body() Map<String, dynamic> mutation,
  );

  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();

  @POST('/api/v1/files/upload')
  Future<UploadImageResourse> uploadImage(
    @Body() FormData file,
  );

  @POST(graphql)
  Future<SignUpResponse> signUp(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphql)
  Future<ProductsNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<CategoriesNumberResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<UsersNumberResponse> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );


  @POST(graphql)
  Future<GetAllUsersResponse> getAllUsers(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<void> deleteUser(
    @Body() Map<String, dynamic> mutation,
  );

//   // @POST(graphql)
//   // Future<BannersResponse> getBanners(
//   //   @Body() Map<String, dynamic> query,
//   // );

//   // @POST(graphql)
//   // Future<ProductDetailsResponse> productDetails(
//   //   @Body() Map<String, dynamic> query,
//   // );

//   // @POST(graphql)
//   // Future<GetAllProductResponse> getCategory(
//   //   @Body() Map<String, dynamic> query,
//   // );

//   // @POST(graphql)
//   // Future<GetAllProductResponse> getProductsViewAll(
//   //   @Body() Map<String, dynamic> query,
//   // );

//   // @POST(graphql)
//   // Future<GetAllProductResponse> searchProduct(
//   //   @Body() Map<String, dynamic> query,
//   // );
}
