import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod; // Initially no payment method is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9), // Background color as per UI
      body: Column(
        children: [
          // Top Section with Curved Shape and Title
          Stack(
            children: [
              Container(
                height: 130,
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
                    "PAYMENT",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Header text color
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
                    backgroundColor: Colors.blue[100], // Light blue background
                    child: Icon(Icons.arrow_back, size: 24, color: Colors.blue[800]),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Step Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStepIndicator(1, false),
              _buildStepIndicator(2, false),
              _buildStepIndicator(3, false),
              _buildStepIndicator(4, true), // Active step
            ],
          ),

          SizedBox(height: 20),

          // Choose Payment Option Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose payment option",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Corrected text color
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          // Payment Options List
          _buildPaymentOption("Cash on delivery"),
          _buildPaymentOption("UPI"),
          _buildPaymentOption("Debit / Credit Card"),

          // Push button to the bottom
          Expanded(child: Container()),

          // Proceed Button
          _buildProceedButton(context),
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

  Widget _buildPaymentOption(String method) {
    bool isSelected = method == _selectedPaymentMethod;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPaymentMethod = method;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[800] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
            title: Text(
              method,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: Colors.white, size: 24) // Show checkmark when selected
                : SizedBox(), // Hide when not selected
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
        onPressed: _selectedPaymentMethod != null
            ? () {
          // Navigate to confirmation screen
          Navigator.pushNamed(context, '/confirmation');
        }
            : null, // Disable button if no payment method is selected
        child: Text(
          "PROCEED TO CONFIRMATION",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
