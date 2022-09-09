// import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdHelper {

//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3940256099942544/6300978111';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3940256099942544/2934735716';
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get interstitialAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3940256099942544/7049598008';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3940256099942544/3964253750';
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get rewardedAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3940256099942544/8673189370';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3940256099942544/7552160883';
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }


//   void _createInterstitialAd() {
//   InterstitialAd.load(
//       adUnitId: AdHelper.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           print('$ad loaded');
//           _interstitialAd = ad;
//           _numInterstitialLoadAttempts = 0;
//           _interstitialAd!.setImmersiveMode(true);
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           print('InterstitialAd failed to load: $error.');
//           _numInterstitialLoadAttempts += 1;
//           _interstitialAd = null;
//           if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
//             _createInterstitialAd();
//           }
//         },
//       ));
// }
// void _showInterstitialAd() {
//   if (_interstitialAd == null) {
//     print('Warning: attempt to show interstitial before loaded.');
//     return;
//   }
//   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//     onAdShowedFullScreenContent: (InterstitialAd ad) =>
//         print('ad onAdShowedFullScreenContent.'),
//     onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       print('$ad onAdDismissedFullScreenContent.');
//       ad.dispose();
//       _createInterstitialAd();
//     },
//     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//       print('$ad onAdFailedToShowFullScreenContent: $error');
//       ad.dispose();
//       _createInterstitialAd();
//     },
//   );
//   _interstitialAd!.show();
//   _interstitialAd = null;
// }
// }
