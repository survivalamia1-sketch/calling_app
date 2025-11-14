import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/call.dart';

abstract class CallRepository {
  /// Initialize WebRTC connection
  Future<Either<Failure, Unit>> initialize();

  /// Join a call room
  Future<Either<Failure, Call>> joinCall(String roomId);

  /// Leave the current call
  Future<Either<Failure, Unit>> leaveCall();

  /// Toggle audio on/off
  Future<Either<Failure, Unit>> toggleAudio(bool enable);

  /// Toggle video on/off
  Future<Either<Failure, Unit>> toggleVideo(bool enable);

  /// Switch camera (front/back)
  Future<Either<Failure, Unit>> switchCamera();

  /// Get call status stream
  Stream<Call> get callStream;

  /// Dispose resources
  Future<void> dispose();
}
