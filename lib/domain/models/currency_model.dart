class CurrencyModel {
  final double value;

  CurrencyModel(this.value);

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      json['result']?.toDouble() ?? 0.0,
    );
  }
}
