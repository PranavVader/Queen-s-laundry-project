import 'package:flutter/material.dart';

class SelectPickupAddressScreen extends StatefulWidget {
  @override
  _SelectPickupAddressScreenState createState() => _SelectPickupAddressScreenState();
}

class _SelectPickupAddressScreenState extends State<SelectPickupAddressScreen> {
  String? selectedAddress; // Track selected address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9), // Correct background color
      body: Column(
        children: [
          // Top Section with Curved Shape and Title
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
                    "SCHEDULE PICKUP",
                    style: TextStyle(
                      fontSize: 24, // Increased font size
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

          SizedBox(height: 30),

          // Select Address Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SELECT ADDRESS",
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(height: 15),

          // Address Selection
          _buildAddressCard("Mega Hostel Gate, Kattangal, Kozhikode, Kerala, India - 673601"),

          SizedBox(height: 20),

          // Push button to the bottom
          Expanded(child: Container()),

          _buildProceedButton(context),
        ],
      ),
    );
  }

  Widget _buildAddressCard(String address) {
    bool isSelected = address == selectedAddress;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedAddress = address;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[800] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0), // Increased vertical padding
            title: Text(
              address,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 18, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: Colors.white, size: 26) // ✅ Show checkmark when selected
                : SizedBox(), // Hide when unselected
          ),
        ),
      ),
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 18),
        ),
        onPressed: selectedAddress != null
            ? () {
          // Navigate to the next screen (if applicable)
          Navigator.pushNamed(context, '/next-screen');
        }
            : null, // Disable button if no address is selected
        child: Text(
          "CONFIRM PICKUP ADDRESS",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
