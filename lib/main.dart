import 'package:flutter/material.dart';
import 'package:simple_list2/ui/contactlist/contact_list_page.dart';
import 'package:simple_list2/ui/contactdetails/contact_detail_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Contact Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new ContactListPage(),
    );
  }
}

