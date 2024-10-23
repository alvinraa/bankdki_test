import 'package:bankdki_test/core/common/assets.dart';
import 'package:bankdki_test/core/widget/shimmer/default_shimmer.dart';
import 'package:bankdki_test/feature/home/presentation/widget/first_layer_widget.dart';
import 'package:bankdki_test/feature/home/presentation/widget/second_layer_widget.dart';
import 'package:bankdki_test/feature/login/presentation/widget/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final dynamic data;
  const HomePage({super.key, this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Color> gradientColor = const [Color(0xFFFE654D), Color(0xFFFEC74D)];
  List listHomeBanner = [
    {"imageUrl": Assets.eventBanner},
    {"imageUrl": Assets.eventBanner},
    {"imageUrl": Assets.eventBanner},
  ];
  List listTouristPass = [
    {
      "imageUrl":
          "https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000364679993/Ancol-Entrance-Gate-085b2a15-1ac2-47b8-aaf0-fcb5f88f147c.jpeg?tr=q-60,c-at_max,w-1280,h-720&_src=imagekit",
      "place": "Ancol Entrance Gate",
    },
    {
      "imageUrl":
          "https://a.travel-assets.com/findyours-php/viewfinder/images/res70/69000/69238-National-Monument.jpg",
      "place": "Monumen Nasional",
    },
    {
      "imageUrl":
          "https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit19201280gsm/events/2024/08/14/594c6072-d53a-4eef-9285-6d69ef1f725a-1723625448894-4199040f8fc0597a41415949abcfef1b.jpg",
      "place": "Taman Safari Bogor",
    },
    {
      "imageUrl": "https://kebunraya.id/images/about/side-bogor.jpg",
      "place": "Kebun Raya Bogor",
    },
    {
      "imageUrl":
          "https://zonapers.com/wp-content/uploads/2023/01/Jakarta-Aquarium-Safari-Destinasi-wisata-Dunia-bawah-Laut-pertama-di-Indonesia-2.jpeg",
      "place": "Istana Aquarium",
    },
  ];
  List listEvent = [
    {
      "imageUrl":
          "https://storage.jakarta-tourism.go.id/public/events/nHSQqPcvlWgCDwAi6mPgsqVRDrPteT-metaSk9ZMDA2LVNCMjQwOTI2LUpveWxhbmQtSmFrYXJ0YS0yNC1GdWxsLUxpbmV1cC1XZWItQmFubmVyLUFsdC1zY2FsZWQuanBn-.jpg",
      "event": "Joyland Festival Jakarta",
    },
    {
      "imageUrl":
          "https://storage.jakarta-tourism.go.id/public/events/e2Jo3hb25X1MM36APV8QtsaeUXHcNi-metac2VhZm9vZCBzaG93IGFzaWEuanBn-.jpg",
      "event": "Seafood Show of Asia Expo",
    },
    {
      "imageUrl":
          "https://storage.jakarta-tourism.go.id/public/events/HayAtUsuLBmbuB4RFHfJRlDaiokQP6-metaaWNhZCAyMDI0LmpwZWc=-.jpeg",
      "event": "Indonesia Contemporary Art&Design",
    },
    {
      "imageUrl":
          "https://storage.jakarta-tourism.go.id/public/events/Fqxs2av1YGe03rJsS3pLCQjP9gQ2cQ-metaamFrYXJ0YSBDb2xvciBSdW4gRmVzdGl2YWwgMjAyNC5qcGc=-.jpg",
      "event": "Jakarta Night Fun Run Festival",
    },
    {
      "imageUrl":
          "https://storage.jakarta-tourism.go.id/public/events/ZTMmrxVPQf3VVpkpK34oiD1YynnLXf-metaSkRXMjAyNF8yLmpwZw==-.jpg",
      "event": "Jakarta Dessert Week",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? buildHomePage(context)
          : buildProfilePage(context),
      bottomNavigationBar: buildBtmNavBar(context),
    );
  }

  Widget buildProfilePage(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        'Under Development',
        style: GoogleFonts.nunito(
          textStyle: textTheme.labelLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildHomePage(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                children: [
                  const FirstLayerWidget(),
                  const SecondLayerWidget(),
                  buildHomeBanner(context),
                  buildTouristPass(context),
                  buildEvent(context),
                  // add a white box in the btm of content
                  const SizedBox(height: 100)
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
    );
  }

  Widget buildHomeBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 25),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listHomeBanner.map((item) {
            return Container(
              margin: EdgeInsets.only(
                right: item == listHomeBanner.lastOrNull ? 0 : 8,
              ),
              child: Image.asset(
                item['imageUrl'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildTouristPass(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    List<Color> gradientColor = const [Color(0xFFFE654D), Color(0xFFFEC74D)];

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          // icon + text + see all
          titleSegmentWidget(
            title: 'Let’s Go with Jakarta Tourist Pass',
            subtitle: 'a place not to be missed',
            icon: Icons.pin_drop_outlined,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              // did you know image (not scrollable)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 100,
                height: 160,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Did You Know ?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.paytoneOne(
                        textStyle: textTheme.labelLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Image.asset(
                      Assets.hmIconMap,
                      scale: 1,
                    ),
                  ],
                ),
              ),
              // list of image
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listTouristPass.map((item) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        margin: EdgeInsets.only(
                          right: item == listHomeBanner.lastOrNull ? 0 : 16,
                        ),
                        child: Container(
                          height: 160,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              // image
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  height: 90,
                                  width: 100,
                                  item['imageUrl'],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const DefaultShimmer(
                                        height: 90,
                                        width: 100,
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://placehold.co/600x400',
                                      fit: BoxFit.cover,
                                      height: 90,
                                      width: 100,
                                    );
                                  },
                                ),
                              ),
                              // text
                              const SizedBox(height: 4),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, right: 8, left: 8, bottom: 4),
                                  child: Text(
                                    item['place'],
                                    style: GoogleFonts.nunito(
                                      textStyle: textTheme.labelLarge?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // btm
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 15,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: gradientColor,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Detail',
                                        style: GoogleFonts.nunito(
                                          textStyle:
                                              textTheme.labelLarge?.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildEvent(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          // icon + text + see all
          titleSegmentWidget(
            title: 'Events in Jakarta',
            subtitle: 'don\'t miss the current events',
            icon: Icons.edit_calendar_outlined,
          ),
          const SizedBox(height: 16),
          // list of image
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listEvent.map((item) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  margin: EdgeInsets.only(
                    right: item == listEvent.lastOrNull ? 24 : 16,
                    left: item == listEvent.firstOrNull ? 24 : 0,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFE654D),
                        Color(0xFFFEC74D),
                        Colors.white,
                        Colors.white
                      ],
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // image
                        Container(
                          height: 140,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              height: 140,
                              width: 240,
                              item['imageUrl'],
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const DefaultShimmer(
                                    height: 140,
                                    width: 240,
                                  );
                                }
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  'https://placehold.co/600x400',
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 240,
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 15,
                          margin: const EdgeInsets.only(right: 8, top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: gradientColor,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'More Information',
                              style: GoogleFonts.nunito(
                                textStyle: textTheme.labelLarge?.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleSegmentWidget({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    var textTheme = Theme.of(context).textTheme;
    List<Color> gradientColor = const [Color(0xFFFE654D), Color(0xFFFEC74D)];
    return Row(
      children: [
        // icon
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(75),
              bottomRight: Radius.circular(75),
            ),
            gradient: LinearGradient(
              colors: gradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: const Border(
              bottom: BorderSide(
                color: Color(0xFFFFF84B),
                width: 3.0,
              ),
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 8),
        // text
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  textStyle: textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.nunito(
                  textStyle: textTheme.labelLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(75),
                    bottomRight: Radius.circular(75),
                  ),
                  gradient: LinearGradient(
                    colors: gradientColor,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'View All',
              style: GoogleFonts.nunito(
                textStyle: textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBtmNavBar(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bottom Navigation Bar
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color(0xFFFF7E30)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Empty space for the center button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin, color: Color(0xFFFF7E30)),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        // Center Button (Circle)
        Positioned(
          top: -40, // Adjust to move it outside the navbar
          left: MediaQuery.of(context).size.width / 2 -
              30, // Center the button horizontally
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              margin: const EdgeInsets.all(4),
              height: 75,
              width: 75,
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
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(Assets.qris),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
