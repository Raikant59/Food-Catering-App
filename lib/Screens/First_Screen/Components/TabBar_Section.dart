import 'package:flutter/material.dart';

class TabBarSection extends StatefulWidget {
  @override
  State<TabBarSection> createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection> {
  String selectedCategory = 'ALL (8)';

  // handle the selection of Button
  void handleCategorySelection(String category) {
    setState(() {
      selectedCategory = category;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$category Selected')),
    );
  }

  // Tab Bar Section
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categoryButton('ALL (8)'),
                categoryButton('Breakfast'),
                categoryButton('Lunch & Dinner'),
                categoryButton('Snacks'),
              ],
            ),
          ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Use for Gesture Detection when clicked on a buttons
  Widget categoryButton(String title) {
    return GestureDetector(
      onTap: () => handleCategorySelection(title),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: selectedCategory == title ? Colors.purple : Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (selectedCategory == title)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 40,
              color: Colors.purple,
            )
        ],
      ),
    );
  }
}