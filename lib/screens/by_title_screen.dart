// screens/by_title_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/book_list_item.dart';
import '../widgets/bottom_nav_bar.dart';

class ByTitleScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {'title': 'Da Vinci Code', 'author': 'Dan Brown'},
    {'title': 'Inferno', 'author': 'Dan Brown'},
    {'title': 'Angels & Demons', 'author': 'Dan Brown'},
    {'title': 'Digital Fortress', 'author': 'Dan Brown'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> sortedBooks = List.from(books);
    sortedBooks.sort((a, b) => a['title']!.compareTo(b['title']!));

    return Scaffold(
      appBar: AppBar(
        title: Text('Sorted by Title'),
      ),
      body: ListView.builder(
        itemCount: sortedBooks.length,
        itemBuilder: (context, index) {
          final book = sortedBooks[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: Container(
              color: Colors.purple[50],
              child: BookListItem(
                title: book['title']!,
                author: book['author']!,
                onTap: () {
                  // Navigate to BookDetailScreen with book details
                  context.push('/byTitle/detail', extra: book);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
