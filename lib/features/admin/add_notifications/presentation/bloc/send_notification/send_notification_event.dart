part of 'send_notification_bloc.dart';

@freezed
class SendNotificationEvent with _$SendNotificationEvent {
  const factory SendNotificationEvent.started() = _Started;
  const factory SendNotificationEvent.sendNotifications({
    required String title,
    required String body,
    required int donorId,
    required int indexId,
  }) = NewSendNotificationsEvent;
}