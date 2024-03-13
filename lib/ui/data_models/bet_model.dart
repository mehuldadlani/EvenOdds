import 'package:flutter/material.dart';

class BetModel {
  final String id;
  final String bet;
  final String optionOne;
  final double oddsOne;
  final String optionTwo;
  final double oddsTwo;
  final DateTime startTime;
  final DateTime finishTime;
  final int value;
  final int limit;
  final int result;

  BetModel({
    required this.id,
    required this.bet,
    required this.optionOne,
    required this.oddsOne,
    required this.optionTwo,
    required this.oddsTwo,
    required this.startTime,
    required this.finishTime,
    required this.value,
    required this.limit,
    required this.result,
  });

  factory BetModel.fromJson(Map<String, dynamic> json) {
    return BetModel(
      id: json['_id'],
      bet: json['bet'],
      optionOne: json['optionOne'],
      oddsOne: json['oddsOne'],
      optionTwo: json['optionTwo'],
      oddsTwo: json['oddsTwo'],
      startTime: DateTime.parse(json['startTime']),
      finishTime: DateTime.parse(json['finishTime']),
      value: json['value'],
      limit: json['limit'],
      result: json['result'],
    );
  }
}
