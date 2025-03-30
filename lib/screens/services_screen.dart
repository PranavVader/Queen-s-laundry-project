import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
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
                    "SERVICES",
                    style: TextStyle(
                      fontSize: 30, // Increased font size
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
                  icon: Icon(Icons.arrow_back, size: 32, color: Colors.blue), // Slightly larger icon
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to Dashboard
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Grid of Service Options
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Two columns in the grid
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1, // Ensures square-shaped tiles
              children: [
                _buildServiceOption(context, "Washing & Dry", Icons.local_laundry_service, '/washing-drying'),
                _buildServiceOption(context, "Dry Cleaning", Icons.checkroom, '/dry-cleaning'),
                _buildServiceOption(context, "Stain Removal", Icons.cleaning_services, '/stain-removal'),
                _buildServiceOption(context, "Steam Press", Icons.iron, '/steam-press'),
                _buildServiceOption(context, "Blanket Cleaning", Icons.bed, '/blanket-cleaning'),
                _buildServiceOption(context, "Curtain Cleaning", Icons.window, '/curtain-cleaning'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to Build Each Service Option in the Grid
  Widget _buildServiceOption(BuildContext context, String label, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route); // Navigate to the respective route
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.white), // Bigger icon
            SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), // Bigger font
            ),
          ],
        ),
      ),
    );
  }
}
