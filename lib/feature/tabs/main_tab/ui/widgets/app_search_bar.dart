import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/search_input_field.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/search_result_container.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  final _controller = TextEditingController();
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    if (!mounted) return;

    final overlay = Overlay.of(context);

    _overlayEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        final appBarCubit = context.read<ApplicationAppBarCubit>();
        return Positioned(
          width: MediaQuery.of(context).size.width - 24.w,
          child: CompositedTransformFollower(
            link: _layerLink,
            offset: Offset(12.w, 52.h),
            showWhenUnlinked: false,
            child: BlocProvider.value(
              value: appBarCubit,
              child: SearchResultContainer(),
            ),
          ),
        );
      },
    );

    overlay.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SearchInputField(
        controller: _controller,
        focusNode: _focusNode,
        showOverlay: _showOverlay,
      ),
    );
  }
}
