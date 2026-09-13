import 'package:flutter/material.dart';

import 'base/theme/app_theme.dart';
import 'features/presentation/pages/auth/auth_flow_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dong A App',
      theme: AppTheme.light(),
      home: const AuthFlowPage(),
    );
  }
}
