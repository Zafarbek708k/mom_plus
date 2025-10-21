import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mom_plus/core/constants/app_const.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppConst.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status >= 200 && status < 300,
  );

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: AppConst.baseUrl,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      // headers: <String, dynamic>{
      //   // 'Accept-Language': lang,
      //   // 'Device-Name': StorageRepository.getString(StoreKeys.deviceName, defValue: ''),
      //   // 'User-Agent': StorageRepository.getString(StoreKeys.userAgent, defValue: ''),
      //   // 'Device-Type': StorageRepository.getString(StoreKeys.platform, defValue: ''),
      //   // 'App-Version': StorageRepository.getString(StoreKeys.appVersion, defValue: ''),
      // },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio {
    final Dio dio = Dio(_dioBaseOptions);
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (e) {
          log(e.toString());
        },
        request: true,
        requestHeader: true,
      ),
    );

    return dio;
  }
}
