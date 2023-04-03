import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../main.dart';

void kSuccessDialog({String? title, String? desc, Widget? btnOk}) async {
  BuildContext context = navigatorKey.currentContext!;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    title: title ?? "Info",
    desc: desc ?? "Success.",
    btnOk: btnOk ?? ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  ).show();
}

void kErrorDialog({String? title, String? desc, Widget? btnOk}) async {Ø
logger.error(desc ?? "ERROR");
  BuildContext context = navigatorKey.currentContext!;
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    title: title ?? "Error",
    desc: desc ?? "Error.",
    btnOk: btnOk ?? ElevatedButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  ).show();
}
