import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocab/model/schema/word.dart';

import 'web_viewer.dart';

void showWordBottomSheet(BuildContext context, Word item, String dictionary) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      String url = "";

      switch (dictionary) {
        case "oxford":
          url = item.oxford;
          break;
        case "longman":
          url = item.longman;
      }

      return WebViewer(url: url);
    },
  );
}
