import 'package:flutter/material.dart';
import '../../theme.dart';
import 'create_classroom_screen.css.dart';

class CreateClassroomScreen extends StatefulWidget {
  final bool isGroup;

  const CreateClassroomScreen({
    super.key,
    required this.isGroup,
  });

  @override
  State<CreateClassroomScreen> createState() => _CreateClassroomScreenState();
}

class _CreateClassroomScreenState extends State<CreateClassroomScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveClassroom() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a class name')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      if (mounted) {
        Navigator.pop(context, true); // Return true to indicate success
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create classroom')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreateClassroomScreenCSS.backgroundColor,
      appBar: AppBar(
        backgroundColor: CreateClassroomScreenCSS.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create a classroom',
          style: CreateClassroomScreenCSS.titleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: CreateClassroomScreenCSS.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'You can create a classroom to accommodate 1 or more students.',
                style: CreateClassroomScreenCSS.subtitleStyle,
              ),
              CreateClassroomScreenCSS.largeSpacing,

              // Class name field
              const Text('Class name', style: CreateClassroomScreenCSS.labelStyle),
              CreateClassroomScreenCSS.smallSpacing,
              TextField(
                controller: _nameController,
                decoration: CreateClassroomScreenCSS.inputDecoration(
                  'Add a name for your class',
                ),
              ),
              CreateClassroomScreenCSS.mediumSpacing,

              // Description field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Description', style: CreateClassroomScreenCSS.labelStyle),
                  Text('(Optional)', style: CreateClassroomScreenCSS.optionalStyle),
                ],
              ),
              CreateClassroomScreenCSS.smallSpacing,
              TextField(
                controller: _descriptionController,
                maxLength: 500,
                maxLines: 4,
                decoration: CreateClassroomScreenCSS.descriptionDecoration(
                  'Tell us more about this class',
                  '${_descriptionController.text.length}/500',
                ),
                onChanged: (value) => setState(() {}),
              ),
              CreateClassroomScreenCSS.largeSpacing,

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveClassroom,
                  style: CreateClassroomScreenCSS.saveButtonStyle,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Save classroom',
                          style: CreateClassroomScreenCSS.saveButtonTextStyle,
                        ),
                ),
              ),

              // Add student button
              Center(
                child: TextButton(
                  onPressed: () {
                    // TODO: Implement add student functionality
                  },
                  style: CreateClassroomScreenCSS.addStudentButtonStyle,
                  child: const Text(
                    'Add student',
                    style: CreateClassroomScreenCSS.addStudentStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}