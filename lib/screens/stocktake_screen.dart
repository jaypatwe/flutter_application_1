import 'package:flutter/material.dart';

class StocktakeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WH ID: W101'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings action
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF3c3d37), // Background color for the whole page
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/warehouse_image.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white, // Set the card color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Card radius
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.qr_code, color: Colors.white),
                        label: Text('Start Stocktake', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/stocktake_form');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3c3d37), // Button background color
                          foregroundColor: Colors.white, // Text and icon color
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0), // Button radius
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: Icon(Icons.list, color: Colors.white),
                        label: Text('View Stocktake', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // TODO: Implement view stocktake action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3c3d37), // Same background color as Start Stocktake
                          foregroundColor: Colors.white, // Text and icon color
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0), // Button radius
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
