import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://linear-regression-model-b17p.onrender.com';

  Future<String> getPrediction({
    required double hoursStudied,
    required double previousScore,
    required double sleepHours,
    required int samplePapers,
  }) async {
    final url = Uri.parse('$_baseUrl/predict');

    try {
      print('Sending request to: $url');
      print('Request body: ${jsonEncode({
        'hours_studied': hoursStudied,
        'previous_score': previousScore,
        'sleep_hours': sleepHours,
        'sample_question_papers': samplePapers,
      })}');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'hours_studied': hoursStudied,
          'previous_score': previousScore,
          'sleep_hours': sleepHours,
          'sample_question_papers': samplePapers,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final double prediction = responseBody['prediction'];
        return 'Predicted Score: ${prediction.toStringAsFixed(2)}';
      } else {
        return 'Error: Unable to get prediction. Status Code: ${response.statusCode}, Body: ${response.body}';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Failed to get prediction. Error: $e';
    }
  }
}