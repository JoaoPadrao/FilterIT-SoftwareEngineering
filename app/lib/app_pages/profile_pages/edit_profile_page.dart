import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../data_models/user.dart';
import '../../custom_widgets/profile_image.dart';
import '../../custom_widgets/input_text_field.dart';

class EditProfile extends StatefulWidget {
  final User user;

  const EditProfile({Key? key, required this.user}) : super(key: key);


  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _aboutController;
  late TextEditingController _facebookLinkController;
  late TextEditingController _instagramLinkController;
  late TextEditingController _twitterLinkController;
  late TextEditingController _linkedinLinkController;
  String newProfilePictureURL = "";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _aboutController = TextEditingController(text: widget.user.about);
    _facebookLinkController = TextEditingController(text: widget.user.facebookURL);
    _instagramLinkController = TextEditingController(text: widget.user.instagramURL);
    _twitterLinkController = TextEditingController(text: widget.user.twitterURL);
    _linkedinLinkController = TextEditingController(text: widget.user.linkedinURL);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _aboutController.dispose();
    _facebookLinkController.dispose();
    _instagramLinkController.dispose();
    _twitterLinkController.dispose();
    _linkedinLinkController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("edit_profile_page_key"),
      appBar: AppBar(
        title: const Text("Editing Profile"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              ProfileImage(
                profilePictureURL: widget.user.profilePictureURL,
              ),
              Positioned(
                bottom: 0,
                right: 100,
                child: ClipOval(
                  child: Container(
                    color: Colors.orangeAccent,
                    padding: const EdgeInsets.all(1),
                    child: IconButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

                        Reference uploadReference = FirebaseStorage.instance.refFromURL(widget.user.profilePictureURL);

                        try{
                          await uploadReference.putFile(File(image!.path));
                           newProfilePictureURL = await uploadReference.getDownloadURL();
                           setState(() {
                              widget.user.profilePictureURL = newProfilePictureURL;
                           });
                        } catch(e){
                          throw Exception("Error uploading image");
                        }
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            key: const ValueKey("name_key"),
            label: 'Full Name',
            text: widget.user.name,
            onChanged: (name){},
            controller: _nameController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: widget.user.email,
            onChanged: (email){},
            controller: _emailController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'About',
            text: widget.user.about,
            maxLines: 5,
            onChanged: (about){},
            controller: _aboutController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Edit your socials',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFieldWidget(
            label: 'Facebook Link',
            text: widget.user.facebookURL,
            onChanged: (facebookLink){},
            controller: _facebookLinkController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Instagram Link',
            text: widget.user.instagramURL,
            onChanged: (instagramLink){},
            controller: _instagramLinkController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Twitter Link',
            text: widget.user.twitterURL,
            onChanged: (twitterLink){},
            controller: _twitterLinkController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'LinkedIn Link',
            text: widget.user.linkedinURL,
            onChanged: (linkedinLink){},
            controller: _linkedinLinkController,
            obscureText: false,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            key: const ValueKey("Save_button_key"),
            onPressed: () {
              updateUserInfo();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
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

  Future<void> updateUserInfo(){
    CollectionReference users = FirebaseFirestore.instance.collection('user_profiles');
    return users.doc(widget.user.email).update(
      {
        'name': _nameController.text,
        'email': _emailController.text,
        'about': _aboutController.text,
        'profilePicURL': newProfilePictureURL,
        'facebookURL': _facebookLinkController.text,
        'instagramURL': _instagramLinkController.text,
        'twitterURL': _twitterLinkController.text,
        'linkedInURL': _linkedinLinkController.text,
      }
    ).catchError((error) => throw("Failed to update user info: $error"));
  }
}