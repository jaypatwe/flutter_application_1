import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MaterialApp(
    home: StocktakeFormScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class StocktakeFormScreen extends StatefulWidget {
  @override
  _StocktakeFormScreenState createState() => _StocktakeFormScreenState();
}

class _StocktakeFormScreenState extends State<StocktakeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {
    'Bin ID': TextEditingController(),
    'HU ID': TextEditingController(),
    'Product ID': TextEditingController(),
    'Batch ID': TextEditingController(),
    'Quantity': TextEditingController(),
  };

  Future<void> scanBarcode(String field) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
    } catch (e) {
      barcodeScanRes = 'Failed to get barcode: $e';
    }

    if (!mounted) return;

    setState(() {
      controllers[field]?.text = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'WH ID: W101',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              // TODO: Implement settings action
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3C3D37), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              SizedBox(height: 100),
              _buildInputField(
                'Bin ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () => scanBarcode('Bin ID'),
              ),
              SizedBox(height: 20),
              _buildInputField(
                'HU ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () => scanBarcode('HU ID'),
              ),
              SizedBox(height: 20),
              _buildInputField(
                'Product ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () => scanBarcode('Product ID'),
              ),
              SizedBox(height: 20),
              _buildInputField(
                'Batch ID',
                suffixIcon: Icons.qr_code,
                onSuffixIconPressed: () => scanBarcode('Batch ID'),
              ),
              SizedBox(height: 20),
              _buildInputField('Quantity'),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'UoM',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Inter',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: [
                  DropdownMenuItem(child: Text('KG'), value: 'KG'),
                  DropdownMenuItem(child: Text('L'), value: 'L'),
                  DropdownMenuItem(child: Text('PCS'), value: 'PCS'),
                ],
                onChanged: (value) {
                  // TODO: Handle UoM selection
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                    fontFamily: 'Inter',
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Implement submit logic
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFFECDFCC),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {IconData? suffixIcon, VoidCallback? onSuffixIconPressed}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controllers[label],
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Inter',
          ),
          border: OutlineInputBorder(),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: Colors.black),
                  onPressed: onSuffixIconPressed,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
        ),
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }
}