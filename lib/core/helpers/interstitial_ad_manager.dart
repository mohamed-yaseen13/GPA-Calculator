import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';

class InterstitialAdManager {
  static InterstitialAd? _interstitialAd;
  static bool _isLoading = false;

  static void loadInterstitialAd() {
    if (_interstitialAd != null || _isLoading) return;

    _isLoading = true;

    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3001005463674932/8778391104',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isLoading = false;
        },
        onAdFailedToLoad: (error) {
          print('Interstitial ad failed to load: $error');
          _isLoading = false;
        },
      ),
    );
  }

  static Future<void> showInterstitialAd({VoidCallback? onAdClosed}) async {
    final adsRemoved = await PrefsHelper.isAdsRemoved();
    if (adsRemoved) {
      if (onAdClosed != null) onAdClosed();
      return;
    }

    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _interstitialAd = null;
          loadInterstitialAd();
          if (onAdClosed != null) onAdClosed();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          print('Ad failed to show: $error');
          ad.dispose();
          _interstitialAd = null;
          loadInterstitialAd();
          if (onAdClosed != null) onAdClosed();
        },
      );

      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      loadInterstitialAd();
      if (onAdClosed != null) onAdClosed();
    }
  }
}
