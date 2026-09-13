import 'dart:async';

import 'package:flutter/material.dart';

import 'login_password_page.dart';
import 'login_phone_page.dart';
import 'otp_page.dart';
import 'splash_page.dart';
import '../home/home_page.dart';

class AuthFlowPage extends StatefulWidget {
  const AuthFlowPage({super.key});

  @override
  State<AuthFlowPage> createState() => _AuthFlowPageState();
}

class _AuthFlowPageState extends State<AuthFlowPage> {
  var _step = _AuthStep.splash;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() => _step = _AuthStep.phone);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch (_step) {
      _AuthStep.splash => const SplashPage(),
      _AuthStep.phone => LoginPhonePage(
        onContinue: () => setState(() => _step = _AuthStep.otp),
      ),
      _AuthStep.otp => OtpPage(
        onContinue: () => setState(() => _step = _AuthStep.password),
      ),
      _AuthStep.password => LoginPasswordPage(
        onLogin: () => setState(() => _step = _AuthStep.home),
      ),
      _AuthStep.home => const HomePage(showFloatingActions: true),
    };
  }
}

enum _AuthStep { splash, phone, otp, password, home }
