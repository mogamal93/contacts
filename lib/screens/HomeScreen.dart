import 'package:contact/model/contact_details.dart';
import 'package:contact/widgets/widget_animation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContacDetails> contactsList = [];

  void addContact(ContacDetails contact) {
    setState(() {
      contactsList.add(contact);
    });
  }

  void deleteContact(int index) {
    setState(() {
      contactsList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * .35,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: AnimationWidget(
        contactsList: contactsList,
        onContactAdded: addContact,
        onContactDeleted: deleteContact,
      ),
    );
  }
}