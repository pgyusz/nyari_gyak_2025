import 'package:flutter/material.dart';
import 'package:nyari_gyak_2025/extensions/context_extension.dart';
import 'package:nyari_gyak_2025/maps_screen.dart';
import 'package:nyari_gyak_2025/res/colours.dart';
import 'package:nyari_gyak_2025/res/constants.dart';
import 'package:nyari_gyak_2025/res/fonts.dart';
import 'package:nyari_gyak_2025/screens/register_client_screen.dart';
import 'package:nyari_gyak_2025/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.045,
                ), //MediaQuery.of(context).size.height * 0.045
                Image.asset('assets/lotus.png'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  'Experience beauty on \n your schedule',
                  textAlign: TextAlign.center,
                  style: Fonts.cormorant(
                    fontSize: FontSizes.large,
                    weight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Find the best local beauty experts for hair, nails, skincare, and wellness — \n and book appointments that fit into your life, not the other way around.",
                  textAlign: TextAlign.center,
                  style: Fonts.montserrat(),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                CustomButton(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => RegisterClientScreen()),
                    );
                  },
                  width: double.infinity,
                  child: Text(
                    'Get Started',
                    style: Fonts.montserrat(
                      color: Colours.white,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
