import 'package:flutter/material.dart';
import 'package:food_app/Screens/First_Screen/Components/FoodItem_Card_Section.dart';
import 'package:food_app/Screens/First_Screen/Components/Header_Section.dart';

class PlattersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            HeaderSection(),

            // Food Items Section
            Expanded(
              child: FoodItemsList(),
            ),
          ],
        ),
      ),
    );
  }
}
