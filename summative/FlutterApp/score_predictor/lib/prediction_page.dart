import 'package:flutter/material.dart';
import 'api_service.dart';

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
  final ApiService _apiService = ApiService();

  Future<void> _predictScore() async {
    final double hoursStudied = double.tryParse(_hoursStudiedController.text) ?? 0;
    final double previousScores = double.tryParse(_previousScoresController.text) ?? 0;
    final double sleepHours = double.tryParse(_sleepHoursController.text) ?? 0;
    final int samplePapers = int.tryParse(_samplePapersController.text) ?? 0;

    // Validate input values
    if (_hoursStudiedController.text.isEmpty ||
        _previousScoresController.text.isEmpty ||
        _sleepHoursController.text.isEmpty ||
        _samplePapersController.text.isEmpty) {
      setState(() {
        _result = 'Please fill in all fields.';
      });
      return;
    }

    // Range validation
    if (hoursStudied < 1 || hoursStudied > 10) {
      setState(() {
        _result = 'Hours Studied must be between 1 and 10.';
      });
      return;
    }
    if (previousScores < 0 || previousScores > 100) {
      setState(() {
        _result = 'Previous Scores must be between 0 and 100.';
      });
      return;
    }
    if (sleepHours < 4 || sleepHours > 10) {
      setState(() {
        _result = 'Sleep Hours must be between 4 and 10.';
      });
      return;
    }
    if (samplePapers < 0 || samplePapers > 10) {
      setState(() {
        _result = 'Sample Question Papers Practiced must be between 0 and 10.';
      });
      return;
    }

    // Call the API service to get prediction
    final predictionResult = await _apiService.getPrediction(
      hoursStudied: hoursStudied,
      previousScore: previousScores,
      sleepHours: sleepHours,
      samplePapers: samplePapers,
    );

    setState(() {
      _result = predictionResult;
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictScore,
              child: Text(
                'Predict',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: Size(double.infinity, 50), // Makes the button wider
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green.shade300, width: 2),
              ),
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
              keyboardType: TextInputType.number,
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