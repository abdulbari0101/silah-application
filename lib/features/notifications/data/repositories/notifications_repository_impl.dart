import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_entity.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_group.dart';
import 'package:silah_app/features/notifications/domain/entities/notification/notification_result.dart';
import 'package:silah_app/features/notifications/domain/repositories/notification_repository.dart';

class NotificationsRepositoryImpl implements NotifyRepo {
  NotificationsRepositoryImpl();

  final List<NotificationEntity> _items = <NotificationEntity>[];
  late final StreamController<NotificationResult> _controller =
      StreamController<NotificationResult>.broadcast(onListen: _emit);

  bool _seeded = false;

  @override
  Future<Either<Failure, void>> syncAllUnseenNotifications() async {
    _ensureSeeded();
    return const Right(null);
  }

  @override
  Future<Either<Failure, NotificationEntity?>>
  fetchNewOperationNotification() async {
    return const Right(null);
  }

  @override
  Stream<NotificationResult> observeAllNotifications() {
    _ensureSeeded();
    return _controller.stream;
  }

  @override
  Future<Either<Failure, void>> markAllNotificationsAsSeen() async {
    _ensureSeeded();
    _setSeenForAll();
    _emit();
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> tempSaveSeenNotifications(
    List<NotificationEntity> notifications,
  ) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> clearAllNotifications() async {
    _items.clear();
    _emit();
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> removeNotificationById(int id) async {
    _items.removeWhere((item) => item.id == id);
    _emit();
    return const Right(null);
  }

  void _ensureSeeded() {
    if (_seeded) return;
    _seeded = true;
    _items.addAll(_defaultNotifications());
  }

  void _setSeenForAll() {
    if (_items.isEmpty) return;
    for (var i = 0; i < _items.length; i++) {
      final item = _items[i];
      if (!item.isSeen) {
        _items[i] = item.copyWith(isSeen: true);
      }
    }
  }

  void _emit() {
    _ensureSeeded();
    _controller.add(_buildResult());
  }

  NotificationResult _buildResult() {
    final sorted = List<NotificationEntity>.from(_items)
      ..sort(
        (a, b) => _parseDate(b.timestamp).compareTo(_parseDate(a.timestamp)),
      );

    final grouped = <String, List<NotificationEntity>>{};
    for (final item in sorted) {
      final dateKey = _formatDateKey(_parseDate(item.timestamp));
      grouped.putIfAbsent(dateKey, () => <NotificationEntity>[]).add(item);
    }

    final groups = grouped.entries.map((entry) {
      return NotificationGroup(
        headerDate: entry.key,
        notifications: entry.value,
      );
    }).toList();

    final unSeenCount = sorted.where((item) => item.isSeen == false).length;
    return NotificationResult(unSeenCount: unSeenCount, groups: groups);
  }

  DateTime _parseDate(String? value) {
    if (value == null || value.trim().isEmpty) return DateTime.now();
    return DateTime.tryParse(value) ?? DateTime.now();
  }

  String _formatDateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  List<NotificationEntity> _defaultNotifications() {
    final now = DateTime.now();
    return <NotificationEntity>[
      NotificationEntity(
        id: 1,
        timestamp: now.subtract(const Duration(hours: 1)).toIso8601String(),
        operationName: 'Consultation Request',
        message:
            'Your consultation request was accepted. You can start chatting now.',
        isSeen: false,
      ),
      NotificationEntity(
        id: 2,
        timestamp: now.subtract(const Duration(hours: 4)).toIso8601String(),
        operationName: 'Training Application',
        message: 'Your training application is under review.',
        isSeen: false,
      ),
      NotificationEntity(
        id: 3,
        timestamp: now.subtract(const Duration(days: 1)).toIso8601String(),
        operationName: 'Messages',
        message: 'You received a new message from your lawyer.',
        isSeen: true,
      ),
    ];
  }
}
