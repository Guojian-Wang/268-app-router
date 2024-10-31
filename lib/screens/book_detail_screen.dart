// screens/book_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;

  const BookDetailScreen({Key? key, required this.title, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(); // Use GoRouter's pop method instead of Navigator.pop
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Author: $author',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
