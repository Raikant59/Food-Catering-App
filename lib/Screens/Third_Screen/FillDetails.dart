import 'package:flutter/material.dart';
import 'package:food_app/Components/Dotted_Divider.dart';
import 'package:food_app/Screens/Fourth_Screen/Fourth_Screen.dart';

class FillDetailsScreen extends StatefulWidget {
  final double pricePerPlate;
  final String name;

  const FillDetailsScreen({Key? key, required this.pricePerPlate,required this.name}) : super(key: key);
  @override
  _FillDetailsScreenState createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  // Variables for screen state management
  String dropdownValue = 'Birthday';
  int totalGuests = 120; // Default guest count
  late double pricePerPlate; // Price to be initialized in initState
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late String course_name;

  @override
  void initState() {
    super.initState();
    pricePerPlate = widget.pricePerPlate;// Initialize price from the widget
    course_name = widget.name;
  }

  // Increment guest count(max 1500)
  void incrementGuests() {
    setState(() {
      if (totalGuests < 1500) totalGuests++;
    });
  }

  // Decrement guest count(min 10)
  void decrementGuests() {
    setState(() {
      if (totalGuests > 10) totalGuests--;
    });
  }

  // Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left,size: 40, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Fill Details",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.breakfast_dining, color: Color(0xff6318AF)),
                title: Text(
                  "${course_name}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    // Handle edit action
                  },
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 10),

              // Occasion and Date Picker
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Occasion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Occasion",
                            style:
                            TextStyle(color: Colors.grey, fontSize: 16)),

                        DropdownButton<String>(
                          // Step 3.
                          value: dropdownValue,
                          // Step 4.
                          items: <String>['Birthday', 'Wedding', 'Anniversary', 'Ceremony']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                    SizedBox(height: 9,),
                    Text("Date and Time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    SizedBox(height: 9,),
                    // Date and Time Picker
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: _buildDateTimeBox(
                                Icons.calendar_today_outlined,
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectTime(context),
                            child: _buildDateTimeBox(
                                Icons.access_time,
                                "${selectedTime.format(context)}"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Price Per Plate
              _buildPriceSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff6318AF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => OrderReviewScreen(
                  totalGuests: totalGuests,
                  pricePerPlate: pricePerPlate,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
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
          child: Text(
            "Order Review",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Date & Time Box Widget
  Widget _buildDateTimeBox(IconData icon, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xff6318AF), size: 18),
          SizedBox(width: 5),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Price Per Plate Section
  Widget _buildPriceSection() {
    double price=(20/100)*pricePerPlate;
    double finalprice=pricePerPlate-price;
    return Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price Per Plate:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "20% ",
                        style: TextStyle(color: Colors.green, fontSize: 14)),
                    TextSpan(
                        text: "↓ ",
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    TextSpan(
                        text: "₹${pricePerPlate.toStringAsFixed(2)} ",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough)),
                    TextSpan(
                        text: " ₹${finalprice.toStringAsFixed(0)}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          DottedDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Guests", style: TextStyle(fontSize: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle_outline, size: 35, color: Colors.grey),
                    onPressed: decrementGuests,
                  ),
                  Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black, // Sets the border color
                        width: 0.5, // Border width (optional)
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "$totalGuests",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, size: 35, color: Color(0xff6318AF)),
                    onPressed: incrementGuests,
                  ),
                ],
              ),
            ],
          ),
          // Slider for selecting no of guests
          Slider(
            value: totalGuests.toDouble(),
            min: 10,
            max: 1500,
            activeColor: Color(0xff6318AF),
            onChanged: (value) {
              setState(() {
                totalGuests = value.toInt();
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("10(min)",style: TextStyle(color: Colors.black54),), Text("1500(max)",style: TextStyle(color: Colors.black54),)],
          ),
          SizedBox(height: 10,),
          Divider(
            color: Colors.black,
            thickness: 0.2,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.star_purple500_rounded, size:20,color: Colors.orange),
              SizedBox(width: 3),
              Text(
                "DYNAMIC PRICING ",
                style: TextStyle(
                    color: Color(0xff6318AF), fontWeight: FontWeight.bold,fontSize: 12),
              ),
              Text(
                "more guests, more savings.",
                style: TextStyle(color: Colors.black,fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}