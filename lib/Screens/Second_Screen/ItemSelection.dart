import 'package:flutter/material.dart';
import 'package:food_app/Screens/Second_Screen/Components/Floating_Button.dart';
import 'package:food_app/Screens/Second_Screen/Components/Switch_toggler_widget.dart';
import 'package:food_app/Screens/Third_Screen/FillDetails.dart';

class ItemSelectionScreen extends StatefulWidget {
  final int price;// Add a price parameter
  final String name; // Add a name parameter
  const ItemSelectionScreen({Key? key, required this.price,required this.name}) : super(key: key);

  @override
  _ItemSelectionScreenState createState() =>
      _ItemSelectionScreenState();
}

class _ItemSelectionScreenState extends State<ItemSelectionScreen> {
  late int _currentPrice; // Declare a variable to hold the price value
  late String course_name; // Declare a variable to hold the category of dishes

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.price;// Initialize _currentPrice with widget.price
    course_name = widget.name;// Initialize course_name with widget.name
  }

  // Food Items Data
  List<FoodItem> foodItems = [
    FoodItem(
        name: 'Idli Sambar',
        category: 'Starters',
        isAdded: false,
        imageUrl: 'https://static.toiimg.com/photo/68631114.cms'),
    FoodItem(
        name: 'Appam',
        category: 'Starters',
        isAdded: false,
        imageUrl:
            'https://i.pinimg.com/originals/e5/04/d5/e504d5f143d439d38c246c475adaec5f.jpg'),
    FoodItem(
        name: 'Dosa',
        category: 'Mains',
        isAdded: false,
        imageUrl: 'https://wallpapercave.com/wp/wp6734909.jpg'),
    FoodItem(
        name: 'Wada',
        category: 'Mains',
        isAdded: false,
        imageUrl:
            'https://img.freepik.com/premium-photo/sambar-vada-medu-vada-popular-south-indian-food-served-with-green-red-coconut-chutney-moody-background-selective-focus_466689-59611.jpg?w=2000'),
    FoodItem(
        name: 'Pongal',
        category: 'Sweets',
        isAdded: false,
        imageUrl:
            'https://th.bing.com/th/id/OIP.ff3K8IggGGjjcMM0kzj01QAAAA?rs=1&pid=ImgDetMain'),
    FoodItem(
        name: 'Bonda',
        category: 'Sweets',
        isAdded: false,
        imageUrl:
            'https://e1.pxfuel.com/desktop-wallpaper/77/150/desktop-wallpaper-mysore-bonda-bonda-mysore-bajji-fritters.jpg'),
  ];

  // Counters for the navigation bar
  int startersCount = 0;
  int mainsCount = 0;
  int sweetsCount = 0;

  // Function to update counters
  void updateCounters() {
    startersCount = foodItems
        .where((item) => item.category == 'Starters' && item.isAdded)
        .length;
    mainsCount = foodItems
        .where((item) => item.category == 'Mains' && item.isAdded)
        .length;
    sweetsCount = foodItems
        .where((item) => item.category == 'Sweets' && item.isAdded)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left, size: 40, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Text('${course_name}  '),
            Icon(Icons.edit,color: Colors.grey,)
          ],
        ),
        shadowColor: Colors.black,
        shape: Border(
            bottom: BorderSide(
                color: Colors.black38,
                width: 0.3
            )
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children:[ Container(
          child: Column(
            children: [
              // Pure Veg and Non Veg Filters
              Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                    )
                  ],
                  color: Colors.white,
                ),
                child: SwitchTogglerWidget(),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 0.1,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildCategory('Starters', startersCount, Colors.green,
                              'https://wallpaperaccess.com/full/2069188.jpg'),
                          _buildCategory('Mains', mainsCount, Colors.purple,
                              'https://prod-c2i.s3.amazonaws.com/articles/147746668858105a404544d.jpg'),
                          _buildCategory('Sweets', sweetsCount, Colors.orange,
                              'https://www.eg2i.com/uploads/product_image/product_795_1_thumb.jpg'),
                        ],
                      ),
                    ),
                    // Food Items Grid
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: foodItems.length,
                        itemBuilder: (context, index) {
                          return _buildFoodCard(foodItems[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
          AddOnsFAB(), // Add Floating Button
        ]
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(text: TextSpan(children: [
              TextSpan(text: 'Price per plate\n',style: TextStyle(color: Colors.grey,fontSize: 16)),
              TextSpan(text: '₹${_currentPrice}/Plate',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),)
            ])),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FillDetailsScreen(pricePerPlate: _currentPrice.toDouble(),name: course_name,), // Navigate to Third Screen
                //   ),
                // );
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FillDetailsScreen(
                          pricePerPlate: _currentPrice.toDouble(),
                          name: course_name,
                        ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              child: const Text(
                'Fill Details',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Navigation Categories
  Widget _buildCategory(
      String title, int count, Color activeColor, String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: activeColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // CircleAvatar with Image
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.white, // fallback background
          ),
          const SizedBox(height: 5),
          Text(title, style: TextStyle(color: activeColor)),
          Text('$count', style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }


  // Custom Widget for Food Card
  Widget _buildFoodCard(FoodItem item) {
    return SizedBox(
      height: 180,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              '${item.imageUrl}',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                item.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      item.isAdded = !item.isAdded;
                      updateCounters();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: item.isAdded ? Colors.pink : Colors.white,
                    foregroundColor: item.isAdded ? Colors.white : Colors.pink,
                    side: const BorderSide(color: Colors.pink),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(item.isAdded ? 'Added' : 'Add'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Food Item Model Class
class FoodItem {
  final String name;
  final String category;
  bool isAdded;
  final String imageUrl;

  FoodItem(
      {required this.name,
      required this.category,
      this.isAdded = false,
      required this.imageUrl});
}
