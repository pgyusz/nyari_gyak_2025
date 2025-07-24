import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nyari_gyak_2025/providers/user_data.dart';
import 'package:provider/provider.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _cameras = context.read<UserData>().cameras;
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                // Handle access errors here.
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> execute() async {
    final file = await controller.takePicture();
    print(file.path);
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            CameraPreview(controller),
            ElevatedButton(
              onPressed: () async {
                await execute();
              },
              child: Text('take picture'),
            ),
          ],
        ),
      ),
    );
    //return MaterialApp(home: CameraPreview(controller));
  }
}
