import 'package:flutter/material.dart';
import 'package:food_app/Components/Dotted_Divider.dart';

class OrderReviewScreen extends StatelessWidget {
  // Variables to hold the order details
  final int totalGuests;
  final double pricePerPlate;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  // Constructor to initialize the screen with the required parameters
  OrderReviewScreen({
    required this.totalGuests,
    required this.pricePerPlate,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the subtotal, discount, and total amount
    double subtotal = pricePerPlate * totalGuests;
    double discount = subtotal * 0.2; // 20% dynamic pricing discount
    double totalAmount = subtotal - discount;

    // Get the screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // AppBar for the screen with a back button and title
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Navigate back when pressed
        ),
        title: Text(
          "Order Review",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card containing order details
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // ListTile for meal details like type, guests, date, and time
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.breakfast_dining, color: Color(0xff6318AF), size: 30),
                          SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "Millet Breakfast",
                              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.person, size: 15),
                          SizedBox(width: 2),
                          Text("$totalGuests", style: TextStyle(fontSize: 12)),
                          SizedBox(width: 8),
                          Icon(Icons.calendar_today, size: 12),
                          SizedBox(width: 2),
                          Text(
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.watch_later_outlined, size: 12),
                          SizedBox(width: 2),
                          Text(
                            '${selectedTime.format(context)}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () {}, // Edit button (functionality can be added)
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.purple, fontSize: screenWidth * 0.05),
                        ),
                      ),
                    ),
                    // ExpansionTile to hide/show additional order details
                    ExpansionTile(
                      title: Text('Hide Selected items',style: TextStyle(color: Colors.black45),),
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Subtotal   ",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: "₹${subtotal.toStringAsFixed(0)} ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: " ₹${totalAmount.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            "Incl. taxes and charges",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          trailing: IconButton(
                            onPressed: () {}, // Add functionality for more details
                            icon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Card displaying the discount and total payable amount
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    // Header for the discount section
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(12),
                          topEnd: Radius.circular(12),
                        ),
                        color: Color(0xff6318AF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.celebration, color: Colors.orange, size: 25),
                          SizedBox(width: 8),
                          RichText(text: TextSpan(children: [
                            TextSpan(text: "Hurry! You saved ",style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.038),),
                            TextSpan(text: "₹${discount.toStringAsFixed(0)}/-",style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.042),),
                            TextSpan(text: " on total order",
                            style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.038),),
                          ]))
                          // Text(
                          //   "Hurry! You saved ₹${discount.toStringAsFixed(0)}/- on total order",
                          //   style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.035),
                          // ),
                        ],
                      ),
                    ),
                    // ListTile displaying the total amount and subtotal
                    ListTile(
                      title: Text("Total", style: TextStyle(fontSize: 16)),
                      trailing: Text("₹${subtotal.toStringAsFixed(0)}", style: TextStyle(fontSize: 16)),
                    ),
                    // Row showing the discount applied to the total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dynamic Pricing Discount", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 8),
                        Icon(Icons.star_purple500, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          "- ₹${discount.toStringAsFixed(0)}",
                          style: TextStyle(fontSize: 16, color: Colors.green.shade700),
                        ),
                      ],
                    ),
                    DottedDivider(),
                    // ListTile showing the final amount to pay
                    ListTile(
                      title: Text(
                        "To Pay",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "₹${totalAmount.toStringAsFixed(0)}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom navigation bar with the total amount to pay and a 'Place Order' button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display total to pay
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "To pay\n",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  TextSpan(
                    text: "₹ ${totalAmount.toStringAsFixed(0)}",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
            // 'Place Order' button
            SizedBox(
              width: screenWidth * 0.5,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  overlayColor: Colors.white,
                  backgroundColor: Color(0xff6318AF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Order Placed')),
                  );
                },
                child: Text(
                  "Place Order",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
