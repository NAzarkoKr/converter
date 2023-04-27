import 'package:weather/domain/models/currency_model.dart';

abstract class ConvertRepository {
  Future<CurrencyModel> getCurrency(
      {required String from, required String to, required String amount});
}
