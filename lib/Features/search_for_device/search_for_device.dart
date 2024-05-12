import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sign_talk_app/controllers/data_controller.dart';

import '../../core/utils/AppRouter.dart';
import '../../curved_container.dart';

class SearchForDevice extends StatefulWidget {
  const SearchForDevice({super.key});

  @override
  State<SearchForDevice> createState() => _SearchForDeviceState();
}

class _SearchForDeviceState extends State<SearchForDevice> {
  bool isListening = false;
  BluetoothConnection? connection;
  List<BluetoothDevice> devices = [];
  bool isScanning = false;

  //String gloveText = 'Welcome';
  String bluetoothConnected = 'Not Connected';

  @override
  void initState() {
    super.initState();
    _initBluetooth();
  }

  Future<void> _initBluetooth() async {
    try {
      await FlutterBluetoothSerial.instance.requestEnable();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _scanDevices() async {
    setState(() {
      isScanning = true;
      devices.clear();
    });

    try {
      final Stream<BluetoothDiscoveryResult> results =
          FlutterBluetoothSerial.instance.startDiscovery();

      results.listen((BluetoothDiscoveryResult result) {
        setState(() {
          devices.add(result.device);
        });
      }).onDone(() {
        setState(() {
          isScanning = false;
        });
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        isScanning = false;
      });
    }
  }

  Future<void> _connectToDevice(
      BluetoothDevice device, DataController controller) async {
    try {
      connection = await BluetoothConnection.toAddress(device.address);

      // Set up listeners for incoming data or connection events
      _setUpConnectionListeners(
          controller); // Call _setUpConnectionListeners here
      setState(() {
        bluetoothConnected = 'Connected to ${device.name}';
      });
      print('Connected to ${device.name}');
    } catch (e) {
      print('Failed to connect: $e');
    }
  }

  void _setUpConnectionListeners(DataController controller) {
    if (!isListening) {
      connection!.input!.listen((Uint8List data) {
        // Handle incoming data
        String receivedString = String.fromCharCodes(data);
        print('Received data = $receivedString');

        // Send data to API
        if (controller.startListenToAPI == true) {
          _sendDataToApi(receivedString, controller);
        }
      }, onDone: () {
        // Handle connection closed event
        print('Connection closed');
      }, onError: (error) {
        // Handle error event
        print('Error: $error');
      });
      isListening = true;
    }
  }

  Future<void> _sendDataToApi(
      String receivedString, DataController controller) async {
    final url = Uri.parse('http://smartglove.somee.com/api/Sensor_Data');
    print('headers:${receivedString.trim()}');
    List<String> numberStrings = receivedString.split(',');
    print('headers1:${numberStrings[0]}');
    print('headers2:${numberStrings[1]}');
    print('headers3:${numberStrings[2]}');
    print('headers4:${numberStrings[3]}');
    print('headers5:${numberStrings[4]}');

    final headers = {
      'Sensor1_Value': numberStrings[0],
      'Sensor2_Value': numberStrings[1],
      'Sensor3_Value': numberStrings[2],
      'Sensor4_Value': numberStrings[3],
      'Sensor5_Value': numberStrings[4],
      'UserID': '1'
    };
    final body = jsonEncode({
      "Sensor1_Value": numberStrings[0],
      "Sensor2_Value": numberStrings[1],
      "Sensor3_Value": numberStrings[2],
      "Sensor4_Value": numberStrings[3],
      "Sensor5_Value": numberStrings[4],
      "UserID": 1
    });

    try {
      final response = await http.post(
        body: body,
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        //body: body,
      );

      if (response.statusCode == 201) {
        print('${response.body}');
        controller.changeGloveDataText(response.body);
        //gloveText = response.body;
        print('glove text: ${controller.gloveText}');

        print('Data sent successfully');
      } else {
        print('Failed to send data. Error: ${response.body}');
      }
    } catch (e) {
      print('Error sending data to API: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(
      builder: (context, controller, _) => Scaffold(
        body: Column(
          children: [
            CurvedBottomContainer(press: () {}, icon: Icons.sign_language),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _scanDevices();
                    },
                    child: Text(
                      isScanning ? 'Scanning...' : 'Scan Devices',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/loading-16-svgrepo-com 1.png',
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            Expanded(
              child: ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return GestureDetector(
                      onTap: () {
                        _connectToDevice(device, controller);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xffE9F4FA),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Image.asset('assets/images/Vector.png'),
                                const SizedBox(width: 25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Name: ${device.name ?? 'null string value'}',
                                      style: const TextStyle(
                                          color: Color(
                                            0xff5FBDC5,
                                          ),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      device.address,
                                      style: const TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
            Text(
              bluetoothConnected,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            bluetoothConnected == 'Not Connected'
                ? Container(
                    height: 70,
                  )
                : AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeIn,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kHomeView);
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ),
                  ),
            /*AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeIn,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kHomeView);
                    },
                    child: const Text('Next'),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
