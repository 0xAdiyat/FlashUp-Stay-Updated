import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_styles.dart';
import 'size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLightWhite,
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Row(
            children: [
              Container(
                height: 51,
                width: 51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kLightBlue,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/67780459?v=4"))),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.screenSizeHorizontal! * 4,
                    ),
                  ),
                  Text(
                    'Monday, 7 November',
                    style: kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.screenSizeHorizontal! * 3,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kWhite,
              boxShadow: [
                BoxShadow(
                    color: kDarkBlue.withOpacity(0.051),
                    offset: const Offset(0.0, 3.0),
                    blurRadius: 24.0,
                    spreadRadius: 0.0)
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kPoppinsRegular.copyWith(
                        color: kBlue,
                        fontSize: SizeConfig.screenSizeHorizontal! * 3),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      hintText: 'Search for article...',
                      border: kBorder,
                      errorBorder: kBorder,
                      focusedBorder: kBorder,
                      focusedErrorBorder: kBorder,
                      hintStyle: kPoppinsRegular.copyWith(
                        color: kLightGrey,
                        fontSize: SizeConfig.screenSizeHorizontal! * 3,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kBlue),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/search_icon.svg")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
