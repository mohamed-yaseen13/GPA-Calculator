import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function showOverlay;
  final FocusNode focusNode;

  const SearchInputField({
    super.key,
    required this.controller,
    required this.showOverlay,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: BlocProvider.value(
              value: getIt<ApplicationAppBarCubit>(),
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                onChanged: (query) {
                  context.read<ApplicationAppBarCubit>().searchOnCourse(query);
                  showOverlay();
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
