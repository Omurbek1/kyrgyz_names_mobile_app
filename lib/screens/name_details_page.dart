import 'package:flutter/material.dart';
import 'name_model.dart';

class NameDetailsPage extends StatelessWidget {
  final Name name;

  const NameDetailsPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${name.name}', style: const TextStyle(fontSize: 24)),
            Text('Description: ${name.description}',
                style: const TextStyle(fontSize: 18)),
            Text('Gender: ${name.gender}',
                style: const TextStyle(fontSize: 18)),
            Text('Favorite: ${name.favorite ? 'Yes' : 'No'}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Tags: ${name.tag.join(', ')}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
