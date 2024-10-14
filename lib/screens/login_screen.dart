import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _orgId = '';
  String _userId = '';
  String _password = '';
  bool _obscureText = true; // Initially hide the password

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/stellium_logo.png', height: 80),
                  SizedBox(height: 24),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF867F7F),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Organization ID Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Org ID',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF867F7F),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Organization ID',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF867F7F),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => _orgId = value ?? '',
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // User ID Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User ID',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF867F7F),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'User ID',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF867F7F),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) => _userId = value ?? '',
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Password Field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF867F7F),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF867F7F),
                          ),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _togglePasswordVisibility, // Toggle password visibility
                          ),
                        ),
                        obscureText: _obscureText, // Use the state variable
                        onSaved: (value) => _password = value ?? '',
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Dive In Button
                  ElevatedButton(
                    child: Text(
                      'Dive In',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Implement login logic
                        Navigator.pushReplacementNamed(
                          context,
                          '/warehouse_selection',
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 50),
                      backgroundColor: Color(0xFF3C3D37),
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
      ),
    );
  }
}
