import 'package:flutter/cupertino.dart';
import 'package:mobile_optical_reader/base/base_view_model.dart';

class ExamViewModel extends BaseViewModel {
  List<String> lessons = [
    "Bil-407",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
    "Bil-400",
  ];

  ValueNotifier<String> chooseOpticForm = ValueNotifier('Form1');

  List<String> opticForms = ['Form1', 'Form2', 'Form3', 'Form4'];
}
