// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';

import '../../base/error/dio_exception.dart';
import '../../constants/app/app_constant.dart';
import '../../constants/enums/authorization_constants_enum.dart';
import '../app_state/app_state.dart';
import 'dio_client.dart';

class DioManager {
  static DioManager? _instance;
  static DioManager get instance {
    return _instance ??= DioManager.init();
  }

  DioManager.init();


  DioClient IbbNetworkClient = DioClient(baseUrl: AppConstants.BASE_URL);
  

  DioClient TKMNetworkClient = DioClient(
      baseUrl: AppConstants.BASE_URL,
      interceptorsWrapper: InterceptorsWrapper(onRequest: (options, handler) async {
        String accessToken = AppStateManager.instance.accessToken;
        if (AppStateManager.instance.isDevelop && accessToken.isNotEmpty) {
          options.headers.putIfAbsent(AuthorizationConstants.authorization.value(),
              () => AuthorizationConstants.bearer.value(accessToken: accessToken));
        }
        options.contentType = Headers.formUrlEncodedContentType;
        return handler.next(options);
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioError e, handler) {
        throw DioException.fromDioError(e);
      })
      );
}