import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:nyari_gyak_2025/main.dart';
import 'package:nyari_gyak_2025/products_screen.dart';
import 'package:nyari_gyak_2025/providers/user_data.dart';
import 'package:nyari_gyak_2025/res/colours.dart';
import 'package:nyari_gyak_2025/res/fonts.dart';
import 'package:provider/provider.dart';

class OldWelcomeScreen extends StatefulWidget {
  const OldWelcomeScreen({super.key});

  @override
  State<OldWelcomeScreen> createState() => _OldWelcomeScreenState();
}

class _OldWelcomeScreenState extends State<OldWelcomeScreen> {
  bool _isLoading = false;

  Future<String> future() async {
    try {
      return 'cs';
    } catch (exception) {
      print(exception.toString());
      return "error";
    }
  }

  late UserData userData;

  @override
  void initState() {
    userData = context.read<UserData>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colours.green,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  'Welcome ${userData.name} !:D',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextField(controller: textEditingController),
            Expanded(
              flex: 3,
              child: Center(
                child:
                    _isLoading
                        ? CircularProgressIndicator()
                        : OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            String title = await future();
                            if (context.mounted) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ProductsScreen(),
                                ),
                              );
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          },
                          child: Text(
                            'NExt screen',
                            style: Fonts.montserrat(fontSize: FontSizes.large),
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
