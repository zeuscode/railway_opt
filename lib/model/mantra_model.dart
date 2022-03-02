import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mantra_model.g.dart';

@JsonSerializable()
class MantraModel {
  int? id;
  String code;
  String? interval;
  String? qrCode;


  MantraModel({this.code = '',this.id,this.interval,this.qrCode}); // MantraModel({this.id, this.code});


  MantraModel copyWith({
    int? id,
    String? code,
    String?interval,
  }) {
    return MantraModel(id: id??this.id, code: code??this.code,interval: interval??this.interval,
    qrCode: qrCode??this.qrCode);
  }

  factory MantraModel.fromJson(Map<String, dynamic> json) =>
      _$MantraModelFromJson(json);

  Map<String, dynamic> toJson() => _$MantraModelToJson(this);
}
