part of 'currency_converter_bloc.dart';

abstract class CurrencyConverterEvent extends Equatable {
  const CurrencyConverterEvent();

  @override
  List<Object> get props => [];
}

class GetConvertCurrency extends CurrencyConverterEvent {
  final String from;
  final String to;
  final String amount;

  const GetConvertCurrency(
      {required this.from, required this.to, required this.amount});

  @override
  List<Object> get props => [from, to, amount];
}
