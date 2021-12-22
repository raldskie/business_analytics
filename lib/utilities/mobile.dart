  import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
    return 1000 > MediaQuery.of(context).size.width;
  }