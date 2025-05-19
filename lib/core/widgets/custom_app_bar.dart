import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/calculator/ui/calculator_screen.dart';
import 'package:gpa_calculator/feature/main/main_dashboard/ui/main_screen.dart';
import 'package:gpa_calculator/feature/mark_conventer/ui/mark_converter_screen.dart';
import 'package:gpa_calculator/feature/notes/ui/notes_screen.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _selectionMode = false;
  int _selectedCount = 0;
  final List<Map<String, dynamic>> _semesters = [];

  void _addSemester() {
    setState(() {
      _semesters.add({'term': '', 'gpa': '', 'selected': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainOrange,
          title:
              !_selectionMode
                  ? Text(
                    'GPA Calculation',
                    style: TextStyle(color: Colors.white),
                  )
                  : null,
          actions:
              !_selectionMode
                  ? [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectionMode = true;
                        });
                      },
                      child: Text(
                        'SELECT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      itemBuilder:
                          (context) => [
                            PopupMenuItem(value: 1, child: Text('Settings')),
                            PopupMenuItem(value: 2, child: Text('Scales')),
                          ],
                      onSelected: (value) {},
                    ),
                  ]
                  : [],
          flexibleSpace:
              _selectionMode
                  ? SafeArea(
                    child: Container(
                      color: Color(0xFF303030),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _selectionMode = false;
                                _selectedCount = 0;
                                for (var semester in _semesters) {
                                  semester['selected'] = false;
                                }
                              });
                            },
                          ),
                          Text(
                            '$_selectedCount Selected',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.crop_square, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                bool allSelected = _semesters.every(
                                  (s) => s['selected'] == true,
                                );
                                for (var semester in _semesters) {
                                  semester['selected'] = !allSelected;
                                }
                                _selectedCount =
                                    allSelected ? 0 : _semesters.length;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _semesters.removeWhere(
                                  (semester) => semester['selected'] == true,
                                );
                                _selectedCount = 0;
                                _selectionMode = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                  : null,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.yellow,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'MAIN'),
              Tab(text: 'CALCULATOR'),
              Tab(text: 'MARK CONVERTER'),
              Tab(text: 'MY NOTES'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MainScreen(
              semesters: _semesters,
              selectionMode: _selectionMode,
              onToggleSelect: (index) {
                setState(() {
                  _semesters[index]['selected'] =
                      !_semesters[index]['selected'];
                  _selectedCount =
                      _semesters.where((s) => s['selected'] == true).length;
                });
              },
              onAddSemester: _addSemester,
            ),
            CalculatorScreen(),
            MarkConverterScreen(),
            NotesScreen(),
          ],
        ),
      ),
    );
  }
}
