import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/ui/calculator_screen.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/main_screen.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/ui/mark_converter_screen.dart';
import 'package:gpa_calculator/feature/tabs/notes_tab/ui/notes_screen.dart';
import 'package:gpa_calculator/feature/main_dashboard/ui/widgets/main_dashboard_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int _currentTabIndex = 0;
  bool _selectionMode = false;
  int _selectedItem = 0;

  final box = Hive.box('studentData');
  late StudentModel student;
  late List<SemesterModel> semesters;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    student = box.get('default');
    semesters = student.semesters;

    tabController.addListener(() {
      setState(() {
        _currentTabIndex = tabController.index;
        if (_currentTabIndex != 0 && _selectionMode) {
          _selectionMode = false;
          _selectedItem = 0;
          for (var semester in semesters) {
            semester.selected = false;
          }
        }
      });
    });
  }

  void _onSelect() {
    setState(() {
      _selectionMode = true;
    });
  }

  void _onCancelSelection() {
    setState(() {
      _selectionMode = false;
      _selectedItem = 0;
      for (var semester in semesters) {
        semester.selected = false;
      }
    });
  }

  void _onSelectAll() {
    setState(() {
      bool allSelected = semesters.every((s) => s.selected == true);
      for (var semester in semesters) {
        semester.selected = !allSelected;
      }
      _selectedItem = allSelected ? 0 : semesters.length;
    });
  }

  void _onDelete() {
    setState(() {
      student.semesters.removeWhere((semester) => semester.selected == true);
      box.put('default', student);
      _selectedItem = 0;
      _selectionMode = false;
    });
  }

  void _onToggleSelect(int index) {
    setState(() {
      semesters[index].selected = !semesters[index].selected;
      _selectedItem = semesters.where((s) => s.selected == true).length;
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
      _onDelete();
    }
    _onCancelSelection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainOrange,
        title:
            !_selectionMode
                ? Text('GPA Calculation', style: TextStyle(color: Colors.white))
                : null,
        actions:
            !_selectionMode
                ? buildAppBarActions(context, _currentTabIndex, _onSelect)
                : [],
        flexibleSpace:
            _selectionMode
                ? buildSelectionUI(
                  context,
                  _onCancelSelection,
                  _onSelectAll,
                  _ensureDalete,
                  _selectedItem,
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
            selectionMode: _selectionMode,
            onToggleSelect: _onToggleSelect,
          ),
          CalculatorScreen(),
          MarkConverterScreen(),
          NotesScreen(),
        ],
      ),
    );
  }
}
