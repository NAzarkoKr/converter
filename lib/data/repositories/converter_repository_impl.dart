import 'package:weather/data/remote_data_sources/converter_remote_data.dart';
import 'package:weather/domain/models/currency_model.dart';
import 'package:weather/domain/repository/currency_repository.dart';

class ConvertRepositoryImpl implements ConvertRepository {
  final ConverterRemoteData converterRemoteData;

  ConvertRepositoryImpl({required this.converterRemoteData});
  @override
  Future<CurrencyModel> getCurrency(
          {required String from,
          required String to,
          required String amount}) async =>
      converterRemoteData.getConvertCurrency(
          from: from, to: to, amount: amount);
}
