# GetX Boilerplate

A modern, scalable Flutter boilerplate utilizing **GetX** for state management, dependency injection, and routing, combined with **Sqflite** and **SQLCipher** for a secure, local database.

## 🚀 Features

*   **GetX Integration:**
    *   **State Management:** Reactive programming using `GetxController` and `.obs`.
    *   **Routing:** Centralized navigation setup in `AppRouter`.
    *   **Dependency Injection:** Lazy and smart service registration using `Bindings` (`MainBindings`, `DatabaseBindings`).
    *   **Internationalization (i18n):** Built-in translation handling with `AppTranslations` and `AppStrings`.
*   **Secure Local Storage:**
    *   **Sqflite & SQLCipher:** Fully implemented `DbProvider` ensuring encrypted local databases.
    *   **Concurrent Open Protection:** Uses `Completer` logic to prevent multiple database initialization attempts.
    *   **Auto-generated Passphrase:** Automatically generates and stores a secure 256-bit AES database key securely via `flutter_secure_storage`.
*   **Clean Data Architecture:**
    *   **Domain Model (`ExampleModel`):** Pure Dart object representing the business logic.
    *   **Data Entity (`ExampleEntity`):** Data Transfer Object (DTO) directly mapping database rows using `toMap()` and `fromMap()`.
    *   **Table Provider (`ExampleTableProvider`):** Direct database execution (CRUD operations).
    *   **Repository (`ExampleRepository`):** A wrapper connecting the Domain Model to the underlying Data Entities.

## 📁 Project Structure

```text
lib/
├── domain/                  # Business logic and abstract models
│   └── models/
│       └── example_model.dart
├── infrastructure/          # Core setup, services, and routing
│   ├── business/
│   │   ├── bindings/        # GetX Bindings (Main, Database)
│   │   └── controllers/     # GetX Controllers
│   ├── constants/           # Constants (Colors, Strings)
│   ├── data/
│   │   ├── models/          # Data Transfer Objects (DTO) / Entities
│   │   │   └── example_entity.dart
│   │   ├── providers/       # Direct Database Access
│   │   │   └── example_table_provider.dart
│   │   ├── repositories/    # Maps Entities to Domain Models
│   │   │   └── example_repository.dart
│   │   └── db_provider.dart # Encrypted Database Initialization
│   ├── router.dart          # App Navigation
│   └── services/            # Global Services (Translations, APIs, etc.)
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
