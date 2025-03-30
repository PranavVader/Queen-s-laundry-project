import 'package:flutter/material.dart';

class PickupPage extends StatefulWidget {
  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  // Map to store the count of each laundry item
  Map<String, int> itemCounts = {
    "T-SHIRT": 0,
    "SHIRT": 0,
    "SHORT": 0,
    "PANT": 0,
    "SWEATSHIRT": 0,
    "JACKET": 0,
    "PILLOW": 0,
    "TOWEL": 0,
  };

  // Function to get total item count
  int get totalItemCount {
    return itemCounts.values.fold(0, (sum, count) => sum + count);
  }

  // Function to update item count
  void _updateCount(String item, int change) {
    setState(() {
      itemCounts[item] = (itemCounts[item]! + change).clamp(0, 99); // Prevent negative values
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Column(
        children: [
          // Top Section with Curved Shape and Title
          Stack(
            children: [
              Container(
                height: 150, // Matched height
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
                    "PICKUP",
                    style: TextStyle(
                      fontSize: 28, // Matched font size
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40, // Matched position
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 32, color: Colors.blue), // Matched size & color
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

          // Laundry Basket Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LAUNDRY BASKET",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),

                  // List of Laundry Items
                  Expanded(
                    child: ListView(
                      children: [
                        _buildLaundryItem('lib/assets/tshirt.png', "T-SHIRT"),
                        _buildLaundryItem('lib/assets/shirt.png', "SHIRT"),
                        _buildLaundryItem('lib/assets/shorts.png', "SHORT"),
                        _buildLaundryItem('lib/assets/pant.png', "PANT"),
                        _buildLaundryItem('lib/assets/sweat.png', "SWEATSHIRT"),
                        _buildLaundryItem('lib/assets/jacket.png', "JACKET"),
                        _buildLaundryItem('lib/assets/pillow.png', "PILLOW"),
                        _buildLaundryItem('lib/assets/towels.png', "TOWEL"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Schedule Pickup Button
          _buildSchedulePickupButton(context),
        ],
      ),
    );
  }

  // Function to build each laundry item row
  Widget _buildLaundryItem(String imagePath, String itemName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 190, height: 190),

          SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),

                // Add/Subtract Buttons
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _updateCount(itemName, -1),
                        icon: Icon(Icons.remove, color: Colors.white, size: 30),
                      ),
                      Text(
                        "${itemCounts[itemName]}",
                        style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () => _updateCount(itemName, 1),
                        icon: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Schedule Pickup Button (Updated Format)
  Widget _buildSchedulePickupButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: totalItemCount >= 5 ? Colors.blue[800] : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 18),
        ),
        onPressed: totalItemCount >= 5
            ? () {
          // Navigate using named route
          Navigator.pushNamed(context, '/schedule-pickup');
        }
            : null, // Disabled when item count is less than 5
        child: Text(
          "SCHEDULE PICKUP",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
