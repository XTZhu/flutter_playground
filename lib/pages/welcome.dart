import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/my_home.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    // 可以改成 widget 传参
    // 在定义 MaterialApp 中添加 routes 配置
    // return TipRoute(text: ModalRoute.of(context)!.settings.arguments);
    MissMaid args = ModalRoute.of(context)?.settings.arguments as MissMaid;
    return Scaffold(
      appBar: AppBar(title: const Text('温馨的家')),
      body: Center(
        child: Text('欢迎回家, 主人。我是你的女仆 ${args.age} 岁的 ${args.name} 酱'),
      ),
    );
  }
}
