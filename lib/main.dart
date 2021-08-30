import 'package:flutter/material.dart';
import 'package:new_provider/pages/tabs_page.dart';
import 'package:new_provider/services/news_service.dart';
import 'package:new_provider/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new NewsService()
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage()
      ),
    );
  }
}