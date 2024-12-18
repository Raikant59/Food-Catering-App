import 'package:flutter/material.dart';

class AddOnsFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: 5, // Adjust this value to align above "Fill Details" button
      right: 10, // Align to bottom-right with padding
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: (){
            // Add functionality
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Ons",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 6),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pink,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}