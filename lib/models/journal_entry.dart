import 'dart:ffi';

import 'package:flutter/material.dart';

class JournalEntry{
  Int? entryId;
  DateTime? entryDate;
  String? entryContent;
  TimeOfDay? entryTimeCompletion;// time of completion
  String? emoji;
}