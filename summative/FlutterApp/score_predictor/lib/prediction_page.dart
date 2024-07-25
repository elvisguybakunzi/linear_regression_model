import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final TextEditingController _hoursStudiedController = TextEditingController();
  final TextEditingController _previousScoresController = TextEditingController();
  final TextEditingController _sleepHoursController = TextEditingController();
  final TextEditingController _samplePapersController = TextEditingController();

  String _result = '';

  void _predictScore() {
    // Add your prediction logic here
    setState(() {
      // Example logic for result
      _result = 'Predicted Score: 90';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predict Score'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'You can Predict here.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildInputField('Hours Studied', _hoursStudiedController, Colors.green.shade100),
                  _buildInputField('Previous Scores', _previousScoresController, Colors.blue.shade100),
                  _buildInputField('Sleep Hours', _sleepHoursController, Colors.yellow.shade100),
                  _buildInputField('Sample Question Papers Practiced', _samplePapersController, Colors.purple.shade100),
                ],
              ),
            ),
            // SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictScore,
              child: Text('Predict'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green.shade100,
              child: Text(
                _result,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.edit, color: Colors.black54),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
