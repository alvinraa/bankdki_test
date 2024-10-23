import 'package:bankdki_test/core/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstLayerWidget extends StatefulWidget {
  const FirstLayerWidget({super.key});

  @override
  State<FirstLayerWidget> createState() => _FirstLayerWidgetState();
}

class _FirstLayerWidgetState extends State<FirstLayerWidget> {
  List<Color> gradientColor = const [Color(0xFFFE654D), Color(0xFFFEC74D)];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(75),
              bottomRight: Radius.circular(75),
            ),
            // gradient: LinearGradient(
            //   colors: gradientColor,
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            color: Color(0xFFFE654D),
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFFFF84B),
                width: 3.0,
              ),
            ),
          ),
        ),
        Column(
          children: [
            buildActionButton(),
            buildGreeting(),
            buildWallet(),
          ],
        ),
      ],
    );
  }

  Widget buildActionButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // choose language
          SizedBox(
            height: 60,
            width: 150,
            child: Image.asset(
              Assets.jakonepay,
              color: Colors.white,
              scale: 1,
            ),
          ),
          const Spacer(),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: gradientColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.file_copy_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // jakcard
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: gradientColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGreeting() {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon person
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.person,
              color: Color(0xFFFE654D),
              size: 40,
            ),
          ),
          // greetings
          const SizedBox(width: 24),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning,',
                style: GoogleFonts.nunito(
                  textStyle: textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Guest',
                style: GoogleFonts.nunito(
                  textStyle: textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget buildWallet() {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      width: 320,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance Account',
                  style: GoogleFonts.nunito(
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Rp',
                      style: GoogleFonts.nunito(
                        textStyle: textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '0',
                      style: GoogleFonts.nunito(
                        textStyle: textTheme.labelLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '-',
                  style: GoogleFonts.nunito(
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // topup
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
                border: Border.all(color: const Color(0xFFFFF84B)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Top Up',
                  style: GoogleFonts.nunito(
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
