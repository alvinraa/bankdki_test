import 'package:bankdki_test/core/common/navigation.dart';
import 'package:bankdki_test/core/common/routes.dart';
import 'package:bankdki_test/core/widget/button/default_button.dart';
import 'package:bankdki_test/core/widget/button/language_button.dart';
import 'package:bankdki_test/core/widget/shimmer/default_shimmer.dart';
import 'package:bankdki_test/feature/login/presentation/widget/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginPage extends StatefulWidget {
  final dynamic data;
  const LoginPage({super.key, this.data});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // for favMovie slider
  int exploreLength = 3;
  final PageController exploreController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    exploreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  children: [
                    buildActionButtons(context),
                    buildImage(context),
                    buildContinue(context),
                  ],
                ),
              ),
              Container(
                width: 10,
              ),
            ],
          ),
          const Positioned(bottom: 20, right: 10, child: HelperWidget()),
        ],
      ),
    );
  }

  Widget buildActionButtons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.fromLTRB(16, 4, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // choose language
          const LanguageButton(),
          // jakcard
          DefaultButton(
            onPressed: () {
              // unused
            },
            label: 'Jakcard',
            withIcon: Container(
              padding: const EdgeInsets.only(right: 8),
              child: const Icon(
                Icons.wallet,
                color: Colors.black,
              ),
            ),
            width: 135,
            height: 30,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 5,
          ),
        ],
      ),
    );
  }

  Widget buildImage(context) {
    var textTheme = Theme.of(context).textTheme;
    // var colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          // image & icon
          Column(
            children: [
              // content
              SizedBox(
                height: 250,
                width: MediaQuery.sizeOf(context).width,
                child: PageView.builder(
                  controller: exploreController,
                  itemCount: exploreLength,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          height: 250,
                          width: 140,
                          'https://storage.jakarta-tourism.go.id/public/images/article/8437415341664213099.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const DefaultShimmer(
                                height: 250,
                                width: 140,
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://placehold.co/600x400?text=No+Image',
                              fit: BoxFit.cover,
                              height: 300,
                              width: 140,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              // text google
              Text(
                'Explore Jakarta with Jakarta Tourist Pass',
                style: GoogleFonts.nunito(
                  textStyle: textTheme.labelLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFF7E30),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // little dot
              Center(
                child: SmoothPageIndicator(
                  controller: exploreController,
                  count: exploreLength,
                  textDirection: TextDirection.ltr,
                  effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 4,
                    dotColor: Colors.grey.shade400,
                    activeDotColor: const Color(0xFFFF7E30),
                    type: WormType.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildContinue(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // var colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      padding: const EdgeInsets.fromLTRB(16, 4, 20, 4),
      child: Column(
        children: [
          // with default btm
          DefaultButton(
            height: 50,
            onPressed: () {
              navigatorKey.currentState?.pushReplacementNamed(
                Routes.homePage,
              );
            },
            // cause we need style in text, so take a shortcut using withIcon and empty the label
            label: '',
            withIcon: Text(
              'Continue as a Guest',
              style: GoogleFonts.nunito(
                textStyle: textTheme.labelLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: const Color(0xFFFF7E30),
            elevation: 5,
          ),
          const SizedBox(height: 8),
          //  with outline btm
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(25),
              child: OutlinedButton(
                onPressed: () {
                  navigatorKey.currentState?.pushReplacementNamed(
                    Routes.homePage,
                  );
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25)), // borderRadius
                  ),
                  side: WidgetStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Color(0xFFFF7E30),
                      width: 2,
                    ), // borderColor
                  ),
                ),
                child: Text(
                  'Continue as a Guest',
                  style: GoogleFonts.nunito(
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFF7E30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
