import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/note_dialogs.dart';

class NoteRow extends StatelessWidget {
  const NoteRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final result = await NoteDialogs.showColorDialog(
              context,
              state.selectedColor,
            );
            if (result != null) {
              await context.read<SettingsCubit>().setNoteColor(result);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/note.svg',
                  width: 48,
                  height: 48,
                ),
                horizontalSpace(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note Color',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      state.selectedColor,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
