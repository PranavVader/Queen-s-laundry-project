import 'package:flutter/material.dart';

class BlanketCleaningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9), // Background color

      body: Column(
        children: [
          // Top Section with Curved Shape and Title
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // Match the top section color
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
                    "BLANKET CLEANING",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Blue text for title
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.blue[800]), // Blue home icon
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Price List
          Expanded(
            child: Card(
              margin: EdgeInsets.all(20),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 400, // Shortened height of the box
                decoration: BoxDecoration(
                  color: Colors.blue[700], // Match the card background color
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    _buildPriceItem("SINGLE BLANKET", "Rs. 45"),
                    _buildPriceItem("DOUBLE BLANKET", "Rs. 60"),
                    _buildPriceItem("QUEEN BLANKET", "Rs. 80"),
                    _buildPriceItem("KING BLANKET", "Rs. 95"),
                    _buildPriceItem("DUVET", "Rs. 100"),
                    _buildPriceItem("QUILT", "Rs. 75"),
                    _buildPriceItem("COMFORTER", "Rs. 45"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceItem(String item, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), // White text for items
          Text(price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), // White text for prices
        ],
      ),
    );
  }
}
