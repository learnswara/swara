import 'package:flutter/material.dart';
import '../common/custom_bottom_sheet.dart';
import '../common/custom_snackbar.dart';
import 'home_screen.css.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeScreenCSS.scaffoldBackgroundColor,
      body: Column(
        children: [
          // App Bar with gradient
          Container(
            padding: HomeScreenCSS.headerPadding.copyWith(
              top: MediaQuery.of(context).padding.top,
            ),
            decoration: BoxDecoration(
              color: HomeScreenCSS.headerBackgroundColor,
            ),
            child: Row(
              children: [
                Text(
                  'Home',
                  style: HomeScreenCSS.headerStyle,
                  semanticsLabel: 'Home Header',
                ),
              ],
            ),
          ),
          
          // Main content
          Expanded(
            child: Container(
              color: HomeScreenCSS.contentBackgroundColor,
              child: Center(
                child: Padding(
                  padding: HomeScreenCSS.contentPadding,
                  child: Container(
                    decoration: HomeScreenCSS.cardDecoration,
                    padding: HomeScreenCSS.cardPadding,
                    child: Column(
                      mainAxisSize: HomeScreenCSS.columnMainAxisSize,
                      children: [
                        // School icon with circular background
                        Container(
                          width: HomeScreenCSS.iconContainerSize,
                          height: HomeScreenCSS.iconContainerSize,
                          decoration: HomeScreenCSS.iconContainerDecoration,
                          child: Center(
                            child: Icon(
                              Icons.school,
                              color: HomeScreenCSS.iconColor,
                              size: HomeScreenCSS.iconSize,
                            ),
                          ),
                        ),
                        HomeScreenCSS.largeSpacing,
                        
                        // No classrooms yet text
                        Text(
                          'No classrooms yet',
                          style: HomeScreenCSS.emptyTitleStyle,
                          semanticsLabel: 'No Classrooms Yet',
                        ),
                        HomeScreenCSS.smallSpacing,
                        
                        // Description text
                        Text(
                          'Create a classroom and add, students\nand lessons to get started.',
                          textAlign: HomeScreenCSS.emptyTextAlign,
                          style: HomeScreenCSS.emptyDescriptionStyle,
                        ),
                        HomeScreenCSS.extraLargeSpacing,
                        
                        // Create classroom button
                        SizedBox(
                          width: HomeScreenCSS.buttonWidth,
                          child: ElevatedButton(
                            onPressed: _showClassroomTypeBottomSheet,
                            style: HomeScreenCSS.createButtonStyle,
                            child: Text(
                              'Create a classroom',
                              style: HomeScreenCSS.buttonTextStyle,
                              semanticsLabel: 'Create Classroom Button',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gray divider line above navigation bar
          HomeScreenCSS.navBarDivider,
          BottomNavigationBar(
            type: HomeScreenCSS.navBarType,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            backgroundColor: HomeScreenCSS.navBarBackgroundColor,
            elevation: HomeScreenCSS.navBarElevation,
            selectedItemColor: HomeScreenCSS.selectedNavItemColor,
            unselectedItemColor: HomeScreenCSS.unselectedNavItemColor,
            selectedIconTheme: HomeScreenCSS.selectedIconTheme,
            unselectedIconTheme: HomeScreenCSS.unselectedIconTheme,
            selectedLabelStyle: HomeScreenCSS.selectedLabelStyle,
            unselectedLabelStyle: HomeScreenCSS.unselectedLabelStyle,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.class_),
                label: 'Classes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Students',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showClassroomTypeBottomSheet() {
    CustomBottomSheet.show<String>(
      context: context,
      title: 'Type of classroom',
      options: [
        BottomSheetOption(
          label: 'Group',
          icon: Icons.group,
          value: 'group',
        ),
        BottomSheetOption(
          label: 'One on One',
          icon: Icons.person,
          value: 'one-on-one',
        ),
      ],
    ).then((classroomType) {
      if (classroomType != null && mounted) {
        CustomSnackbar.show(
          context: context,
          message: 'Selected: $classroomType classroom',
        );
      }
    });
  }
} 