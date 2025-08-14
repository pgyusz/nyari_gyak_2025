import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:nyari_gyak_2025/camera_screen.dart';
import 'package:nyari_gyak_2025/maps_screen.dart';
import 'package:nyari_gyak_2025/network/apiclient.dart';
import 'package:nyari_gyak_2025/providers/user_data.dart';
import 'package:nyari_gyak_2025/screens/welcome_screen.dart';
import 'package:nyari_gyak_2025/upper_body.dart';
import 'package:nyari_gyak_2025/welcome_scren.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient apiClient = ApiClient(client: http.Client());
  UserData userData = UserData(apiClient: apiClient);
  try {
    final response = await apiClient.callSetFavorite('1111', '15', '1');
    if (response.success == '0') {
      debugPrint(response.message);
    }
    debugPrint(response.success);
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider<UserData>(create: (_) => userData)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: WelcomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<double> percentageNotifier = ValueNotifier(0);
  final TextEditingController originalPrice = TextEditingController(text: '10');

  Future<String> future() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      return FlutterUdid.udid;
    } catch (exception) {
      print(exception.toString());
      return "error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        actions: [Icon(Icons.three_k_outlined)],
        title: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Text(widget.title, style: TextStyle(color: Colors.white)),
              Text(""),
            ],
          ),
        ),
      ),

      body: FutureBuilder(
        future: future(),
        builder: (context, snapshot) {
          var connectionState = snapshot.connectionState;
          switch (connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  Expanded(
                    child: Body(
                      percentageNotifier: percentageNotifier,
                      originalPrice: originalPrice,
                    ),
                  ),
                  Expanded(
                    child: Body.lower(
                      percentageNotifier: percentageNotifier,
                      originalPrice: originalPrice,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(snapshot.data!),
                  ),
                ],
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
