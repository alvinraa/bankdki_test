import 'package:bankdki_test/core/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondLayerWidget extends StatefulWidget {
  const SecondLayerWidget({super.key});

  @override
  State<SecondLayerWidget> createState() => _SecondLayerWidgetState();
}

class _SecondLayerWidgetState extends State<SecondLayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeIconContainer(
            imageAsset: Assets.hmIconExplore,
            title: 'Explore Jakarta',
            onTap: () {},
          ),
          homeIconContainer(
            imageAsset: Assets.hmIconTopup,
            title: 'Top Up JakCard',
            onTap: () {},
          ),
          homeIconContainer(
            imageAsset: Assets.hmIconJakcard,
            title: 'JakCard Balance',
            onTap: () {},
          ),
          homeIconContainer(
            imageAsset: Assets.hmIconEvent,
            title: 'Event',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget homeIconContainer({
    required String imageAsset,
    required String title,
    required Function() onTap,
  }) {
    var textTheme = Theme.of(context).textTheme;
    List<Color> gradientHmIcon = const [
      Color(0xFFFFE3CB),
      Color(0xFFFFFFDC),
    ];
    List<Color> gradientHmIconBorder = const [
      Color(0xFFf9f149),
      Color(0xFFf75c5b),
    ];

    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientHmIconBorder,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientHmIcon,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    imageAsset,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: GoogleFonts.nunito(
                textStyle: textTheme.labelLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
