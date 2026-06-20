import 'package:dinolog_app/view_model/stored_token_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
class CustomDio extends _$CustomDio {
  @override
  Future<Dio> build() async {
    final storeToken = await ref.watch(storedTokenProvider.future);

    final dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $storeToken';
          handler.next(options);
        },
      ),
    );
    return dio;
  }
}
