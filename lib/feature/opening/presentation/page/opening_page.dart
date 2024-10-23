import 'package:bankdki_test/core/common/assets.dart';
import 'package:bankdki_test/core/common/navigation.dart';
import 'package:bankdki_test/core/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpeningPage extends StatefulWidget {
  final dynamic data;
  const OpeningPage({super.key, this.data});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // make it fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // give delay before goes to login page
    Future.delayed(const Duration(seconds: 2), () {
      navigatorKey.currentState?.pushReplacementNamed(
        Routes.loginPage,
      );
    });
  }

  @override
  void dispose() {
    // set it back to normal
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF7E30), Color(0xFFFF5126)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: -50,
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  Assets.splashScreenBackground1,
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              right: -50,
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  Assets.splashScreenBackground2,
                ),
              ),
            ),
            // last layer
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  Assets.splashScreen,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.ojkLps,
                        scale: 0.8,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'powered by Bank DKI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        '2023',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
