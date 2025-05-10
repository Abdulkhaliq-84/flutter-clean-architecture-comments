# Flutter Comments App

A modern Flutter application that demonstrates Clean Architecture principles while implementing a comments management system. This project showcases best practices in Flutter development, including state management, dependency injection, and offline-first capabilities.

## 🚀 Features

- View comments with offline support
- Add new comments
- Clean Architecture implementation
- BLoC pattern for state management
- Local caching with SharedPreferences
- Network connectivity handling
- Error handling with Either type

## 🛠️ Technical Stack

- **Flutter SDK**: >=3.3.4
- **State Management**: flutter_bloc
- **Dependency Injection**: get_it
- **Functional Programming**: dartz
- **Network**: http
- **Local Storage**: shared_preferences
- **Connectivity**: internet_connection_checker
- **Testing**: mockito

## 📱 Architecture

The project follows Clean Architecture principles with the following layers:

- **Presentation Layer**: UI components and BLoC
- **Domain Layer**: Business logic and entities
- **Data Layer**: Repositories and data sources
- **Core**: Common utilities and shared components

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── error/
│   ├── network/
│   └── platform/
├── features/
│   └── Comments/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── injection_container.dart
```

## 🚀 Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## 🧪 Testing

The project includes unit tests and widget tests. Run tests using:

```bash
flutter test
```

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.
