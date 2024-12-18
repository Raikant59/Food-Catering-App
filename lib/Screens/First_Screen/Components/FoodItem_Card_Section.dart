import 'package:flutter/material.dart';
import 'package:food_app/Components/Dotted_Divider.dart';
import 'package:food_app/Screens/Second_Screen/ItemSelection.dart';

// Food Items List
class FoodItemsList extends StatelessWidget {
  // Sample List of Dishes (Customizable)
  final List<Map<String, dynamic>> dishes = [
    {
      'name': 'South Indian Breakfast',
      'categories': '7 Categories & 12 Items',
      'price': 249,
      'image': 'https://wallpapercave.com/wp/wp7845825.jpg',
      'avatars': [
        'https://wallpapercave.com/wp/wp7845825.jpg',
        'https://wallpapercave.com/wp/wp7845825.jpg',
        'https://wallpapercave.com/wp/wp7845825.jpg',
        'https://wallpapercave.com/wp/wp7845825.jpg',
        'https://wallpapercave.com/wp/wp7845825.jpg',
        'https://wallpapercave.com/wp/wp7845825.jpg',
        'https://wallpapercave.com/wp/wp7845825.jpg',
      ],
    },
    {
      'name': 'Indian Soiree',
      'categories': '7 Categories & 10 Items',
      'price': 189,
      'image': 'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
      'avatars': [
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
        'https://s4.scoopwhoop.com/dan/spicyfood1/15.jpg',
      ],
    },
    {
      'name': 'South Indian Delight',
      'categories': '7 Categories & 14 Items',
      'price': 299,
      'image': 'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
      'avatars': [
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
        'https://th.bing.com/th/id/OIP.UWiKrM17pfPujsmsSvrNGAAAAA?rs=1&pid=ImgDetMain',
      ],
    },
  ];

  //List View of Dishes
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: dishes.length,
      itemBuilder: (context, index) => FoodItemCard(
        dishData: dishes[index],
      ),
    );
  }
}

// Food Item Card Widget
class FoodItemCard extends StatefulWidget {
  final Map<String, dynamic> dishData;

  const FoodItemCard({Key? key, required this.dishData}) : super(key: key);

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  int selectedAvatarIndex = -1; // Tracks selected avatar

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.3;
    int price = widget.dishData['price'];

    // Ensuring the price is within the range of 189 to 299
    price = price < 189 ? 189 : (price > 299 ? 299 : price);

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section (Network Image)
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              widget.dishData['image'],
              height: cardHeight * 0.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Details Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dishData['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Divider(),
                Container(
                  height: 20,
                  color: Colors.orange.shade50,
                  child: Text(
                    widget.dishData['categories'],
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
                SizedBox(height: 8),
                // Scrollable Circle Avatars
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      widget.dishData['avatars'].length,
                          (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAvatarIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8.0),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: selectedAvatarIndex == index
                                  ? Colors.purple
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 22, // Increased size
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: NetworkImage(
                              widget.dishData['avatars'][index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                DottedDivider(),
                // Price detail and Customize Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(children: [
                          TextSpan(text: '₹$price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),),
                          TextSpan(text: '/guest',style: TextStyle(fontSize: 15,color: Colors.grey))
                        ])),
                        Row(
                          children: [
                            Text('Add guest count to see',style: TextStyle(color: Colors.grey,fontSize: 10)),
                            Icon(Icons.star_purple500,color: Colors.orange,size: 16,),
                            Text('Dynamic Price',style: TextStyle(color: Color(0xff6318AF),fontSize: 10),)
                          ],
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => ItemSelectionScreen(
                              price: price,
                              name: widget.dishData['name'],
                            ),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              // Fade transition
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6318AF),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Customize',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
