import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseService {
  static final InAppPurchase _iap = InAppPurchase.instance;
  static const String removeAdsId = 'android.test.purchased';

  static Future<void> init() async {
    final available = await _iap.isAvailable();
    if (!available) return;

    _iap.purchaseStream.listen((purchases) async {
      for (var purchase in purchases) {
        if (purchase.productID == PurchaseService.removeAdsId &&
            purchase.status == PurchaseStatus.purchased) {
          await PrefsHelper.setAdsRemoved(true);
          _iap.completePurchase(purchase);
        }

        if (purchase.status == PurchaseStatus.error) {
          print('Purchase failed: ${purchase.error}');
        }
      }
    });
  }

  static Future<void> buyRemoveAds() async {
    final productDetails = await _iap.queryProductDetails({removeAdsId});
    if (productDetails.notFoundIDs.isNotEmpty) {
      print('Product not found');
      return;
    }

    final product = productDetails.productDetails.first;
    final purchaseParam = PurchaseParam(productDetails: product);
    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }
}
