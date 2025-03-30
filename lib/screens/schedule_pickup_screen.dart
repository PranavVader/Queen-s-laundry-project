import 'package:flutter/material.dart';

class SchedulePickupScreen extends StatefulWidget {
  @override
  _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  String? _selectedDate;
  String? _selectedTime;

  final List<Map<String, String>> dates = [
    {"day": "Mon", "date": "2"},
    {"day": "Tue", "date": "3"},
    {"day": "Wed", "date": "4"},
    {"day": "Thu", "date": "5"},
  ];

  final List<String> timeSlots = [
    "8:00 am",
    "9:00 am",
    "9:30 am",
    "1:00 pm",
    "2:00 pm",
    "2:30 pm"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),

      body: Column(
        children: [
          // Top Section with Title and Back Button
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SCHEDULE PICKUP",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.blue[800]),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Pickup Date Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pickup Date",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          // Date Selection
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = dates[index]["date"];
                    });
                  },
                  child: _buildDateItem(
                    dates[index]["day"]!,
                    dates[index]["date"]!,
                    _selectedDate == dates[index]["date"],
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20),

          // Pickup Time Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Pickup Time",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          // Time Slots Selection
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: timeSlots.map((time) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  child: _buildTimeSlot(time, _selectedTime == time),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 20),

          // Proceed to Address Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: ElevatedButton(
              onPressed: _selectedDate != null && _selectedTime != null
                  ? () {
                Navigator.pushNamed(
                  context,
                  '/select-pickup-address',
                  arguments: {
                    'selectedDate': _selectedDate,
                    'selectedTime': _selectedTime,
                  },
                );
              }
                  : null, // Disabled if no selection
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "PROCEED TO ADDRESS",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget for Date Item
  Widget _buildDateItem(String day, String date, bool isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[800] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue[800]!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Time Slot
  Widget _buildTimeSlot(String time, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[800] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue[800]!),
      ),
      child: Center(
        child: Text(
          time,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
