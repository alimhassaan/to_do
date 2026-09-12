import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              "Better Hapits",

              style: TextStyle(
                color:
                    const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ),
                fontSize: 25,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            Text(
              "Bigger Dream🚀",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            Text(
              "small step every day\nlead to big result",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
        SizedBox(width: 75),
        Column(
          mainAxisAlignment:
              MainAxisAlignment.end,
          children: [
            Text(
              "🔥",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Text(
              "Day Streak",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
