import 'package:flutter/material.dart';
import 'package:flutter_playground/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _upassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _unameController.text = "hello world!";
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);

    _unameController.addListener(() {
      loggerN.i(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: Form(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _unameController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (v) {
                // loggerN.i("onChange: $v");
              },
            ),
            TextField(
              controller: _upassController,
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
