
// 项目环境
enum AppEnvironment { dev, test, release}

class AppConfig {
  static const AppEnvironment current = AppEnvironment.dev;

  static String get apiBaseUrl {
    switch (current) {
      case AppEnvironment.dev:
        return 'http://10.125.35.61:8082/';
      case AppEnvironment.test:
        return 'https://api-staging.example.com';
      case AppEnvironment.release:
        return 'https://api.example.com';
      default:
        return '';
    }
  }

  static String get h5BaseUrl {
    switch (current) {
      case AppEnvironment.dev:
        return 'https://api-dev.example.com';
      case AppEnvironment.test:
        return 'https://api-staging.example.com';
      case AppEnvironment.release:
        return 'https://api.example.com';
      default:
        return '';
    }
  }
}
