import 'package:flutter/material.dart';
import '../../theme.dart';
import 'create_classroom_screen.css.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/classroom/'),
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: jsonEncode({
          'name': _nameController.text.trim(),
          'description': _descriptionController.text.trim(),
          'is_group': widget.isGroup,
        }),
      );

      if (mounted) {
        if (response.statusCode == 201) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Classroom created successfully'),
              backgroundColor: Colors.green,
            ),
          );
          // Close the screen after a short delay to allow the toast to be seen
          await Future.delayed(const Duration(milliseconds: 500));
          if (mounted) {
            Navigator.pop(context, true);
          }
        } else {
          // Handle error
          final errorData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorData['message'] ?? 'Failed to create classroom'),
              backgroundColor: Colors.red,
            ),
          );
        }
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
                      style: CreateClassroomScreenCSS.inputTextStyle,
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
                      style: CreateClassroomScreenCSS.inputTextStyle,
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