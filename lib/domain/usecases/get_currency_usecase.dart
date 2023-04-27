import 'package:weather/domain/models/currency_model.dart';
import 'package:weather/domain/repository/currency_repository.dart';

class GetCurrencyUsecase {
  final ConvertRepository convertRepository;

  GetCurrencyUsecase({required this.convertRepository});

  Future<CurrencyModel> call(
          {required String from, required String to, required String amount}) =>
      convertRepository.getCurrency(from: from, to: to, amount: amount);
}
