// import 'package:flutter/material.dart';
//
// class DeliveryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFD9D9D9), // Background color
//       body: Column(
//         children: [
//           // Top Section with Curved Shape and Title
//           Stack(
//             children: [
//               Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white, // Header background color
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "DELIVERY",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue[800], // Header text color
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 20,
//                 left: 20,
//                 child: IconButton(
//                   icon: Icon(Icons.home, size: 30, color: Colors.blue[800]), // Home icon
//                   onPressed: () {
//                     Navigator.pop(context); // Navigate back to Dashboard
//                   },
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(height: 20),
//
//           // Step Indicator with Navigation
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildStepIndicator(context, 1, true, '/delivery'), // Current step (active)
//               _buildStepIndicator(context, 2, false, '/scheduleDelivery'), // Navigate to Schedule Delivery
//               _buildStepIndicator(context, 3, false, '/address'), // Navigate to Address
//               _buildStepIndicator(context, 4, false, '/payment'), // Navigate to Payment
//             ],
//           ),
//
//           SizedBox(height: 20),
//
//           // Choose Order Section
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "CHOOSE ORDER:",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//
//           SizedBox(height: 10),
//
//           // Order Card
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue[800],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "ORDER #1385",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Text(
//                         "READY FOR COLLECTION",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue[800],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Step Indicator Widget
//   Widget _buildStepIndicator(BuildContext context, int step, bool isActive, String route) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8.0),
//         child: CircleAvatar(
//           backgroundColor: isActive ? Colors.blue[800] : Colors.grey,
//           child: Text(
//             '$step',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
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
                  color: Colors.white, // Header background color
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
                    "DELIVERY",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Header text color
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.blue[800]), // Home icon
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to Dashboard
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Step Indicator with Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStepIndicator(context, 1, true, '/delivery'), // Current step (active)
              _buildStepIndicator(context, 2, false, '/scheduleDelivery'), // Navigate to Schedule Delivery
              _buildStepIndicator(context, 3, false, '/address'), // Navigate to Address
              _buildStepIndicator(context, 4, false, '/payment'), // Navigate to Payment
            ],
          ),

          SizedBox(height: 20),

          // Choose Order Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CHOOSE ORDER:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          // Order Card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER #1385",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "READY FOR COLLECTION",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Push the button to the bottom
          Expanded(child: Container()),

          // Schedule Time Button
          _buildScheduleTimeButton(context),
        ],
      ),
    );
  }

  // Step Indicator Widget
  Widget _buildStepIndicator(BuildContext context, int step, bool isActive, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: CircleAvatar(
          backgroundColor: isActive ? Colors.blue[800] : Colors.grey,
          child: Text(
            '$step',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Schedule Time Button
  Widget _buildScheduleTimeButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(vertical: 18),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/scheduleDelivery'); // Navigate to Schedule Delivery
        },
        child: Text(
          "SCHEDULE TIME",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
