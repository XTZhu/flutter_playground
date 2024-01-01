import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({super.key});

  @override
  State<FocusTestRoute> createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('测试焦点Focus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              focusNode: focusNode1, //关联focusNode1
              decoration: const InputDecoration(labelText: "input1"),
            ),
            TextFormField(
              focusNode: focusNode2, //关联focusNode2
              decoration: const InputDecoration(labelText: "input2"),
            ),
            Builder(
              builder: (ctx) {
                return Column(
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("移动焦点"),
                      onPressed: () {
                        //将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        focusScopeNode ??= FocusScope.of(context);
                        focusScopeNode?.requestFocus(focusNode2);
                      },
                    ),
                    ElevatedButton(
                      child: const Text("隐藏键盘"),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
