import 'package:flutter/material.dart';

class ExpenseNotePage extends StatefulWidget {
  @override
  _ExpenseNotePageState createState() => _ExpenseNotePageState();
}

class _ExpenseNotePageState extends State<ExpenseNotePage> {
  String? _selectedLeaveType;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _justificationRequired = false;
  TextEditingController _commentController = TextEditingController();

  final List<String> _leaveTypes = [
    'Congé payés',
    'Congé maladie',
    'Congé sans solde'
  ];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  int _calculateWorkingDays() {
    if (_startDate == null || _endDate == null) return 0;
    int days = 0;
    DateTime current = _startDate!;
    while (current.isBefore(_endDate!) || current.isAtSameMomentAs(_endDate!)) {
      if (current.weekday != DateTime.saturday && current.weekday != DateTime.sunday) {
        days++;
      }
      current = current.add(Duration(days: 1));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congé'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Type de Congé', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedLeaveType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLeaveType = newValue;
                });
              },
              items: _leaveTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Période', style: TextStyle(fontSize: 18)),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: () => _selectDate(context, true),
                  child: Text(_startDate == null
                      ? 'Début'
                      : DateFormat('dd-MM-yyyy').format(_startDate!)),
                ),
                TextButton(
                  onPressed: () => _selectDate(context, false),
                  child: Text(_endDate == null
                      ? 'Fin'
                      : DateFormat('dd-MM-yyyy').format(_endDate!)),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Jours ouvrés: ${_calculateWorkingDays()}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('Justificatif', style: TextStyle(fontSize: 18)),
            SwitchListTile(
              title: Text('Oui / Non'),
              value: _justificationRequired,
              onChanged: (bool value) {
                setState(() {
                  _justificationRequired = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Commentaire', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Aucun',
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  DateFormat(String s) {}
}