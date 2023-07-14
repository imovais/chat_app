// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget whatsapp_chat_list(
    {required name, required msg, notification_count = '1', imageUrl}) {
  return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal.withOpacity(0.1),
        child: Text(
          name[0].toUpperCase(),
          style: const TextStyle(color: Colors.teal),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        msg,
        style: const TextStyle(fontSize: 10),
      ),
      trailing: const Icon(Icons.arrow_forward_ios));
}
