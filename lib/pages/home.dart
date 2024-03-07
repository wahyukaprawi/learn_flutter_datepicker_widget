import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  DateTime? selectedDate;
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = selectedDate != null
        ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
        : ''; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Date Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Please input your name',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Place of Birth',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Please input your place birth',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Date of Birth',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'Please input your date birth',
                suffixIcon: IconButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2002),
                      lastDate: DateTime(2050),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        _dateController.text =
                            "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}";
                      });
                    }
                  },
                  icon: Icon(Icons.date_range),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
