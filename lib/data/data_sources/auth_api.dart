import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rockettest/data/models/auth_response_model.dart';
part 'auth_api.g.dart';

@lazySingleton
@RestApi(baseUrl: "https://reqres.in/api/")
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/login")
  Future<AuthResponseModel> login(@Body() Map<String, dynamic> body);

  @POST("/register")
  Future<AuthResponseModel> register(@Body() Map<String, dynamic> body);
}
