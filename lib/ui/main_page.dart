import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("APPBAR")),
        body: SafeArea(
          child: Center(
            child: Text("BODY"),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/firstPath');
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
