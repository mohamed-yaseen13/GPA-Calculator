import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/app_bar_actions.dart';
import 'package:gpa_calculator/core/widgets/selection_ui.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/core/widgets/app_drawer.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: !state.selectionMode ? const Text('GPA Calculator') : null,
            actions:
                !state.selectionMode
                    ? buildAppBarActions(
                      context: context,
                      currentTabIndex: _currentTabIndex,
                      onSelect:
                          () => context.read<ApplicationAppBarCubit>().select(),
                    )
                    : [],
            flexibleSpace:
                state.selectionMode
                    ? buildSelectionUI(
                      context: context,
                      onCancelSelection:
                          () =>
                              context
                                  .read<ApplicationAppBarCubit>()
                                  .cancelSelection(),
                      onSelectAll:
                          () =>
                              context
                                  .read<ApplicationAppBarCubit>()
                                  .selectAll(),
                      onDelete: () {
                        context.read<ApplicationAppBarCubit>().deleteSelected();
                        context
                            .read<GpaCalculationsCubit>()
                            .calculateGpaAndCgpa();
                        InterstitialAdManager.showInterstitialAd();
                      },
                      selectedItem: state.selectedItem,
                      content: 'Semesters',
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
          drawer:
              !state.selectionMode
                  ? const AppDrawer(selectedRoute: DrawerRoute.main)
                  : null,
          body: TabBarView(
            controller: tabController,
            children: const [
              MainScreen(),
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
