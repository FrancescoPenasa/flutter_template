import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/providers/auth_provider.dart';
import '../../shared/widgets/custom_widgets.dart';
import '../forgotpwpage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  String _email = "";
  String _password = "";

  void _toggleObscurePassword() {
    logger.info("_toggleObscurePassword");
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Widget _buildUsernameField() {
    logger.info("_buildUsernameField");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingXL),
      child: Container(
        decoration: kTextFieldBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingBase),
          child: Semantics(
            label: "Input username space",
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Username",
                contentPadding: EdgeInsets.all(kPaddingBase),
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: kIconSize,
                ),
              ),
              validator: _validateUsername,
              onSaved: (value) {
                _email = value!.trim().replaceAll(" ", "");
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    logger.info("_buildPasswordField");
    return Padding(
      padding: const EdgeInsets.only(
          top: kPaddingBase, left: kPaddingXL, right: kPaddingXL),
      child: Container(
        decoration: kTextFieldBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingBase),
          child: Semantics(
            label: "Input password space",
            child: TextFormField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Password",
                hintText: "password",
                contentPadding: const EdgeInsets.all(kPaddingBase),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  size: kIconSize,
                ),
                suffixIcon: IconButton(
                  icon: (Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: kIconSize,
                  )),
                  onPressed: () {
                    _toggleObscurePassword();
                  },
                ),
              ),
              validator: _validatePassword,
              onSaved: (value) {
                _password = value!;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingXL),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Semantics(
              label: "Tasto 'hai dimenticato la password?'",
              child: TextButton(
                key: const Key('loginForgotBtn'),
                onPressed: () {
                  logger.info("Click: Forgot Password");
                  Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                },
                child: const Text(
                  "Hai dimenticato la password?",
                ),
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildUsernameField(),
            _buildPasswordField(),
            _buildForgotPasswordBtn(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPaddingXL),
              child: Semantics(
                label: "Tasto per l'accesso tramite username e password",
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      logger.info("validated");
                      _formKey.currentState!.save();
                      await authProvider.login(_email, _password);
                    } else {
                      logger.info("not validated");
                    }
                  },
                  child: const Text(
                    "Accedi", // i18n
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

String? _validateUsername(String? value) {
  logger.info("_validateUsername");
  value ??= "";
  if (value.isEmpty) {
    return "Username field empty ";
  } else {
    return null;
  }
}

String? _validatePassword(String? value) {
  logger.info("_validatePassword");
  value ??= "";
  if (value.isEmpty) {
    return "Password field empty";
  } else {
    return null;
  }
}
