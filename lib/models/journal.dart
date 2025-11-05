
import 'dart:ffi';

import 'package:one_up_app/models/journal_entry.dart';

class journal{
  Int? journalId;
  String? journalName;
  String? journalDescription;
  DateTime? startDate;
  List<journalEntry> journalEntries = [];
}