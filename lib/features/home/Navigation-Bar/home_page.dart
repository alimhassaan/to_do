import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../Banner/banner.dart';
import 'profile.dart';
import 'stop_watch.dart';
import 'timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final List<Widget> navPage = [
      HomePage(),
      StopWatchTimer(),
      TimerWatch(),
      Profile(),
    ];
    int selectedIndex = 0;
    // IndexedStack(                ------------> مش شغاله
    //   index: selectedIndex,
    //   children: navPage,
    // );
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(
            255,
            0,
            10,
            25,
          ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // Banner Photo
              width: double.infinity,
              height: 170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Home_Photo.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(
                left: 10,
                top: 60,
              ),
              child: Banners(),
            ),
          ],
        ),
      ),

      bottomNavigationBar: // Navigition Bar
      SafeArea(
        child: CurvedNavigationBar(
          height: 50,
          items: [
            Icon(Icons.home, size: 30),
            Icon(
              Icons.timer_outlined,
              size: 30,
            ),
            Icon(
              Icons.access_time,
              size: 30,
            ),
            Icon(
              Icons.person,
              size: 30,
            ),
          ],
          index: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
