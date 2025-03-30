import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
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
                    "Queen's Hi-Tech Laundry",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: PopupMenuButton<String>(
                  icon: Icon(Icons.account_circle, size: 30, color: Colors.black),
                  onSelected: (String value) {
                    if (value == 'edit') {
                      Navigator.pushNamed(context, '/edit-profile'); // Navigate to edit profile
                    } else if (value == 'logout') {
                      // Implement logout functionality
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.black),
                        title: Text('Edit Profile'),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text('Logout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Grid of Options
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildOption(context, Icons.cleaning_services, "SERVICES", '/services'),
              _buildOption(context, Icons.local_shipping, "PICKUP", '/pickup'),
              _buildOption(context, Icons.track_changes, "TRACK ORDER", '/trackOrder'),
              _buildOption(context, Icons.delivery_dining, "DELIVERY", '/delivery'),
            ],
          ),
          SizedBox(height: 20),
          // Ready to Collect Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "READY TO COLLECT",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildReadyToCollectItem("12th Jan, 2025", false),
                _buildReadyToCollectItem("5th Jan, 2025", true),
                _buildReadyToCollectItem("23rd Dec, 2024", true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String label, String? route) {
    return GestureDetector(
      onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.white),
              SizedBox(height: 10),
              Text(label, style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadyToCollectItem(String date, bool collected) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.circle, size: 12, color: collected ? Colors.green : Colors.blue),
                SizedBox(width: 8),
                Text(
                  date,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              collected ? "COLLECTED" : "NOT COLLECTED",
              style: TextStyle(
                color: collected ? Colors.green : Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.black),
                ),
                child: Text(
                  "VIEW BILL",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
