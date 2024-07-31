import 'package:get/get.dart';

class TextFieldController extends GetxController {
  final _text = ''.obs;
  String get text => _text.value;
  set text(String value) => _text.value = value;

  final _isError = false.obs;
  bool get isError => _isError.value;
  set isError(bool value) => _isError.value = value;

  void validateAndSubmit() {
    if (text.isEmpty) {
      isError = true;
    } else {
      isError = false;
      // Do something with the text, e.g., submit the form
      print('Submitted text: $text');
    }
  }

  void clearText() {
    text = '';
  }
}
