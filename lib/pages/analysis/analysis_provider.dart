import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Analysis_page.dart';
import 'analysis_view_model.dart';


class AnalysisProvider extends StatelessWidget {
  const AnalysisProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AnalysisViewModel();
      },
      child: const AnalysisPage(),
    );
  }
}