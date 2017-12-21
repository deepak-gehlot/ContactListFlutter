import 'package:flutter/material.dart';
import 'package:simple_list2/ui/contactdetails/Choice.dart';
import 'package:simple_list2/ui/contactlist/contact.dart';

class ContactDetailsPage extends StatefulWidget {

  final Contact contact;

  ContactDetailsPage(this.contact);

  @override
  ContactDetailsPageState createState() => new ContactDetailsPageState();
}

class ContactDetailsPageState extends State<ContactDetailsPage> {

  List<Choice> choices;

  @override
  void initState() {
    super.initState();
    _createMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.contact.name),
        actions: <Widget>[
          new IconButton( // action button
            icon: new Icon(choices[0].icon, color: Colors.white,),
            onPressed: null,
          ),
          new IconButton( // action button
            icon: new Icon(choices[1].icon, color: Colors.white,),
            onPressed: null,
          ),
          new PopupMenuButton<Choice>(
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                    child: new Text(choice.title),
                    value: choice,
                  );
                }).toList();
              }
          )
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _imageContainer(),
            _itemRow(Icons.email, "test@example.com"),
            _itemRow(Icons.call, "8827987615")
          ],
        ),
      ),
    );
  }

  _createMenuList() {
    choices = [
      new Choice("Edit", Icons.edit),
      new Choice("Delete", Icons.delete),
      new Choice("Share", Icons.share)
    ];
  }

  Widget _imageContainer() {
    return new Container(
      color: Colors.red,
      child: new Center(
        child: new Icon(Icons.person, size: 250.0, color: Colors.white),
      ),
    );
  }

  Widget _itemRow(IconData icon, String title) {
    return new Container(
      margin: const EdgeInsets.all(16.0),
      child: new Card(
          child: new Padding(padding: const EdgeInsets.all(16.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Icon(icon, color: Colors.red[400],),
                new Expanded(child: new Text(title)),
                new Icon(Icons.message, color: Colors.red[400],),
              ],
            ),
          )
      ),
    );
  }
}