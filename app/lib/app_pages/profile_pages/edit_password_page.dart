import 'package:flutter/material.dart';

import '../../data_models/user.dart';
import '../../custom_widgets/input_text_field.dart';

class EditPassword extends StatefulWidget {
  final User user;

  const EditPassword({Key? key, required this.user}) : super(key: key);

  @override
  EditPasswordState createState() => EditPasswordState();
}

class EditPasswordState extends State<EditPassword> {
  bool _confirm = false;
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editing Password"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          TextFieldWidget(
            label: "Old Password",
            text: "Enter your old password",
            controller: _oldPasswordController,
            obscureText: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            label: "New Password",
            text: "Enter your new password",
            controller: _newPasswordController,
            obscureText: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          TextFieldWidget(
            label: "Confirm Password",
            text: "Confirm your new password",
            controller: _confirmPasswordController,
            obscureText: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 50),
          CheckboxListTile(
            title: const Text("I confirm that I want to change my password"),
            value: _confirm,
            onChanged: (value) {
              setState(() {
                _confirm = value!;
              });
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _confirm ? Navigator.pop(context) : null;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _confirm ? Colors.orangeAccent : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Save Changes',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}