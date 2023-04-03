import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_market/core/providers/auth_provider.dart';
import 'package:social_market/ui/pages/loginpage.dart';
import 'package:social_market/ui/pages/operator_homepage.dart';
import 'package:social_market/ui/pages/user_homepage.dart';

import '../../constants.dart';
import 'changepasswordpage.dart';

/// HomePage is the first page where the user land after opening and initializing
/// the app. In this page we retrieve the jwt, keep it in cache, and redirect
/// the user to the first page that have to be shown.
/// LoginPage, UserHomePage, OperatorHomePage
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    logger.info('homepage');
    return const Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration.zero, () {
      Provider.of<AuthProvider>(context, listen: false).fetchData();
    });
  }

  void switchPage(UserRole role) async {
    if (role == UserRole.user) {
      Future.microtask(() => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserHomePage())));
    } else if (role == UserRole.operator) {
      Future.microtask(() => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OperatorHomePage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (authProvider.jwt == "") {
      return const LoginPage();
    }

    switchPage(authProvider.role);
    return Center(
      child: Column(children: const [
        Text("Loading Page"),
        CircularProgressIndicator()
      ]),
    );
  }
}
