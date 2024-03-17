import 'dart:io';

void setUpHttpOverrides() {
  HttpOverrides.global = _AppHttpOverrides();
}

class _AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return host == "api.nasa.gov" || host == "apod.nasa.gov";
      };
  }
}
