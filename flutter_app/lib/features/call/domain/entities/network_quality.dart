import 'package:equatable/equatable.dart';

/// Represents the network quality level
enum NetworkQualityLevel {
  /// Excellent network quality
  excellent,

  /// Good network quality
  good,

  /// Fair network quality with some issues
  fair,

  /// Poor network quality
  poor,

  /// Very poor or no network
  veryPoor,

  /// Network quality unknown
  unknown,
}

/// Network quality information
class NetworkQuality extends Equatable {
  final NetworkQualityLevel level;
  final int? latency; // in milliseconds
  final double? packetLoss; // percentage 0-100

  const NetworkQuality({
    required this.level,
    this.latency,
    this.packetLoss,
  });

  @override
  List<Object?> get props => [level, latency, packetLoss];

  String get displayMessage {
    switch (level) {
      case NetworkQualityLevel.excellent:
        return 'Excellent connection';
      case NetworkQualityLevel.good:
        return 'Good connection';
      case NetworkQualityLevel.fair:
        return 'Fair connection. Video quality may be reduced.';
      case NetworkQualityLevel.poor:
        return 'Poor connection. Consider turning off video.';
      case NetworkQualityLevel.veryPoor:
        return 'Very poor connection. You may experience issues.';
      case NetworkQualityLevel.unknown:
        return 'Checking connection...';
    }
  }

  bool get shouldShowWarning =>
      level == NetworkQualityLevel.fair ||
      level == NetworkQualityLevel.poor ||
      level == NetworkQualityLevel.veryPoor;
}

extension NetworkQualityLevelX on NetworkQualityLevel {
  int get bars {
    switch (this) {
      case NetworkQualityLevel.excellent:
        return 5;
      case NetworkQualityLevel.good:
        return 4;
      case NetworkQualityLevel.fair:
        return 3;
      case NetworkQualityLevel.poor:
        return 2;
      case NetworkQualityLevel.veryPoor:
        return 1;
      case NetworkQualityLevel.unknown:
        return 0;
    }
  }
}
