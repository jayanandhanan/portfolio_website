import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://drive.google.com/file/d/17GWNgaHmGp1DEEFeXmXyJkG5OWvbSJGO/view?usp=drive_link');
final Uri _linkedInUrl = Uri.parse(
    'https://www.linkedin.com/in/jaya-nandhanan-v-26392b258');
final Uri _githubUrl = Uri.parse('https://github.com/jayanandhanan');
final Uri _instagramUrl = Uri.parse('https://www.instagram.com/jaya_nandhanan/');

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.linkedIn,
    AppAssets.insta,
    AppAssets.github,
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: HelperClass(
        mobile: Column(
          children: [
            buildHomePersonalInfo(size),
            Constants.sizedBox(height: 25.0),
            const ProfileAnimation()
          ],
        ),
        tablet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: buildHomePersonalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: buildHomePersonalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        paddingWidth: size.width * 0.1,
        bgColor: Colors.transparent,
      ),
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Jaya Nandhanan V',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'App Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText(' Full Stack Developer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                  TyperAnimatedText(' Freelancer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue))
                ],
                repeatForever: true, // Repeat the animation forever
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'I\'m very glad to let y\'all know about'
            ' myself, my strengths'
            ' and my projects that I\'ve completed in my portfolio.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: Row(
              children: [
                for (var index = 0; index < socialButtons.length; index++)
                  InkWell(
                    onTap: () {
                      if (index == 0) {
                        _launchUrl(_linkedInUrl);
                      } else if (index == 1) {
                        _launchUrl(_instagramUrl);
                      } else if (index == 2) {
                        _launchUrl(_githubUrl);
                      }
                    },
                    borderRadius: BorderRadius.circular(550.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        socialButtons[index],
                        width: 45,
                        height: 45,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
            onTap: () {
              _launchUrl(_url); // Call the function to launch the PDF link
            },
            buttonName: 'Download CV',
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launch(url.toString())) {
      throw Exception('Could not launch $url');
    }
  }
}
