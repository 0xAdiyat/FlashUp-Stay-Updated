import 'package:flutter/material.dart';
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
                    borderRadius: BorderRadius.circular(16),
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
          )
        ],
      ),
    );
  }
}
