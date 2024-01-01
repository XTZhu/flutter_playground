import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/my_home.dart';
import 'package:flutter_playground/pages/welcome.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerN = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade100),
          useMaterial3: true,
        ),
        // as name sayd
        initialRoute: '/',
        // routes table
        routes: {
          '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          'welcome': (context) => const Welcome()
        },
        // 只会对命名路由生效
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            // String? routeName = settings.name;
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其他情况则正常打开路由。
            return Container();
          });
        });
  }
}
