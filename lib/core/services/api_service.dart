import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sign_talk_app/controllers/sensor_controller.dart';

import '../../controllers/data_controller.dart';
import '../../models/mode_model.dart';

class ApiService {
  static const String baseUrl = 'http://smartglove.somee.com/api'; // Base URL

  static Future<void> sendSensorData(
      String receivedString,
      DataController dataController,
      SensorController sensorController,
      ) async {
    final url = Uri.parse('$baseUrl/Sensor_Data');

    final List<String> numberStrings = receivedString.split(',');

    final body = jsonEncode({
      "Sensor1_Value": numberStrings[0],
      "Sensor2_Value": numberStrings[1],
      "Sensor3_Value": numberStrings[2],
      "Sensor4_Value": numberStrings[3],
      "Sensor5_Value": numberStrings[4],
      'ModeId':dataController.gloveMode+1,
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
        sensorController.changeGloveDataText(response.body);
        print('Data sent successfully. Response: ${response.body}');
      } else {
        print('Failed to send data. Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error sending data to API: $e');
    }
  }
  static Future<List<Mode>?> getModes() async {
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
        List<Mode>? modesList= [];
        for(int i =0 ; i<data.length;i++){
          modesList.add(Mode.fromJson(data[i]));
        }
        return modesList;
      } else {
        throw Exception('Failed to get modes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching modes: $e');
    }
  }

  static Future<void> updateMode(Mode mode) async {
    final url = Uri.parse('$baseUrl/modes/${mode.modeId}');
    print("mode: $mode");
    final modeData = {
      "modeId": mode.modeId, // Don't increment the ID here
      "modeName": mode.modeName,
      "a": mode.a,
      "b": mode.b,
      "c": mode.c,
      "d": mode.d,
      "e": mode.e,
      "f": mode.f,
      "g": mode.g,
      "h": mode.h,
      "i": mode.i,
      "j": mode.j,
      "k": mode.k,
      "l": mode.l,
      "m": mode.m,
      "n": mode.n
    };
    final body = jsonEncode(modeData);
    print("body: $body");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('Mode ${mode.modeId} updated successfully');
      } else {
        if (response.statusCode == 404) {
          throw Exception('Mode not found: ${response.statusCode}'); // Specific error for 404
        } else {
          try {
            // Attempt to parse the response body for more details (optional)
            final decodedResponse = jsonDecode(response.body);
            final errorMessage = decodedResponse['error']?.toString();
            if (errorMessage != null) {
              throw Exception('Failed to update mode: $errorMessage');
            } else {
              throw Exception('Failed to update mode: ${response.statusCode}');
            }
          } catch (e) {
            // Handle potential parsing errors
            throw Exception('Failed to update mode: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      throw Exception('Error updating mode: $e');
    }
  }

  static Future<void> createMode(Mode mode) async {
    final url = Uri.parse('$baseUrl/modes');

    print("mode: $mode");
    final modeData = { // Don't increment the ID here
      "modeName": mode.modeName,
      "a": mode.a,
      "b": mode.b,
      "c": mode.c,
      "d": mode.d,
      "e": mode.e,
      "f": mode.f,
      "g": mode.g,
      "h": mode.h,
      "i": mode.i,
      "j": mode.j,
      "k": mode.k,
      "l": mode.l,
      "m": mode.m,
      "n": mode.n
    };
    final body = jsonEncode(modeData);
    print("body: $body");

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
  static Future<void> deleteMode(int modeId) async {
    final url = Uri.parse('$baseUrl/modes/$modeId'); // Use mode ID in the URL

    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print('Mode $modeId deleted successfully');
      } else {
        throw Exception('Failed to delete mode $modeId : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting mode: $e');
    }
  }

}
