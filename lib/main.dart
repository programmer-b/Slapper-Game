
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:slappergame/robert_colors.dart';

import 'robert_slapper.dart';

const pauseMenu = 'PauseMenu';

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('Ad loaded successfully ................\n\n');
            openAd = ad;
            ad.show();
            openAd!.show;
          },
          onAdFailedToLoad: (error) =>
              debugPrint('Ad failed to load: $error ................\n\n')),
      // ca-app-pub-5988017258715205/5600361489
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      orientation: AppOpenAd.orientationLandscapeLeft,
      request: const AdRequest());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await loadAd();
  await Flame.device.fullScreen();
  // RequestConfiguration.Builder()
  //     .setTestDeviceIds(Arrays.asList("0D035C42A3978CE7570D6C5A99C223D3"));
  await Flame.device.setLandscape();
  final robertSlapper = RobertSlapper();

  runApp(
    MaterialApp(
      home: GameWidget<RobertSlapper>(
        game: robertSlapper,
        // ignore: prefer_const_literals_to_create_immutables
        initialActiveOverlays: [
          pauseMenu,
        ],
        overlayBuilderMap: {
          'PauseMenu': (context, game) {
            return PauseMenuOverlay(robertSlapper: game);
          },
        },
      ),
    ),
  );
}

class PauseMenuOverlay extends StatelessWidget {
  const PauseMenuOverlay({
    Key? key,
    required this.robertSlapper,
  }) : super(key: key);

  final RobertSlapper robertSlapper;

  double fullHeight(context) => MediaQuery.of(context).size.height;

  double fullWidth(context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: fullWidth(context) - 400,
          height: fullHeight(context) - 50,
          decoration: BoxDecoration(
            color: RobertColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Slapper Game',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  )),
              if (robertSlapper.sessionManager.score > 0)
                Text(robertSlapper.sessionManager.scoreComponent.text,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              //const Spacer(),
              Image.asset(
                'assets/images/Logo.png',
                height: 180,
              ),
              //const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: RobertColors.primary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
                ),
                onPressed: () {
                  robertSlapper.overlays.remove(pauseMenu);
                  robertSlapper.start();

                  robertSlapper.sessionManager.reset();
                },
                child: const Text('Start Game'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
