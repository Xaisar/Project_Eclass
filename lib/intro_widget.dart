import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    // super.key,
    required this.color,
    required this.title,
    required this.description,
    required this.skip,
    required this.image,
    required this.onTab,
    required this.index,
  });

  final String color;
  final String title;
  final String description;
  final bool skip;
  final String image;
  final VoidCallback onTab;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: hexToColor(color),
      child: Stack(
        children: [
          Container(
            child: Container(
              width: 196,
              height: 135,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 492,
                    right: 82,
                    left: 82,
                    top: 0,
                    child: Container(
                      width: 30.41,
                      height: 30.55,
                    ),
                  ),
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height / 1.86,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(image),
              alignment: Alignment.center,
            )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2.16,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 18, height: 1.5, color: Colors.grey),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 37,
            right: 140,
            left: 140,
            child: Padding(
                padding: const EdgeInsets.all(0),
                child: skip
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: onTab,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: hexToColor(color),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_circle_right,
                                  color: Color(0xff0A5896),
                                  size: 75,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox()),
          )
        ],
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
