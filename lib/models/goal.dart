import 'package:flutter/material.dart';

class Goal{
  int? goalId;
  String? goalName;
  String? goalDescription;
  List<String> daysToRemind = [];
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? notifyTime;
  bool isRepeating = false;
  bool isComplete = false;
  List<DateTime> completedDates =[];

  Map<String,dynamic> toMap(){
    return {
      'goalId': goalId,
      'goalName': goalName,
      'goalDescription': goalDescription ?? "",
      'daysToRemind': daysToRemind.join(','),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'notifyTime': notifyTime != null ? '${notifyTime!.hour}:${notifyTime!.minute}' : null,
      'isRepeating': isRepeating? 1:0,
      'isComplete': isComplete? 1:0,
      'completedDates': completedDates.map((d)=> d.toIso8601String()).join(','),
    };
  }

  factory Goal.fromMap(Map<String,dynamic> input){
    return Goal(
        goalId : input['goalId'] as int,
        goalName : input['goalName'] as String,
        goalDescription : input['goalDescription'] as String?,
        daysToRemind : input['daysToRemind'] != null ? (input['daysToRemind']).toString().split(',').map((d) => d.toString()).toList(): [],
        startDate : DateTime.parse(input['startDate']),
        endDate : input['endDate'] != null ? DateTime.parse(input['endDate']) : null,
        notifyTime : TimeOfDay(hour: int.parse(input['notifyTime'].toString().split(":")[0]),minute: int.parse(input['notifyTime'].split(":")[1])),
        isRepeating : input['isRepeating'] == 1,
        isComplete : input['isComplete'] == 1,
        completedDates : input['completedDates'] != null ? input['completedDates'].toString().split(',').map((d) => DateTime.parse(d)).toList(): []
    );
  }

Goal({
  goalId,
  required goalName,
  goalDescription,
  daysToRemind,
  required startDate,
  endDate,
  notifyTime,
  isRepeating,
  isComplete,
  completedDates,
});



}

