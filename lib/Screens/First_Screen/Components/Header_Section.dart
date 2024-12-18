import 'package:flutter/material.dart';
import 'package:food_app/Screens/First_Screen/Components/TabBar_Section.dart';

// This is Code for Header section of first screen
class HeaderSection extends StatefulWidget {
  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 250,
        width: double.infinity,
        child: Image.network(
          'https://s3-alpha-sig.figma.com/img/9a6c/9b1f/aa52874501ae88530abcf573861106a8?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ymn1zO6SwXl4qAbyUjIBiVIHojPM4jwsJC881pXoFPxsDUgjgge4EbYZY92u8bqallYOle~40YHbjZILkyrEBoLcNwg4zP-Y4-qrc34UlAm7geyVavV~-ruCYVGa3eebKXq0oC~55ZjfpbyE036h36j6rYZpZbPcqQAjirevz2zW-HxIWZ4DeKCzW2wcyr2Nc2vkAGAz~s3Ny5AQpM8gD5ci8OFptCIRtQxoEftko6Sqt9jutIBOcXvG0EX8DDqVDR1-dfyakWZADXtVTATEL89D-ZJB2aUXNWl1q4dB7SlxAhiv-yB9GgFgQPKK2Uphd8dYQsySCroQUQaJ6D5kvg__', // Header image URL
          fit: BoxFit.cover,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Code for Wedding Text and Arrow icon
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      // Implement back navigation here
                    },
                  ),
                  const Text(
                    'Wedding',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48), // Placeholder for symmetry
                ],
              ),
            ),
          ),
          const SizedBox(height: 150),
          // Code for Bulk food Delivery button and Catering service button
          Row(
            children: [
              SizedBox(width: 6,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Colors.white, width: 4),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Bulk Food Delivery',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6318AF),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 2,
                  ),
                  onPressed: () {
                    // handleCategorySelection('Catering Service');
                  },
                  child: const Text('Catering Service'),
                ),
              ),
            ],
          ),
          TabBarSection(), // This section contain TabBar section buttons code.
        ],
      ),
    ]);
  }
}