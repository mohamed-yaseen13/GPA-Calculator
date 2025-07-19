import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoveAdsSheet extends StatefulWidget {
  const RemoveAdsSheet({super.key});

  @override
  State<RemoveAdsSheet> createState() => _RemoveAdsSheetState();
}

class _RemoveAdsSheetState extends State<RemoveAdsSheet> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final String _productId = 'remove_ads';
  bool _available = true;
  bool _adsRemoved = false;
  ProductDetails? _product;

  @override
  void initState() {
    super.initState();
    _init();
    _inAppPurchase.purchaseStream.listen(_onPurchaseUpdate);
  }

  Future<void> _init() async {
    _available = await _inAppPurchase.isAvailable();
    final response = await _inAppPurchase.queryProductDetails({_productId});
    if (response.productDetails.isNotEmpty) {
      _product = response.productDetails.first;
    }
    final prefs = await SharedPreferences.getInstance();
    _adsRemoved = prefs.getBool('ads_removed') ?? false;
    setState(() {});
  }

  void _buyRemoveAds() {
    if (_product == null) return;
    final purchaseParam = PurchaseParam(productDetails: _product!);
    _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (var purchase in purchases) {
      if (purchase.productID == _productId &&
          purchase.status == PurchaseStatus.purchased) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('ads_removed', true);
        setState(() => _adsRemoved = true);
        _inAppPurchase.completePurchase(purchase);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_available) {
      return const Center(child: Text("Store not available"));
    }

    if (_adsRemoved) {
      return const Center(child: Text("Ads are removed ✅"));
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(16),
          Text(
            "Remove ads for only ${_product?.price}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp),
          ),
          verticalSpace(36),
          ElevatedButton(
            onPressed: _buyRemoveAds,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainOrange,
              foregroundColor: Colors.white,
            ),
            child: Text("Buy Now"),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
