import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('温馨的家')),
      body: const Center(
        child: Text('欢迎回家, 主人'),
      ),
    );
  }
}
