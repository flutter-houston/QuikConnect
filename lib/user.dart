import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_connect/personal_info_form.dart';

@immutable
class User extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String location;
  final WorkStatus workStatus;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.location,
      this.workStatus})
      : super([firstName, lastName, email, location, workStatus]);

  User copyWith(
      {String firstName,
      String lastName,
      String email,
      String location,
      WorkStatus workStatus}) {
    return User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        location: location ?? this.location,
        workStatus: workStatus ?? this.workStatus);
  }
}
