# GetX Boilerplate

A modern, scalable Flutter boilerplate utilizing **GetX** for state management, dependency injection, and routing, combined with **Sqflite** and **SQLCipher** for a secure, local database.

## 🚀 Features

*   **GetX Integration:**
    *   **State Management:** Reactive programming using `GetxController` and `.obs`.
    *   **Routing:** Centralized navigation setup in `AppRouter`.
    *   **Dependency Injection:** Lazy and smart service registration using `Bindings` (`MainBindings`, `DatabaseBindings`).
    *   **Internationalization (i18n):** Deeply integrated JSON asset-based translations (`assets/lang/en.json`, `es.json`) loaded dynamically at startup via `AppTranslations` and `AppStrings`.
*   **Secure Local Storage:**
    *   **Sqflite & SQLCipher:** Fully implemented `DbProvider` ensuring encrypted local databases.
    *   **Concurrent Open Protection:** Uses `Completer` logic to prevent multiple database initialization attempts.
    *   **Auto-generated Passphrase:** Automatically generates and stores a secure 256-bit AES database key securely via `flutter_secure_storage`.
*   **Clean Data Architecture & SOLID Principles:**
    *   **Interfaces:** All services, repositories, and data providers are abstracted behind interfaces (`IExampleService`, `IDbProvider`, etc.) to decouple implementations and enhance testability.
    *   **Domain Model (`ExampleModel`):** Pure Dart object representing the business logic.
    *   **Data Entity (`ExampleEntity`):** Data Transfer Object (DTO) directly mapping database rows using `toMap()` and `fromMap()`.
    *   **Table Provider (`ExampleTableProvider`):** Direct database execution (CRUD operations), implementing `IExampleTableProvider`.
    *   **Repository (`ExampleRepository`):** A wrapper connecting the Domain Model to the underlying Data Entities, implementing `IExampleRepository`.

## 📁 Project Structure

```text
lib/
├── domain/                  # Business logic, interfaces, and abstract models
│   ├── models/
│   │   └── example_model.dart
│   ├── repositories/        # Domain Repository Interfaces
│   │   └── i_example_repository.dart
│   └── services/            # Domain Service Interfaces
│       └── i_example_service.dart
├── infrastructure/          # Core setup, services, and routing
│   ├── business/
│   │   ├── bindings/        # GetX Bindings (Main, Database) injecting Interfaces
│   │   └── controllers/     # GetX Controllers
│   ├── constants/           # Constants (Colors, Strings)
│   ├── data/
│   │   ├── models/          # Data Transfer Objects (DTO) / Entities
│   │   │   └── example_entity.dart
│   │   ├── providers/       # Direct Database Access and Interfaces
│   │   │   ├── i_db_provider.dart
│   │   │   ├── i_example_table_provider.dart
│   │   │   └── example_table_provider.dart
│   │   ├── repositories/    # Maps Entities to Domain Models
│   │   │   └── example_repository.dart
│   │   └── db_provider.dart # Encrypted Database Initialization
│   ├── router.dart          # App Navigation
│   └── services/            # Global Concrete Services

├── presentation/            # User Interface
│   ├── pages/               # Screens
│   └── widgets/             # Reusable UI components
└── main.dart                # Application Entry Point
```

## 🛠 Getting Started

### 1. Prerequisites
Ensure you have the Flutter SDK installed on your machine.
Run the following command to make sure you have no pending issues:
```bash
flutter doctor
```

### 2. Installation
Navigate to the directory and install all required dependencies:
```bash
cd getx_boilerplate
flutter pub get
```

### 3. Running the App
Run the application on an emulator or a connected device:
```bash
flutter run
```

### 4. Renaming the Application
When starting a new project from this boilerplate, you generally want to rename the app's Display Name and Bundle ID/Package Name. We recommend using the [rename](https://pub.dev/packages/rename) package for this because it modifies iOS, Android, macOS, Linux, and Windows directories seamlessly.

First, install the package globally if you haven't already:
```bash
dart pub global activate rename
```

Then, run the target commands inside the `flutter_getx_boilerplate` root to rename your Bundle Id and Application Name:
```bash
# Change the Application / Display Name
rename setAppName --targets ios,android --value "Your New App Name"

# Change the Bundle ID / Package Name
rename setBundleId --targets ios,android --value "com.yourcompany.yourapp"
```

## 🔒 Database Details
The `DbProvider` class handles the heavy lifting of:
1. Connecting securely to the device's keychain (`flutter_secure_storage`).
2. Generating a cryptographic passkey if one does not exist.
3. Decrypting/Activating the local SQLite database via SQLCipher using the key.
4. Using an asynchronous `Completer` to solve concurrency initialization loops.

## ✨ Useful GetX Commands
*   **Navigation:** `Get.toNamed('/route_name')`, `Get.back()`
*   **Snackbars:** `Get.snackbar('Title', 'Message')`
*   **Dialogs:** `Get.defaultDialog(title: 'Dialog')`
*   **Translations:** `AppStrings.welcomeMessage.tr`
