import 'package:chapter_3_basic_widgets/fooderlich_theme.dart';
import 'package:flutter/material.dart';

class card2 extends StatelessWidget {
  const card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(height: 450, width: 350),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          image: DecorationImage(
            image: AssetImage("assets/mag5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: CircleAvatar(radius: 30, backgroundImage: AssetImage("assets/me.jpg")),
                ),
              ]),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 60,
                      left: 0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'Smoothies',
                          style: FooderlichTheme.LightTextTheme.headline1,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        "Recipes",
                        style: FooderlichTheme.LightTextTheme.headline1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
