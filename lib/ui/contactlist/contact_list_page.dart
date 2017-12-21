import 'package:flutter/material.dart';
import 'contact.dart';
import 'package:simple_list2/ui/contactdetails/contact_detail_page.dart';

class ContactListPage extends StatefulWidget {
  @override
  ContactListPageState createState() => new ContactListPageState();
}

class ContactListPageState extends State<ContactListPage> {
  List<Contact> contacts;

  @override
  void initState() {
    super.initState();
    _loadContactList();
  }

  @override
  Widget build(BuildContext context) {
    var view;
    if (contacts.isEmpty) {
      view = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      view = new ListView.builder(
        itemCount: contacts.length,
        itemBuilder: _buildItem,
      );
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Contact List"),
        ),
        body: view
    );
  }

  /// Create row for list
  _buildItem(BuildContext context, int position) {
    Contact contact = contacts[position];
    return new ListTile(
      onTap: () => _navigateToFriendDetails(contact),
      leading: new CircleAvatar(
        child: new Text(contact.name[0]),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
      title: new Text(contact.name),
      subtitle: new Text(contact.email),
    );
  }

  _navigateToFriendDetails(Contact contact) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new ContactDetailsPage(contact);
        },
      ),
    );
  }

  /// crate dummy contact list
  _loadContactList() async {
    contacts = <Contact>[
      new Contact("John", "john@example.com"),
      new Contact("Stock", "stock@example.com"),
      new Contact("Ponting", "ponting@example.com"),
      new Contact("Mike", "mike@example.com"),
      new Contact("Arnold", "arnold@example.com"),
      new Contact("Lara", "lara@example.com"),
      new Contact("Andy", "andy@example.com"),
      new Contact("Steve", "steve@example.com"),
      new Contact("Shakira", "shakira@example.com"),
      new Contact("Mark", "mark@example.com"),
      new Contact("Lee", "lee@example.com"),
      new Contact("Watson", "watson@example.com"),
      new Contact("Jonson", "jonson@example.com"),
    ];

    setState(() {});
  }
}