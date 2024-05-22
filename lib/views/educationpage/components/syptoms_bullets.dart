import 'package:flutter/material.dart';
import 'package:pink_ribbon/views/educationpage/components/bullets.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return bullets(item);
      }).toList(),
    );
  }
}
