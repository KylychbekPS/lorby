import 'package:dio/dio.dart';
import 'package:flutter_application_3/core/config/url_routes.dart';

import '../../models/registr_model.dart';

class AuthRepository {
  final Dio dio;
  AuthRepository({required this.dio});

  Future<String> registr({required RegistrModel model}) async {
    final Response response = await dio.post(
      UrlRoutes.registr,
      data: model.toJson(),
    );
    return response.data["message"];
  }

  Future<String> confirmCode({required String code}) async {
    final Response response = await dio.post(
      UrlRoutes.confirmCode,
      data: {"code": code},
    );
    return response.data["message"];
  }
}
