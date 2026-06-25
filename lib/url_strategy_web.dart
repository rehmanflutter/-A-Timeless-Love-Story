// Web-only implementation.
// Only compiled when dart.library.html is available (Flutter Web).
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void configureUrlStrategy() {
  usePathUrlStrategy();
}
