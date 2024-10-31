
import 'package:flutter/material.dart';

class BookListItem extends StatelessWidget {
  final String title;
  final String author;
  final VoidCallback onTap;

  const BookListItem({
    Key? key,
    required this.title,
    required this.author,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(author),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
