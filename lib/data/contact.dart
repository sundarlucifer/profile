import 'package:flutter/material.dart';

class ContactItem{
  String title;
  String content;
  IconData icon;

  ContactItem({this.title, this.content, this.icon});
}

List<ContactItem> contactList = [
  ContactItem(title: 'Call', content: '+91 88380-15885', icon: Icons.phone),
  ContactItem(title: 'Email', content: 'sundarlucifer@gmail.com', icon: Icons.mail),
  ContactItem(title: 'LinkedIn', content: 'www.linkedin.com/in/sundar-saravanan-a3922318b/', icon: Icons.insert_link),
  ContactItem(title: '', content: 'This page developed by Sundar Saravanan',icon: Icons.copyright)
];
