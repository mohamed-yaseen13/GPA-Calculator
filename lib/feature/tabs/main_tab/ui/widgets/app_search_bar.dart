import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/search_input_field.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/search_result_container.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final _controller = TextEditingController();
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (_) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 24.w,
          child: CompositedTransformFollower(
            link: _layerLink,
            offset: Offset(12.w, 52.h),
            showWhenUnlinked: false,
            child: SearchResultContainer(),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SearchInputField(
        controller: _controller,
        showOverlay: _showOverlay,
      ),
    );
  }
}
