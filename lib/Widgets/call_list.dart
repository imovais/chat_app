// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget call_list({required name, required DateTime, imageUrl}) {
  return ListTile(
      leading: CircleAvatar(
        backgroundImage: imageUrl == null
            ? const NetworkImage(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgPp7AelDxUJQ_t928VVlyIqM4sAMLIOsHyWkVgVRPzvFaUuJkNZG6U7DV8oYjIwpwzVKWwEGOFqQ_8jBTwiz8iDrR0GlQUVom65RMzoaLrYvNhVbwcFdgo2glP2lgp076Dvl6oNjrOuQp5oQstI1SCbVXITSPofI12AdM-KaB0rQBPAyRR5qpE-z8hDg/s1073/blank-profile-picture-hd-images-photo-5.JPG')
            : NetworkImage(imageUrl),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(DateTime.toString()),
      trailing: const Icon(
        Icons.call,
        color: Colors.teal,
      ));
}
