import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';

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
            child: Material(
              shadowColor: Colors.black12,
              color: Color(0xFFFFF6E7),
              elevation: 4,
              borderRadius: BorderRadius.circular(8.r),
              child: BlocProvider(
                create: (context) => getIt<ApplicationAppBarCubit>(),
                child: BlocBuilder<
                  ApplicationAppBarCubit,
                  ApplicationAppBarState
                >(
                  builder: (context, state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.searchResults.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h),
                      itemBuilder:
                          (_, i) => ListTile(
                            onTap: () {
                              resetSemesterScreenCubit();
                              context.pushNamed(
                                AppRoutes.semesterScreen,
                                arguments: {
                                  'semesterIndex':
                                      state.searchResults[i]['semesterIndex'],
                                },
                              );
                            },
                            title: Text(state.searchResults[i]['course'] ?? ''),
                            subtitle: Text(
                              state.searchResults[i]['semester'] ?? '',
                            ),
                          ),
                    );
                  },
                ),
              ),
            ),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Color(0xFFFFF6E7),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: _controller,
                onChanged: (query) {
                  context.read<ApplicationAppBarCubit>().searchOnCourse(query);
                  _showOverlay();
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
