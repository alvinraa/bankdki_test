import 'package:bankdki_test/app.dart';
import 'package:bankdki_test/core/common/assets.dart';
import 'package:bankdki_test/core/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageButton extends StatefulWidget {
  final bool hasLabel;

  const LanguageButton({
    super.key,
    this.hasLabel = false,
  });

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  void _languageButtonOnTap(Locale locale, ThemeData theme) {
    Widget button(String countryName, Locale language) {
      bool isActive = locale.languageCode == language.languageCode;
      bool isIndonesia = countryName == 'Indonesia';

      return GestureDetector(
        onTap: () {
          // now still unused
          // App.of(context).setLocale(language);
          Navigator.pop(context);
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              isIndonesia
                  ? SvgPicture.asset(
                      Assets.flagIndonesia,
                    )
                  : SvgPicture.asset(
                      Assets.flagEnglish,
                    ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  countryName,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: theme.textTheme.bodyLarge?.color, fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // the color of container
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(
                    // border color
                    color: isActive
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.black,
                    width: 2,
                  ),
                ),
                // the color of the selected value
                child: isActive
                    // selected
                    ? Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
                    // unselected
                    : Container(),
              ),
            ],
          ),
        ),
      );
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (c) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const Center(
                  child: Text(
                    'Pilih Bahasa',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                button(
                  'Indonesia',
                  const Locale('id', 'ID'),
                ),
                button(
                  'English',
                  const Locale('en', 'US'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = const Locale('id', 'ID');
    var theme = Theme.of(context);

    return widget.hasLabel
        ? InkWell(
            onTap: () {
              _languageButtonOnTap(locale, theme);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 0,
                    child: Icon(
                      Icons.translate_rounded,
                      size: 32,
                      color: Styles().color.secondary,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Text(
                            "Language",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Text(
                            App.of(context).locale.countryCode.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 24,
                    color: Styles().color.primary,
                  ),
                ],
              ),
            ),
          )
        : InkWell(
            onTap: () {
              _languageButtonOnTap(locale, theme);
            },
            enableFeedback: true,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    locale.languageCode.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const Icon(
                    Icons.expand_more_rounded,
                    size: 18,
                  )
                ],
              ),
            ),
          );
  }
}
