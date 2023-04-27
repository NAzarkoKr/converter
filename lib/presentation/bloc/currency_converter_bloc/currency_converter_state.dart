part of 'currency_converter_bloc.dart';

abstract class CurrencyConverterState extends Equatable {
  const CurrencyConverterState();

  @override
  List<Object> get props => [];
}

class CurrencyConverterInitial extends CurrencyConverterState {
  @override
  List<Object> get props => [];
}

class CurrencyConverterLoading extends CurrencyConverterState {
  @override
  List<Object> get props => [];
}

class CurrencyConverterLoaded extends CurrencyConverterState {
  final CurrencyModel currencyConverterData;

  const CurrencyConverterLoaded(this.currencyConverterData);

  @override
  List<Object> get props => [currencyConverterData];
}

class CurrencyConverterFailure extends CurrencyConverterState {
  final String errorMessage;

  const CurrencyConverterFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
