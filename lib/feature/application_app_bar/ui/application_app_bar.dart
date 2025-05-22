import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/calculator_screen.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/main_screen.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/mark_converter_screen.dart';
import 'package:gpa_calculator/feature/tabs/notes_tab/ui/notes_screen.dart';

class ApplicationAppBar extends StatefulWidget {
  const ApplicationAppBar({super.key});

  @override
  State<ApplicationAppBar> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<ApplicationAppBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      setState(() {
        _currentTabIndex = tabController.index;
        if (_currentTabIndex != 0) {
          context.read<ApplicationAppBarCubit>().cancelSelection();
        }
      });
    });
  }

  void _ensureDalete() async {
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Delete Semesters'),
            content: Text('Do you actually need to delete these semesters?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => context.pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
    );
    if (result == true) {
      context.read<ApplicationAppBarCubit>().deleteSelected();
    }
    context.read<ApplicationAppBarCubit>().cancelSelection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mainOrange,
            title:
                !state.selectionMode
                    ? Text(
                      'GPA Calculation',
                      style: TextStyle(color: Colors.white),
                    )
                    : null,
            actions:
                !state.selectionMode
                    ? buildAppBarActions(
                      context,
                      _currentTabIndex,
                      () => context.read<ApplicationAppBarCubit>().select(),
                    )
                    : [],
            flexibleSpace:
                state.selectionMode
                    ? buildSelectionUI(
                      context,
                      () =>
                          context
                              .read<ApplicationAppBarCubit>()
                              .cancelSelection(),
                      () => context.read<ApplicationAppBarCubit>().selectAll(),
                      _ensureDalete,
                      state.selectedItem,
                    )
                    : null,
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.yellow,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              tabs: const [
                Tab(text: 'MAIN'),
                Tab(text: 'CALCULATOR'),
                Tab(text: 'MARK CONVERTER'),
                Tab(text: 'NOTES'),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              MainScreen(
                selectionMode: state.selectionMode,
                semesters: state.semesters,
                onToggleSelect:
                    (index) => context
                        .read<ApplicationAppBarCubit>()
                        .toggleSelect(index),
              ),
              CalculatorScreen(),
              MarkConverterScreen(),
              NotesScreen(),
            ],
          ),
        );
      },
    );
  }
}
