# brdz_test

Brdz Test project

## Getting Started

## Directory Structure
The following shows the directory structure following monorepo and basic application architecture:
```

## Directory Structure
The following shows the directory structure following monorepo and basic application architecture:
```
lib
├── main.dart
├── core/
│   ├── constants/
│   ├── utils/
│   └── config/
├── features/
│   ├── auth/
│   ├── payment/
│   ├── transaction/
│   └── wallet/
├── shared/
│   ├── widgets/
│   └── models/
└── services/  
├── api/  
└── storage/
```

## Environment Setup

### Running the Application
To run the application locally, you need to provide the following environment variables using `--dart-define`:

```bash
flutter run \
  --dart-define=API_SCHEME=https \
  --dart-define=API_HOST=brzd.xyz \
  --dart-define=API_PORT= \
  --dart-define=PASSPHRASE=super-secret-passphrase-min-16-char
```

### VS Code Configuration
Create or update `.vscode/launch.json` file:
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter (Development)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--dart-define=API_SCHEME=https",
        "--dart-define=API_HOST=brzd.xyz",
        "--dart-define=API_PORT=",
        "--dart-define=PASSPHRASE=super-secret-passphrase-min-16-char"
      ]
    }
  ]
}
```

### Android Studio Configuration
1. Go to **Run** → **Edit Configurations**
2. Select your Flutter configuration
3. Add to **Additional run args**:
```
--dart-define=API_SCHEME=https --dart-define=API_HOST=brzd.xyz --dart-define=API_PORT= --dart-define=PASSPHRASE=super-secret-passphrase-min-16-char
```

### Environment Variables
| Variable | Value | Description |
|----------|-------|-------------|
| `API_SCHEME` | `https` | API protocol scheme |
| `API_HOST` | `brzd.xyz` | API host domain |
| `API_PORT` | _(empty)_ | API port (empty for default) |
| `PASSPHRASE` | `super-secret-passphrase-min-16-char` | Encryption passphrase (min 16 chars) |

## Libraries

The following libraries are used:
<br>
- [flutter_riverpod | Flutter Package](https://pub.dev/packages/flutter_riverpod) for state management and dependency injection
- [go_router | Flutter Package](https://pub.dev/packages/go_router), a declarative routing package for Flutter based on Navigator class.
- [json_serializable | Dart Package](https://pub.dev/packages/json_serializable), provides Dart build system builders for handling JSON
- [intl | Dart Package](https://pub.dev/packages/intl), provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
- [dio | Dart Package](https://pub.dev/packages/dio), a powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
- [freezed | Dart Package](https://pub.dev/packages/freezed), a data class generator with constructor, de/serializer handler, union types, pattern-matching, etc
- [flutter_secure_storage | Flutter Package](https://pub.dev/packages/flutter_secure_storage), provides API to store data in secure storage; Keychain is used in iOS and KeyStore based solution is used in Android.

## Project Setup

### Generate freezed file
Execute the following command to generate freezed file:
```
dart run build_runner build --delete-conflicting-outputs
```

### Generate localization
Execute the following command to generate localization file:
```
flutter gen-l10n
```

### Test Account
Use this dummy account bellow for testing:
```
email : test@gmail.com
password : Password1
```

### Dummy Qr For Transaction
Use this dummy QR Code below for testing:

<p align="center">
  <img src="qr_merchant.png" alt="Dummy QR Code"/>
</p>
