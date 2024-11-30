import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Python Compiler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PythonCompiler(),
      debugShowCheckedModeBanner: false,
    )
  }
}

class PythonCompiler extends StatefulWidget {
  @override
  _PythonCompilerState createState() => _PythonCompilerState();
}

class _PythonCompilerState extends State<PythonCompiler> {
  TextEditingController _controller = TextEditingController();
  String _output = '';
  String _error = '';

  Future<void> _executeCode() async {
    final code = _controller.text;
    final url = Uri.parse('http://10.0.2.2:5000/execute');  // For Android emulator
    // final url = Uri.parse('http://mobileip/execute');       //for physical mobile
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': code}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _output = data['result'] ?? 'No output';
        _error = data['error'] ?? '';
      });
    } else {
      setState(() {
        _output = '';
        _error = 'Error: ${response.reasonPhrase}';
      });
    }
  }

  void _clearInputOutput() {
    setState(() {
      _controller.clear();
      _output = '';
      _error = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Python Compiler'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Enter Python code here',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _executeCode,
                    child: Text('Submit'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _clearInputOutput,
                    child: Text('Clear'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Output:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_output),
              SizedBox(height: 8),
              Text(
                'Error:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_error),
            ],
          ),
        ),
      ),
    );
  }
}
