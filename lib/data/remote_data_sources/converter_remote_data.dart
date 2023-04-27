import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/const.dart';
import 'package:weather/domain/models/currency_model.dart';

class ConverterRemoteData {
  final client = Dio();
  Future<CurrencyModel> getConvertCurrency(
      {required String from,
      required String to,
      required String amount}) async {
    final response = await client
        .get("$converterUrl/convert?from=$from&to=$to&amount=$amount");
    if (response.statusCode == 200) {
      return CurrencyModel.fromJson(response.data);
    } else {
      throw Exception(json.decode(response.data)['error']['message']);
    }
  }
}
