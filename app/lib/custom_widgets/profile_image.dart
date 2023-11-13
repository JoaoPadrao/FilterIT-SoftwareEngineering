import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget{
  final String profilePictureURL;

  const ProfileImage({
    Key? key,
    required this.profilePictureURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage(){
    final image = NetworkImage(profilePictureURL);
    
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}