import 'package:flutter/material.dart';

class PregnancyForm extends StatefulWidget {
  @override
  _PregnancyFormState createState() => _PregnancyFormState();
}

class _PregnancyFormState extends State<PregnancyForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String? fullName, email, phoneNumber, emergencyContactName, emergencyContactNumber;
  DateTime? dateOfBirth, dueDate;
  String? pregnancyWeek, numberOfPregnancies, complications, allergies, bloodGroup, doctorName, doctorContact, medicalHistory, medications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregnancy Registration Form'),
        backgroundColor: Colors.deepPurple, // Dark purple theme for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Full Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => fullName = value,
              ),

              // Email Address
              TextFormField(
                decoration: InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
              ),

              // Phone Number
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phoneNumber = value,
              ),

              // Date of Birth
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onSaved: (value) => dateOfBirth = DateTime.tryParse(value!),
              ),

              // Emergency Contact Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Emergency Contact Name'),
                onSaved: (value) => emergencyContactName = value,
              ),

              // Emergency Contact Number
              TextFormField(
                decoration: InputDecoration(labelText: 'Emergency Contact Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => emergencyContactNumber = value,
              ),

              // Expected Due Date
              TextFormField(
                decoration: InputDecoration(labelText: 'Expected Due Date'),
                onSaved: (value) => dueDate = DateTime.tryParse(value!),
              ),

              // Pregnancy Week
              TextFormField(
                decoration: InputDecoration(labelText: 'Pregnancy Week'),
                onSaved: (value) => pregnancyWeek = value,
              ),

              // Number of Pregnancies
              TextFormField(
                decoration: InputDecoration(labelText: 'Number of Pregnancies'),
                onSaved: (value) => numberOfPregnancies = value,
              ),

              // Complications
              TextFormField(
                decoration: InputDecoration(labelText: 'Any Complications'),
                onSaved: (value) => complications = value,
              ),

              // Allergies
              TextFormField(
                decoration: InputDecoration(labelText: 'Allergies'),
                onSaved: (value) => allergies = value,
              ),

              // Blood Group
              TextFormField(
                decoration: InputDecoration(labelText: 'Blood Group'),
                onSaved: (value) => bloodGroup = value,
              ),

              // Doctor's Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Doctor\'s Name'),
                onSaved: (value) => doctorName = value,
              ),

              // Doctor's Contact Information
              TextFormField(
                decoration: InputDecoration(labelText: 'Doctor\'s Contact Information'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => doctorContact = value,
              ),

              // Medical History
              TextFormField(
                decoration: InputDecoration(labelText: 'Medical History'),
                onSaved: (value) => medicalHistory = value,
              ),

              // Current Medications
              TextFormField(
                decoration: InputDecoration(labelText: 'Current Medications'),
                onSaved: (value) => medications = value,
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission logic here
                    print("Form Submitted Successfully!");
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Dark purple button
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple[50], // Light purple background
    );
  }
}

void main() => runApp(MaterialApp(
  home: PregnancyForm(),
));
