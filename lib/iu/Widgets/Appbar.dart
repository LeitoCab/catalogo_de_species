// ignore_for_file: file_names

import 'package:flutter/material.dart';

PreferredSizeWidget appBarPrincipal(
    BuildContext context, String title, IconButton lead, boton) {
  return AppBar(
    title: title != ' ' ? Text(title) : null,
    leading: lead,
    bottom: boton,
  );
}
