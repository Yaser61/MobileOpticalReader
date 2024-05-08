import 'package:flutter/material.dart';
import 'package:mobile_optical_reader/pages/exam/exam_page.dart';
import 'package:mobile_optical_reader/pages/exam/exam_view_model.dart';
import 'package:provider/provider.dart';


class ExamProvider extends StatelessWidget {
  const ExamProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ExamViewModel();
      },
      child: const ExamPage(),
    );
  }
}