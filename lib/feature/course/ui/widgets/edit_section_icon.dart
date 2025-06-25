import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/add_section_bottom_sheet.dart';

class EditSectionIcon extends StatelessWidget {
  final int index;
  final SectionModel section;

  const EditSectionIcon({
    super.key,
    required this.index,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [PopupMenuItem(value: 1, child: Text('Edit'))],
      menuPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onSelected: (value) async {
        final result = await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (bottomSheetContext) => BlocProvider.value(
                value: context.read<CourseScreenCubit>(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: AddSectionBottomSheet(
                    index: index,
                    text: 'Edit',
                    initialName: section.name,
                    initialObtainedMark: section.obtainedMark.toDouble(),
                    initialFullMark: section.fullMark.toDouble(),
                  ),
                ),
              ),
        );
        if (result != null) {
          context.read<CourseScreenCubit>().addSection(
            name: result['name'],
            obtainedMark: result['obtainedMark'],
            fullMark: result['fullMark'],
            index: index,
          );
          context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
          InterstitialAdManager.showInterstitialAd();
        }
      },
    );
  }
}
