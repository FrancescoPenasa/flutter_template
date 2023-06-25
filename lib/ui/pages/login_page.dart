import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/assets.dart';
import 'login/form.dart';

StatelessWidget

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    logger.info('loginpage');

    return Stack(children: [
      Positioned.fill(
        child: Image.asset(
          R.jpgImages.bg_login_opaque,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: 0,
        top: 0,
        left: 0,
        right: 0,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: kPaddingBase,
                  ),
                  Text(
                    "SUBMIT",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: kPaddingM),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    ]);
  }
}
