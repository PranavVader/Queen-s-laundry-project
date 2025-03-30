import 'package:flutter/material.dart';

class ScheduleDeliveryScreen extends StatefulWidget {
  @override
  _ScheduleDeliveryScreenState createState() => _ScheduleDeliveryScreenState();
}

class _ScheduleDeliveryScreenState extends State<ScheduleDeliveryScreen> {
  String? selectedTime;
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 130,
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
                    "SCHEDULE DELIVERY",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Icon(Icons.arrow_back, size: 24, color: Colors.blue[800]),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return _buildStepIndicator(index + 1, index == 1);
            }),
          ),
          SizedBox(height: 20),
          Text("JUN, 2025", style: _sectionTitleStyle()),
          SizedBox(height: 10),
          _buildDateSelection(),
          SizedBox(height: 20),
          Text("Delivery Time", style: _sectionTitleStyle()),
          SizedBox(height: 10),
          _buildTimeSelection(),
          SizedBox(height: 10),
          Expanded(child: Container()),
          _buildProceedButton(),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: isActive ? Colors.blue[800] : Colors.grey,
        child: Text(
          '$step',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dateTile("Mon", "2"),
        _dateTile("Tue", "3"),
        _dateTile("Wed", "4"),
        _dateTile("Thu", "5"),
      ],
    );
  }

  Widget _dateTile(String day, String date) {
    bool isSelected = date == selectedDate;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(day, style: TextStyle(color: Colors.black, fontSize: 16)),
            SizedBox(height: 5),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[600],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                date,
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelection() {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        _timeButton("8:00 am"),
        _timeButton("9:00 am"),
        _timeButton("9:30 am"),
        _timeButton("1:00 pm"),
        _timeButton("2:00 pm"),
        _timeButton("2:30 pm"),
      ],
    );
  }

  Widget _timeButton(String time) {
    bool isSelected = time == selectedTime;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        width: 110,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[800] : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: isSelected ? Colors.blue[800]! : Colors.black, width: 2),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildProceedButton() {
    bool isEnabled = selectedDate != null && selectedTime != null;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? Colors.blue[800] : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 18),
        ),
        onPressed: isEnabled
            ? () {
          Navigator.pushNamed(context, '/select-address');
        }
            : null,
        child: Text(
          "PROCEED TO ADDRESS",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TextStyle _sectionTitleStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}