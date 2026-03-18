import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:timetable_app/core/data/config_provider.dart';

class Api {

	static const _msg400 = "400: Ошибка отправляемого запроса. Повторите попытку позже.";
	static const _msg401 = "401: Ошибка авторизации. Проверьте правильность учётных данных.";
	static const _msg404 = "404: Запрашиваемый ресурс не найден.";
	static const _msg500 = "500: Внутренняя ошибка сервера. Повторите попытку позже.";
	static const _msg502 = "502: Ошибка соединения с сервером. Повторите попытку позже.";

  static Dio dio() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      baseUrl: ConfigProvider.baseAddress,
    );

    var dio = Dio(options);
    return dio;
  }

	static Future<T?> get<T>(String route, {Map<String, dynamic>? queryParameters}) async {
		return _makeRequest(
		() => Api.dio().get(
				"${ConfigProvider.baseAddress}/$route/",
				queryParameters: queryParameters,
			)
		);
	}

	static Future<T?> post<T>(String route, {Object? body}) async {
		return _makeRequest(
		() => Api.dio().post(
				"${ConfigProvider.baseAddress}/$route/",
				data: body,
			)
		);
	}

	static Future<T?> delete<T>(String route, {Object? body}) async {
		return _makeRequest(
		() => Api.dio().delete(
				"${ConfigProvider.baseAddress}/$route/",
				data: body,
			)
		);
	}

	static Future<T?> _makeRequest<T>(Future<Response> Function() request) async {
		Response? response;
		try {
			response = await request();

			// Временно, покуда в API не будет HTTP кодов
			Map<String, dynamic> json = jsonDecode(response.toString());
			if (json["isok"] != true) {
				throw json.containsKey("msg") ? Exception(json["msg"]) : Exception();
			}

		} on DioException catch (e) {
			_handleDioException(e);
		} on Exception catch (e) {
			_throwDefault(e);
		}

		// Опять же, пока не будут добавлены HTTP коды.
		return (response.data as Map<String, dynamic>)["data"] as T;
		// return response.data as T;
	}

	static Never _handleDioException(DioException e) {
		if (e.response == null) { throw Exception(e.message ?? "нет данных об ошибке."); }
		if (e.response!.statusCode == HttpStatus.badRequest) { throw Exception(_msg400); }
		if (e.response!.statusCode == HttpStatus.unauthorized) { throw Exception(_msg401); }
		if (e.response!.statusCode == HttpStatus.notFound) { throw Exception(_msg404); }
		if (e.response!.statusCode == HttpStatus.internalServerError) { throw Exception(_msg500); }
		if (e.response!.statusCode == HttpStatus.badGateway) { throw Exception(_msg502); }
		_throwDefault();
	}

	static Never _throwDefault([Exception? e]) => throw e ?? Exception("Нет данных об ошибке.");
}
