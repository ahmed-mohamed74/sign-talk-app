import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../controllers/data_controller.dart';
import '../../models/mode_model.dart';

class ApiService {
  static const String baseUrl = 'http://smartglove.somee.com/api'; // Base URL

  static Future<void> sendSensorData(
      String receivedString,
      DataController controller,
      ) async {
    final url = Uri.parse('$baseUrl/Sensor_Data');

    final List<String> numberStrings = receivedString.split(',');

    final body = jsonEncode({
      "Sensor1_Value": numberStrings[0],
      "Sensor2_Value": numberStrings[1],
      "Sensor3_Value": numberStrings[2],
      "Sensor4_Value": numberStrings[3],
      "Sensor5_Value": numberStrings[4],
      'ModeId':controller.gloveMode+1,
      "UserID": 1,
    });

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 201) {
        controller.changeGloveDataText(response.body);
        print('Data sent successfully. Response: ${response.body}');
      } else {
        print('Failed to send data. Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error sending data to API: $e');
    }
  }
  static Future<dynamic> getModes() async {
    final url = Uri.parse('$baseUrl/modes');

    try {
      final response = await http.get(url,headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },);

      if (response.statusCode == 200) {
        // Check for null response body before decoding
        if (response.body == null) {
          throw Exception('Error fetching modes: Empty response body');
        }

        final data = jsonDecode(response.body);
        print(data.map((item) => Mode.fromJson(item)).toList());
        return data.map((item) => Mode.fromJson(item)).toList();
      } else {
        throw Exception('Failed to get modes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching modes: $e');
    }
  }

  static Future<void> updateMode(Mode mode) async {
    final url = Uri.parse('$baseUrl/modes/${mode.modeId}');

    final body = jsonEncode(mode.toJson());

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print('Mode ${mode.modeId} updated successfully');
      } else {
        throw Exception('Failed to update mode: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating mode: $e');
    }
  }

  static Future<void> createMode(Mode mode) async {
    final url = Uri.parse('$baseUrl/modes');

    final body = jsonEncode(mode.toJson());

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 201) {
        print('Mode created successfully');
      } else {
        throw Exception('Failed to create mode: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating mode: $e');
    }
  }
}
