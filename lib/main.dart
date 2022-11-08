import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLightWhite,
        body: const HomeScreen(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? SvgPicture.asset('assets/home_selected_icon.svg')
                    : SvgPicture.asset('assets/home_unselected_icon.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? SvgPicture.asset('assets/bookmark_selected_icon.svg')
                    : SvgPicture.asset('assets/bookmark_unselected_icon.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? SvgPicture.asset('assets/notification_selected_icon.svg')
                    : SvgPicture.asset(
                        'assets/notification_unselected_icon.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? SvgPicture.asset('assets/profile_selected_icon.svg')
                    : SvgPicture.asset('assets/profile_unselected_icon.svg'),
                label: ''),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
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
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 15,
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 38),
                        child: Text(
                          '#Security',
                          style: kPoppinsMedium.copyWith(
                              color: kGrey,
                              fontSize: SizeConfig.screenSizeHorizontal! * 3),
                        ),
                      );
                    }),
              )),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 304,
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(right: 20),
                    height: 304,
                    width: 255,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      boxShadow: [
                        BoxShadow(
                            color: kDarkBlue.withOpacity(0.051),
                            blurRadius: 24.0,
                            spreadRadius: 0.0,
                            offset: const Offset(0.0, 3.0))
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 164,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VhJTIwYmVhY2h8ZW58MHx8MHx8&w=1000&q=80')),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Flexible(
                          child: Text(
                            "Cox's Bazar is a city, fishing port, tourism centre, and district headquarters in Southeastern Bangladesh.",
                            style: kPoppinsBold.copyWith(
                                fontSize:
                                    SizeConfig.screenSizeHorizontal! * 3.5),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 19,
                                  backgroundColor: kLightBlue,
                                  backgroundImage: NetworkImage(
                                      "https://avatars.githubusercontent.com/u/67780459?v=4"),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Ahsaf Hussain Adiyat",
                                      style: kPoppinsSemiBold.copyWith(
                                          fontSize:
                                              SizeConfig.screenSizeHorizontal! *
                                                  3),
                                    ),
                                    Text(
                                      "Jan 1, 2022",
                                      style: kPoppinsSemiBold.copyWith(
                                          color: kGrey,
                                          fontSize:
                                              SizeConfig.screenSizeHorizontal! *
                                                  3),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 38,
                              width: 38,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                                color: kLightWhite,
                              ),
                              child: SvgPicture.asset('assets/share_icon.svg'),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Short for you',
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.screenSizeHorizontal! * 4.5,
                ),
              ),
              Text(
                'View All',
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: SizeConfig.screenSizeHorizontal! * 3,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 88,
            // child: ListView.builder(itemBuilder: (context, index) {
            //   return Container();
            // }),
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(9),
                margin: const EdgeInsets.only(right: 20),
                width: 200,
                height: 88,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(kBorderRadius),
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
                    Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1503756234508-e32369269deb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c2VhfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                            fit: BoxFit.cover),
                      ),
                      child: SvgPicture.asset(
                        'assets/play_icon.svg',
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Top Trending Beach in 2022",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: SizeConfig.screenSizeHorizontal! * 3.5),
                        ),
                        const SizedBox(
                          height: 1.5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/eye_icon.svg'),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '15,999',
                              style: kPoppinsMedium.copyWith(
                                  color: kGrey,
                                  fontSize:
                                      SizeConfig.screenSizeHorizontal! * 3),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
