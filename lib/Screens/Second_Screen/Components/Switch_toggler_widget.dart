import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SwitchTogglerWidget extends StatefulWidget {
  const SwitchTogglerWidget({super.key});

  @override
  State<SwitchTogglerWidget> createState() => _SwitchTogglerWidgetState();
}

class _SwitchTogglerWidgetState extends State<SwitchTogglerWidget> {
  bool isPureVeg = true; // Toggle value

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Pure Veg Section
        GestureDetector(
          onTap: () {
            setState(() {
              isPureVeg = true;
            });
          },
          child: Row(
            children: [
              Icon(Icons.eco,
                  color: Colors.green),
              const SizedBox(width: 5),
              Text(
                "Pure Veg",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 5),
              GFToggle(
                onChanged: (val) {
                  setState(() {
                    isPureVeg = true;
                  });
                },
                value: isPureVeg,
                enabledTrackColor: Colors.green.withOpacity(0.5),
                enabledThumbColor: Colors.green,
                type: GFToggleType.custom,
                disabledTrackColor: Colors.grey.shade200,
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        // Non-Veg Section
        GestureDetector(
          onTap: () {
            setState(() {
              isPureVeg = false;
            });
          },
          child: Row(
            children: [
              Icon(Icons.radio_button_checked,
                  color:Colors.red),
                  // color: !isPureVeg ? Colors.red : Colors.grey),
              const SizedBox(width: 5),
              Text(
                "Non Veg",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              const SizedBox(width: 5),
              GFToggle(
                onChanged: (val) {
                  setState(() {
                    isPureVeg = false;
                  });
                },
                value: !isPureVeg,
                enabledTrackColor: Colors.red.withOpacity(0.5),
                enabledThumbColor: Colors.red,
                type: GFToggleType.custom,
                disabledTrackColor: Colors.grey.shade200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
