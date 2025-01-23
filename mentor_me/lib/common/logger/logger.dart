import 'package:logger/logger.dart';
import 'package:mentor_me/common/logger/logger_contract.dart';

class AppLogger implements LoggerContract {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() => _instance;

  final Logger _logger;

  AppLogger._internal()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 8,
            lineLength: 80,
            colors: true,
            dateTimeFormat: DateTimeFormat.dateAndTime,
          ),
        );

  @override
  void logInfo(String message) => _logger.i(message);

  @override
  void logWarning(String message) => _logger.w(message);

  @override
  void logError(String message) => _logger.e(message);

  @override
  void logDebug(String message) => _logger.d(message);
}
