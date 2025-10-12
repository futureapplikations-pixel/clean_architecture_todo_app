import 'package:flutter/material.dart';

class SearchMementoList extends StatelessWidget {
  const SearchMementoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Mementos'),
      ),
      body: const Center(
        child: Text('Search Mementos'),
      ),
    );
  }
}