class Logger {
  static const String _tag = "Logger";

  Logger._();
  static void log(String message) {
    final DateTime now = DateTime.now();
    final String formattedTime = "${now.hour}:${now.minute}:${now.second}";

    print("====================================");
    print("$_tag [$formattedTime]: $message");
    print("====================================");
  }

  static void info(String message) {
    log("[INFO] $message");
  }

  static void warning(String message) {
    log("[WARNING] $message");
  }

  static void error(String message) {
    log("[ERROR] $message");
  }

  static void debug(String message) {
    log("[DEBUG] $message");
  }

  static void custom(String level, String message) {
    log("[$level] $message");
  }
}
