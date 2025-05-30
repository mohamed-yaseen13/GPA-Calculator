import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/course_screen_app_bar.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/course_screen_body.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late Map? args;

  bool _didSetInitialCourse = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_didSetInitialCourse) {
      args = ModalRoute.of(context)!.settings.arguments as Map?;
      int? semesterIndex = args?['semesterIndex'];
      int? courseIndex = args?['courseIndex'];

      if (context.mounted) {
        final cubit = context.read<CourseScreenCubit>();
        cubit.setSelectedTermIndex(semesterIndex);
        cubit.setCourseByIndex(courseIndex);
      }
      _didSetInitialCourse = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CourseScreenCubit, CourseScreenState>(
      listenWhen:
          (previous, current) =>
              previous.selectedCourseIndex != current.selectedCourseIndex ||
              previous.sections.length != current.sections.length,
      listener: (context, state) {},
      child: BlocBuilder<CourseScreenCubit, CourseScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CourseScreenAppBar(),
            body: CourseScreenBody(),
          );
        },
      ),
    );
  }
}
