import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/widgets/buttons_row.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/widgets/show_example_container.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/widgets/obtained_mark_column.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/widgets/resualt_mark_column.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/widgets/total_mark_column.dart';

class MarkConverterScreen extends StatefulWidget {
  const MarkConverterScreen({super.key});

  @override
  State<MarkConverterScreen> createState() => _MarkConverterScreenState();
}

class _MarkConverterScreenState extends State<MarkConverterScreen> {
  final _obtainedMardController = TextEditingController();
  final _totalMardController = TextEditingController();
  final _resualtMarkController = TextEditingController();
  final _converterMarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Column(
          children: [
            verticalSpace(4),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ObtainedMarkColumn(controller: _obtainedMardController),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text('/'),
                        ),
                        TotalMarkColumn(
                          controller: _totalMardController,
                          onChanged: context.read<ConverterCubit>().updateTotal,
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Row(
                      children: [
                        ResualtMarkColumn(controller: _resualtMarkController),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text('/'),
                        ),
                        TotalMarkColumn(
                          controller: _converterMarkController,
                          onChanged:
                              context.read<ConverterCubit>().updateConvertTo,
                        ),
                      ],
                    ),
                    verticalSpace(12),
                    ShowExampleContainer(),
                  ],
                ),
              ),
            ),
            ButtonsRow(
              obtainedMardController: _obtainedMardController,
              totalMardController: _totalMardController,
              converterMarkController: _converterMarkController,
            ),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
