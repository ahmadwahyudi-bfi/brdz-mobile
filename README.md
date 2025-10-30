# brdz_test

Brdz Test project

## Getting Started

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

I use riverpod because


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

### State Management & Dependency Injection
- **[flutter_riverpod | Flutter Package](https://pub.dev/packages/flutter_riverpod)** for state management and dependency injection

**Why Riverpod?**
- **Built-in Dependency Injection**: No need for third-party DI solutions like GetIt or Provider
- **Auto-dispose**: Automatically cleans up resources when not in use, preventing memory leaks
- **Compile-time safety**: Catches errors at compile time, not runtime
- **Easy testing**: Providers can be easily overridden for unit and widget testing
- **DevTools integration**: Full support for Flutter DevTools for debugging state changes
- **No context required**: Access providers anywhere without BuildContext
- **Immutable state**: Encourages immutable state management with Freezed integration
- **Hot reload friendly**: State persists across hot reloads during development
- **Simple and intuitive**: Easy to learn and use compared to other state management solutions

### Routing
- **[go_router | Flutter Package](https://pub.dev/packages/go_router)** - A declarative routing package for Flutter based on Navigator class
    - Type-safe navigation with named routes
    - Deep linking support
    - Nested navigation and shell routes
    - Redirection and guard support

### Serialization & Code Generation
- **[json_serializable | Dart Package](https://pub.dev/packages/json_serializable)** - Provides Dart build system builders for handling JSON
- **[freezed | Dart Package](https://pub.dev/packages/freezed)** - A data class generator with constructor, de/serializer handler, union types, pattern-matching, etc
    - Immutable data classes with copyWith method
    - Union types and sealed classes
    - JSON serialization integration
    - Pattern matching support

### Internationalization
- **[intl | Dart Package](https://pub.dev/packages/intl)** - Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text

### Networking
- **[dio | Dart Package](https://pub.dev/packages/dio)** - A powerful Http client for Dart
    - Interceptors support
    - Global configuration
    - FormData support
    - Request cancellation
    - File downloading
    - Timeout configuration

### Secure Storage
- **[flutter_secure_storage | Flutter Package](https://pub.dev/packages/flutter_secure_storage)** - Provides API to store data in secure storage
    - Keychain is used in iOS
    - KeyStore based solution is used in Android
    - Encrypted storage for sensitive data

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
