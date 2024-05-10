import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:stay_swasth/widgets/meal_plan.dart';

final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

const String AvatarUrl = "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GFCarousel(
              height: 190.0,
              aspectRatio: 16 / 9,
              pagerSize: 6,
              autoPlay: true,
              items: imageList.map(
                    (url) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MealPlanPage()),
                        );
                      },
                      child: const Column(
                        children: [
                          GFAvatar(
                            backgroundImage: NetworkImage(AvatarUrl),
                            shape: GFAvatarShape.circle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Diet")
                        ],
                      )
                    )
                  ],
                ),
                Column(
                  children: [
                    GFAvatar(
                      backgroundImage: NetworkImage(AvatarUrl),
                      shape: GFAvatarShape.circle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Exercise")
                  ],
                ),
                Column(
                  children: [
                    GFAvatar(
                      backgroundImage: NetworkImage(AvatarUrl),
                      shape: GFAvatarShape.circle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Mind")
                  ],
                ),
                Column(
                  children: [
                    GFAvatar(
                      backgroundImage: NetworkImage(AvatarUrl),
                      shape: GFAvatarShape.circle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Guidelines")
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true, // Add this to enable scrolling within the GridView
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling for the GridView itself
              crossAxisCount: 2,
              children: [
                MyTile("Water"),
                MyTile("Weight"),
                MyTile("Food Swap"),
                MyTile("Bmi"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  final String number;

  MyTile(this.number);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}