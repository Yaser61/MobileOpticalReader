import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'home_view_model.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return HomeViewModel();
      },
      child: const HomePage(),
    );
  }
}