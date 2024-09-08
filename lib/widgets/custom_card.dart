import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 193,
      width: 120,
      child: Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 193,
              width: 120,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(color: theme.primaryColor),
          ),
        ],
      ),
    );
  }
}
