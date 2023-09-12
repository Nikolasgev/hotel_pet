import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 1;
    final newTextBuffer = StringBuffer();

if (newTextLength >= 1) {
  if (newValue.text.startsWith(RegExp(r'[789]'))) {
    newTextBuffer.write('+7');
    if (newValue.text.startsWith('9')) {
      newTextBuffer.write('(9');
      selectionIndex = 4;
    }
    if (newValue.selection.end >= 1) selectionIndex++;
  }
}

if (newTextLength >= 2) {
  newTextBuffer
      .write('(' + newValue.text.substring(1, usedSubstringIndex = 2));
  if (newValue.selection.end >= 2) selectionIndex++;
}
if (newTextLength >= 5) {
  newTextBuffer.write(
      newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 4) +
          ')');
  if (newValue.selection.end >= 4) selectionIndex++;
}
if (newTextLength >= 8) {
  newTextBuffer.write(
      newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 7) +
          '-');
  if (newValue.selection.end >= 7) selectionIndex++;
}
if (newTextLength >= 10) {
  newTextBuffer.write(
      newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 9) +
          '-');
  if (newValue.selection.end >= 9) selectionIndex++;
}

// Dump the rest.
if (newTextLength > usedSubstringIndex) newTextBuffer.write(newValue.text.substring(usedSubstringIndex, newTextLength));

return TextEditingValue(
  text: newTextBuffer.toString(),
  selection: TextSelection.collapsed(offset: selectionIndex),
);


}

}