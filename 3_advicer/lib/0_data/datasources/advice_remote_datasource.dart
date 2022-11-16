import 'dart:convert';

import 'package:advicer/0_data/models/data_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  /// Request random advice from API.
  /// Return [AdviceModel] if successful
  /// throws a server-exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse("https://api.flutter-community.com/api/v1/advice"),
        headers: {'content-type': 'application/json'});
    final responseBody = jsonDecode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
