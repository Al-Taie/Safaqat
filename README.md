# Safaqat

Safaqat is a cross-platform Flutter application architected with robust clean code principles and modern design patterns to ensure scalability, maintainability, and testability. The project structure is modular and optimized for collaborative development and international reach.

---

## 🌍 Localization & Internationalization

- **Full Multilingual Support**: Safaqat is fully localized, supporting multiple languages with easy extensibility for future locales.
- **Flutter Intl Package**: Uses [`intl`](https://pub.dev/packages/intl) for message formatting, date/time localization, and pluralization.
- **Centralized Locale Management**: All translations and locale resources are centrally managed in the `/lib/safaqat/presentation/localization` directory, simplifying the process of adding or updating languages.
- **Dynamic Locale Switching**: Users can switch languages at runtime without restarting the app.

---

## 🏗️ Architectural Patterns

- **Clean Architecture**: Clear separation of concerns via Data, Domain, and Presentation layers.
  - **Data Layer**: Handles API integration, local storage, and data mapping.
  - **Domain Layer**: Contains business logic, entities, and use case abstractions.
  - **Presentation Layer**: Manages UI, controllers, and state. Also each featue has a separated package.
- **Organized by feature**: each major feature (auth, contracts, events, news, etc.) has its own subdirectory under `presentation/ui`.
- **Repository Pattern**: All data sources (remote APIs, local cache, etc.) are abstracted behind interfaces, enabling easy mocking and testing.
- **Dependency Injection**: Leveraging GetX’s DI for efficient and decoupled dependency management.
- **Reactive State Management**: Using GetX controllers and observables for predictable, testable state flows.

---

## 💡 Design Patterns & Best Practices

- **MVVM (Model-View-ViewModel)**: The UI (widgets) interacts only with ViewModels (Controllers), which expose reactive streams of state and handle user input.
- **SOLID Principles**: Codebase follows Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, and Dependency Inversion.
- **Separation of Concerns**: Business logic, UI, and data access are strictly separated.
- **Error Handling**: Centralized error handling and user-friendly error messages.

---

## 📁 Project Structure

```plaintext
Safaqat/
|
├── android/                    # Native Android code (Kotlin, resources, manifests, Gradle)
├── assets/
│   ├── drawable/               # SVGs, PNGs, and splash/logo images
│   └── fonts/                  # Custom font files (Cairo)
├── ios/                        # Native iOS code (Swift/ObjC, Xcode configs, assets)
├── lib/
│   ├── localization/           # App localization (translations, language files)
│   └── safaqat/
│       ├── app/                # App-wide config, core utilities, extensions, constants
│       ├── data/               # Data sources, models, repositories (API, DTOs)
│       ├── domain/             # Entities, repository interfaces, use cases (business logic)
│       └── presentation/       
│           ├── custom_views/   # Reusable custom widgets
│           └── ui/             # Feature-specific UIs (auth, contracts, home, news, notification, profile, etc.)
│   ├── app_binding.dart        # Dependency injection setup (GetX bindings)
│   └── main.dart               # App entry point
├── test/                       # Test files (e.g., widget tests)
├── pubspec.yaml                # Flutter project dependencies and config
├── analysis_options.yaml       # Static analysis (linter) rules
└── README.md                   # Project documentation
```

---

## 🚀 Technologies Used

- **Flutter & Dart**: Main cross-platform framework.
- **Kotlin (Android), Swift/ObjC (iOS)**: Native integrations for deep platform support.
- **Key Libraries**:
  - [`GetX`](https://pub.dev/packages/get) for state management, routing, DI.
  - [`Dio`](https://pub.dev/packages/dio) & [`Retrofit`](https://pub.dev/packages/retrofit) for networking.
  - [`Shared_Preferences`](https://pub.dev/packages/shared_preferences) for local persistence.
  - [`Cached_Network_Image`](https://pub.dev/packages/cached_network_image) for efficient image caching.
  - [`Flutter_SVG`](https://pub.dev/packages/flutter_svg), [`Lottie`](https://pub.dev/packages/lottie) for vector graphics and animations.
  - [`Google_Maps_Flutter`](https://pub.dev/packages/google_maps_flutter), [`Geolocator`](https://pub.dev/packages/geolocator) for geolocation and maps.
  - [`Intl`](https://pub.dev/packages/intl) for localization.
  - ...see [`pubspec.yaml`](./pubspec.yaml) for more.

---

## 🧑‍💻 Key Principles

- **Scalable Modular Design**: Each feature is self-contained and independently testable.
- **Maintainability**: Strict code style, strong typing, and documentation throughout.
- **Testability**: The architecture supports adding unit, widget, and integration tests with minimal refactoring.
- **Internationalization**: All text is externalized, locale-aware, and adaptable.

---

## 📚 References

- [Flutter Documentation](https://docs.flutter.dev/)
- [GetX Guide](https://pub.dev/packages/get)
- [Clean Code & Architecture](https://pub.dev/packages/clean_architecture)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
