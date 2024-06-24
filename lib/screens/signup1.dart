import 'package:flutter/material.dart';
import 'package:mooflicheck/pages/signup2.dart';
import 'package:mooflicheck/widgets/custom_text_field.dart';
import 'package:mooflicheck/widgets/password_field.dart';

class SignupPage1 extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up', style: TextStyle(color: Colors.purple)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset('assets/logo.png', height: 100),
              SizedBox(height: 20),
              CustomTextField(
                hint: 'Username',
                icon: Icons.person,
                onSaved: (value) => formData['username'] = value,
                allowNumbers: false, // Disallow numbers in username
              ),
              SizedBox(height: 10),
              CustomTextField(
                hint: 'Email',
                icon: Icons.email,
                onSaved: (value) {
                  if (value != null && value.contains('@')) {
                    formData['email'] = value;
                  } else {
                    return 'Please enter a valid email';
                  }
                },
              ),
              SizedBox(height: 10),
              PasswordField(
                hint: 'Password',
                onSaved: (value) => formData['password'] = value,
              ),
              SizedBox(height: 10),
              PasswordField(
                hint: 'Confirm Password',
                onSaved: (value) => formData['confirm_password'] = value,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Back'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage2(formData: formData),
                          ),
                        );
                      }
                    },
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}