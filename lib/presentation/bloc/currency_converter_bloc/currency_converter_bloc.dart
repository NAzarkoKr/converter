import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/currency_model.dart';
import 'package:weather/domain/usecases/get_currency_usecase.dart';

part 'currency_converter_event.dart';
part 'currency_converter_state.dart';

class CurrencyConverterBloc
    extends Bloc<CurrencyConverterEvent, CurrencyConverterState> {
  final GetCurrencyUsecase getCurrencyUsecase;

  CurrencyConverterBloc({required this.getCurrencyUsecase})
      : super(CurrencyConverterInitial()) {
    on<GetConvertCurrency>((event, emit) async {
      emit(CurrencyConverterLoading());
      try {
        final currency = await getCurrencyUsecase.call(
            from: event.from, to: event.to, amount: event.amount);

        emit(CurrencyConverterLoaded(currency));
      } on DioError catch (e) {
        final result = e.response!.data as Map<String, dynamic>;
        emit(CurrencyConverterFailure(result['message']));
      }
    });
  }
}
