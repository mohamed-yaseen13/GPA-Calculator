import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_app_bar.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body.dart';

class SemesterScreen extends StatefulWidget {
  const SemesterScreen({super.key});

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  late Map? args;

  bool _didSetInitialSemester = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_didSetInitialSemester) {
      args = ModalRoute.of(context)!.settings.arguments as Map?;
      int? index = args?['semesterIndex'];

      if (context.mounted) {
        context.read<SemesterScreenCubit>().setSemesterByIndex(index);
      }
      _didSetInitialSemester = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SemesterScreenCubit, SemesterScreenState>(
      listenWhen:
          (previous, current) =>
              previous.selectedIndex != current.selectedIndex ||
              previous.courses.length != current.courses.length,
      listener: (context, state) {},
      child: BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const SemesterScreenAppBar(),
            body: SemesterScreenBody(key: ValueKey(state.selectedIndex)),
          );
        },
      ),
    );
  }
}
