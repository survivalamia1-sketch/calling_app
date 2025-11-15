import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/app_logger.dart';

/// Global BLoC Observer for logging all BLoC events, transitions, and errors
class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.blocEvent(bloc.runtimeType.toString(), event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.d('🔄 [${bloc.runtimeType}] Change: ${change.currentState} → ${change.nextState}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    AppLogger.d('🔀 [${bloc.runtimeType}] Transition:');
    AppLogger.d('   Event: ${transition.event}');
    AppLogger.d('   Current: ${transition.currentState}');
    AppLogger.d('   Next: ${transition.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.e(
      '❌ [${bloc.runtimeType}] Error',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogger.i('➕ [${bloc.runtimeType}] Created');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.i('➖ [${bloc.runtimeType}] Closed');
  }
}
