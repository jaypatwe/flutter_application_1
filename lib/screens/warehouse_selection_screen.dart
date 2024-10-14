import 'package:flutter/material.dart';

class WarehouseSelectionScreen extends StatefulWidget {
  @override
  _WarehouseSelectionScreenState createState() => _WarehouseSelectionScreenState();
}

class _WarehouseSelectionScreenState extends State<WarehouseSelectionScreen> {
  String? selectedWarehouse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Warehouse'),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black), // Settings icon color set
            onPressed: () {
              // TODO: Implement settings action
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF3C3D37), // Background color changed to 3c3d37
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Icon(Icons.warehouse, size: 250, color: Colors.white),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center align text
                    children: [
                      Text(
                        'Select a Warehouse',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center, 
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Select a warehouse for stocktake',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedWarehouse,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          DropdownMenuItem(child: Text('Warehouse 1'), value: 'Warehouse 1'),
                          DropdownMenuItem(child: Text('Warehouse 2'), value: 'Warehouse 2'),
                          DropdownMenuItem(child: Text('Warehouse 3'), value: 'Warehouse 3'),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedWarehouse = value;
                          });
                        },
                        hint: Text('Select a Warehouse'),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        child: Text('Select Warehouse'),
                        onPressed: selectedWarehouse == null ? null : () {
                          Navigator.pushNamed(context, '/stocktake');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Color(0xFF3C3D37), // Button color changed to 3c3d37
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
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
