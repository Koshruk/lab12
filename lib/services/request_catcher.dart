import 'package:dio/dio.dart';

class RequestCatcherService{
  final Dio _dio = Dio();

  static final RequestCatcherService _instance = RequestCatcherService._internal();

  RequestCatcherService._internal();

  factory RequestCatcherService(){
    return _instance;
  }

  Future<void> sendData(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
          "https://koshruk-lab12.requestcatcher.com",
          data: data,
      );
      print("Data sent successfully! Response: ${response.statusCode}");
    } catch (e) {
      print("Failed to send data: $e");
    }
  }
}
