import 'package:flutter/material.dart';
import 'package:nyari_gyak_2025/extensions/context_extension.dart';
import 'package:nyari_gyak_2025/res/colours.dart';
import 'package:nyari_gyak_2025/res/constants.dart';
import 'package:nyari_gyak_2025/res/fonts.dart';
import 'package:nyari_gyak_2025/widgets/custom_button.dart';

class RegisterClientScreen extends StatelessWidget {
  const RegisterClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register as a Client',
                style: Fonts.cormorant(
                  fontSize: FontSizes.large,
                  weight: FontWeight.w700,
                  color: Colours.green,
                ),
              ),
              SizedBox(height: context.height * 0.01),
              Text(
                'Sign up and start exploring top-rated salons near you.',
                style: Fonts.montserrat(fontSize: FontSizes.smallest),
              ),
              TextField(),
              TextField(),
              CustomButton(
                onTap: () {},
                child: Text(
                  'Continue',
                  style: Fonts.montserrat(color: Colours.white),
                ),
              ),
              Text(
                '-or-',
                style: Fonts.montserrat(fontSize: FontSizes.smallest),
              ),
              CustomButton(
                onTap: () {},
                child: Text(
                  'Continue with Apple',
                  style: Fonts.montserrat(color: Colours.white),
                ),
              ),
              CustomButton(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.android),
                    Text(
                      'Continue with Google',
                      style: Fonts.montserrat(color: Colours.white),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  print('kezdesz regisztralni');
                },
                child: RichText(
                  text: TextSpan(
                    style: Fonts.montserrat(fontSize: FontSizes.smallest),
                    text: 'Already have an account?',
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: Fonts.montserrat(
                          fontSize: FontSizes.smallest,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Switch roles',
                  style: Fonts.montserrat(
                    decoration: TextDecoration.underline,
                    fontSize: FontSizes.smallest,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
