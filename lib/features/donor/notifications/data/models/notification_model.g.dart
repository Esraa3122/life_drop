// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      notificationId: json['notification_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: json['created_at'] as String,
      isSeen: json['isSeen'] as bool,
      isRead: json['isRead'] as bool? ?? false,
      donorId: (json['donor_id'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt,
      'isSeen': instance.isSeen,
      'isRead': instance.isRead,
      'donor_id': instance.donorId,
    };
