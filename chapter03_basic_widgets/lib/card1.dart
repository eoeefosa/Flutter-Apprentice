import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(height: 450, width: 350),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          image: DecorationImage(
            image: AssetImage("assets/mag1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(children: [
            Text(
              "Editors's Choice",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Positioned(
              top: 20,
              child: Text(
                "The Art of Dough",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                "Learn to make the perfect bread",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                "Osemwegie Efosa",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
