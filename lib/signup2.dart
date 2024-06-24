import 'package:flutter/material.dart';
import 'package:mooflicheck/pages/signup3.dart';
import 'package:mooflicheck/widgets/custom_text_field.dart';

class SignupPage2 extends StatelessWidget {
  final Map<String, dynamic> formData;

  SignupPage2({required this.formData});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                child: IconButton(
                  icon: Icon(Icons.camera_alt, size: 30),
                  onPressed: () {
                    // Add functionality to capture or select a photo
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                hint: 'First name',
                onSaved: (value) => formData['first_name'] = value,
                allowNumbers: false, // Disallow numbers in first name
              ),
              SizedBox(height: 10),
              CustomTextField(
                hint: 'Last name',
                onSaved: (value) => formData['last_name'] = value,
                allowNumbers: false, // Disallow numbers in last name
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: 'DD',
                      onSaved: (value) => formData['birth_day'] = value,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hint: 'MM',
                      onSaved: (value) => formData['birth_month'] = value,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hint: 'YYYY',
                      onSaved: (value) => formData['birth_year'] = value,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextField(
                hint: 'Phone number (Optional)',
                icon: Icons.phone,
                onSaved: (value) => formData['phone'] = value,
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
                            builder: (context) => SignUp3(formData: formData),
                          ),
                        );
                      }
                    },
                    child: Text('Next', style: TextStyle(color: Colors.white)),
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
