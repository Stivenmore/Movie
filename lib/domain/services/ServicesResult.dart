import 'package:flutter/material.dart';

class ServiceResult<T> {
  @required
  bool status;

  T data;
  String mensagge;

  ServiceResult ({this.data, this.mensagge, this.status});
}
