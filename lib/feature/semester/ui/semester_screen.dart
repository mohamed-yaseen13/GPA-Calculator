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

  List<TextEditingController> _nameControllers = [];
  List<TextEditingController> _creditControllers = [];

  @override
  void initState() {
    super.initState();

    _syncControllersWithCourses();
  }

  void _syncControllersWithCourses() {
    final courses = context.read<SemesterScreenCubit>().state.courses;

    for (var c in _nameControllers) {
      c.dispose();
    }
    for (var c in _creditControllers) {
      c.dispose();
    }

    if (courses.isNotEmpty) {
      _nameControllers = List.generate(
        courses.length,
        (i) => TextEditingController(text: courses[i].name),
      );
      _creditControllers = List.generate(
        courses.length,
        (i) => TextEditingController(text: courses[i].credits.toString()),
      );
    } else {
      _nameControllers = [];
      _creditControllers = [];
    }
  }

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
      _syncControllersWithCourses();
      _didSetInitialSemester = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SemesterScreenCubit, SemesterScreenState>(
      listenWhen:
          (previous, current) =>
              previous.courses.length != current.courses.length,
      listener: (context, state) {
        _syncControllersWithCourses();
      },
      child: BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: SemesterScreenAppBar(
              selectionMode: state.selectionMode,
              selectedItem: state.selectedItem,
              semesters: state.semesters,
              selectedIndex: state.selectedIndex,
              courses: state.courses,
              dropdownWidth: state.dropdownWidth,
              onSelect: context.read<SemesterScreenCubit>().select,
              onCancelSelection:
                  context.read<SemesterScreenCubit>().cancelSelection,
              onSelectAll: context.read<SemesterScreenCubit>().selectAll,
              onDelete: context.read<SemesterScreenCubit>().deleteSelected,
              onChanged: context.read<SemesterScreenCubit>().changeTerm,
              selectedTerm: state.selectedTerm,
            ),
            body: SemesterScreenBody(
              key: ValueKey(state.selectedIndex),
              box: context.read<SemesterScreenCubit>().box,
              index: state.selectedIndex,
              selectionMode: state.selectionMode,
              onToggleSelect: context.read<SemesterScreenCubit>().toggleSelect,
              onChanged: (String? value, int index) {
                context.read<SemesterScreenCubit>().changeCourseGrade(
                  value,
                  index,
                );
              },
              nameControllers: _nameControllers,
              creditControllers: _creditControllers,
              courses: state.courses,
              semesters: state.semesters,
              grades: context.read<SemesterScreenCubit>().grades,
              addCourse: context.read<SemesterScreenCubit>().addCourse,
            ),
          );
        },
      ),
    );
  }
}
