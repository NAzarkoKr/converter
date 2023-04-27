import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';
import 'package:weather/presentation/widgets/button.dart';
import 'package:weather/presentation/widgets/text_field.dart';

class ConvertHome extends StatefulWidget {
  const ConvertHome({super.key});

  @override
  State<ConvertHome> createState() => _ConvertHomeState();
}

class _ConvertHomeState extends State<ConvertHome> {
  String _fromCurrencyCode = "USD";

  String _toCurrencyCode = "EUR";

  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: resultWidget(),
            ),
            CustomTextField(
              hintText: "Currency",
              controller: _editingController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          setState(() {
                            _fromCurrencyCode = currency.code;
                          });
                        },
                      );
                    },
                    child: currencyItemWidget(_fromCurrencyCode)),
                GestureDetector(
                    onTap: () {
                      showCurrencyPicker(
                        context: context,
                        showFlag: true,
                        showCurrencyName: true,
                        showCurrencyCode: true,
                        onSelect: (Currency currency) {
                          setState(() {
                            _toCurrencyCode = currency.code;
                          });
                        },
                      );
                    },
                    child: currencyItemWidget(_toCurrencyCode)),
              ],
            ),
            CustomButton(
                onPressed: () => context.read<CurrencyConverterBloc>().add(
                    GetConvertCurrency(
                        from: _fromCurrencyCode,
                        to: _toCurrencyCode,
                        amount: _editingController.text))),
          ],
        ),
      ),
    );
  }

  Widget currencyItemWidget(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue)),
      child: Row(
        children: <Widget>[const Icon(Icons.keyboard_arrow_down), Text(text)],
      ),
    );
  }

  Widget resultWidget() {
    return BlocBuilder<CurrencyConverterBloc, CurrencyConverterState>(
      builder: (BuildContext context, CurrencyConverterState state) {
        if (state is CurrencyConverterLoaded) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${state.currencyConverterData.value.toStringAsFixed(2)} $_toCurrencyCode',
                style: const TextStyle(fontSize: 35),
              ),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "0.0 $_toCurrencyCode",
              style: const TextStyle(fontSize: 35),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
}
