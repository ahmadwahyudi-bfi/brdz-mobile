import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends TextInputFormatter {
  CurrencyFormatter({required this.currencyFormat});

  final NumberFormat currencyFormat;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final numberValue = int.tryParse(newValue.text);
    var formattedValue = numberValue == null
        ? ''
        : currencyFormat.format(int.tryParse(newValue.text) ?? 0);
    int selectionIndexFromTheRight = 0;
    if (formattedValue == oldValue.text) {
      final selectionIndex = oldValue.selection.end - 2;
      final trimmedValue =
          formattedValue.substring(0, selectionIndex) +
              formattedValue.substring(selectionIndex + 1);
      try {
        final parsedTrimmedValue = currencyFormat.parse(trimmedValue);
        final formattedTrimmedValue = currencyFormat.format(parsedTrimmedValue);
        formattedValue = formattedTrimmedValue;
        selectionIndexFromTheRight =
            oldValue.text.length - oldValue.selection.end;
      } on FormatException {
        formattedValue = '';
        selectionIndexFromTheRight = 0;
      }
    } else {
      selectionIndexFromTheRight =
          oldValue.text.length - oldValue.selection.end;
    }

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: formattedValue.length - selectionIndexFromTheRight,
      ),
    );
  }

  static final indonesianRupiah = CurrencyFormatter(
    currencyFormat: indonesianRupiahFormat,
  );

  static final indonesianNoSymbolRupiah = CurrencyFormatter(
    currencyFormat: indonesianRupiahNoSymbolFormat,
  );

  static final indonesianRupiahFormat = NumberFormat.currency(
    locale: 'id',
    name: 'IDR',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static final indonesianRupiahFormatNoSpace = NumberFormat.currency(
    locale: 'id',
    name: 'IDR',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  static final indonesianRupiahFormatNoRounding = NumberFormat.currency(
    locale: 'id',
    name: 'IDR',
    symbol: 'Rp ',
    decimalDigits: 1,
  );

  static final indonesianRupiahNoSymbolFormat = NumberFormat.currency(
    locale: 'id',
    name: 'IDR',
    decimalDigits: 0,
    symbol: '',
  );

  static final decimalFormat = NumberFormat('#,##0.##');
}
