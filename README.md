<div align="center">

# 🇾🇪 Yemen Offers

**A full-featured marketplace app connecting consumers with the best deals and offers across Yemen.**

![Flutter](https://img.shields.io/badge/Flutter-3.7+-02569B?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.7-0175C2?style=flat&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/State_Management-Getx-6366F1?style=flat)
![Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-10B981?style=flat)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat)
![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=flat)

[![Preview](https://img.shields.io/badge/Preview-Coming_Soon-purple?style=for-the-badge)](#)

</div>

---

## ✨ Highlights

- 🛒 **Consumer & Merchant** — Dual-role platform with separate flows for buyers and sellers
- 🏪 **Store Management** — Merchants can create, update, and manage multiple stores
- 🎯 **Offer Management** — Full CRUD for deals with categories, pricing, and discounts
- 🔍 **Smart Search** — Keyword and image-based offer search
- ❤️ **Favorites** — Save and manage favorite offers
- 📍 **Location Services** — GPS + IP-based geolocation with Google Maps integration
- 🔐 **Authentication** — Secure JWT-based login, registration, and password reset
- 🌙 **Dark Mode** — Built-in light and dark theme support
- 🌐 **Deep Linking** — URI-based navigation for password reset flows

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a **feature-first** organization, ensuring separation of concerns, testability, and scalability.

```
Presentation (UI)  →  Domain (Business Logic)  →  Data (API, Storage)
     ↑                        ↑                          ↑
  GetX Controllers      Use Cases + Entities      Repositories + Models
```

### Core Principles

| Principle | Implementation |
|-----------|---------------|
| **Separation of Concerns** | Each layer has a single, well-defined responsibility |
| **Dependency Inversion** | Domain defines interfaces; Data implements them |
| **Repository Pattern** | Abstract repos in Domain, concrete impls in Data |
| **Functional Error Handling** | `Either<Failure, T>` from `dartz` throughout the data flow |
| **Reactive State** | GetX `.obs` types with `Obx` widget bindings |

---

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── app_home.dart                      # GetMaterialApp root (singleton)
│
├── core/                              # Shared infrastructure
│   ├── binding/                       # Global dependency injection
│   ├── cache/                         # Hive local storage
│   ├── constants/                     # API endpoints, app config, cache keys
│   ├── errors/                        # Failure hierarchy & Dio exception mapping
│   ├── network/                       # Dio HTTP client, interceptors, connectivity
│   ├── routes/                        # GetX named routes & page definitions
│   ├── services/                      # Location service (GPS + IP)
│   ├── theme/                         # Colors, text styles, spacing, ThemeData
│   ├── utils/                         # Map utilities
│   └── widgets/                       # Shared UI components
│
└── features/                          # Feature modules (each self-contained)
    ├── auth/                          # 🔐 Authentication
    │   ├── data/                      #    Models, remote/local data sources, repo impls
    │   ├── domain/                    #    Entities, abstract repos, use cases
    │   └── presentation/              #    Pages, widgets, GetX controllers, bindings
    │
    ├── home/                          # 🏠 Home feed & navigation shell
    ├── browse/                        # 📂 Categories, stores, offers browsing
    ├── search/                        # 🔍 Keyword & image search
    ├── favorite/                      # ❤️  User favorites
    ├── offer/                         # 🎯 Merchant offer management (CRUD)
    ├── store/                         # 🏪 Merchant store management (CRUD)
    └── profile/                       # 👤 User & merchant profiles
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** — `>=3.7.0`
- **Dart SDK** — `>=3.7.0`
- **IDE** — VS Code / Android Studio with Flutter extensions
- **Backend** — Django REST API running at configured base URL

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/frontend.git
cd frontend

# Install dependencies
flutter pub get

# Run code generation (Hive adapters)
dart run build_runner build --delete-conflicting-outputs
```

### Running the App

```bash
# Development (default)
flutter run

# Release build
flutter build apk --release
```

> **Note:** Update the API base URL in `lib/core/constants/api_constants.dart` to point to your backend server.

---

## 🛠️ Tech Stack

### State Management & Navigation

| Package | Purpose |
|---------|---------|
| [get](https://pub.dev/packages/get) `^4.7.2` | State management, dependency injection, named routing |

### Networking & Storage

| Package | Purpose |
|---------|---------|
| [dio](https://pub.dev/packages/dio) `^5.8.0+1` | HTTP client with interceptors |
| [hive](https://pub.dev/packages/hive) `^2.2.3` | Lightweight local storage |
| [hive_flutter](https://pub.dev/packages/hive_flutter) `^1.1.0` | Hive Flutter integration |

### Functional Programming

| Package | Purpose |
|---------|---------|
| [dartz](https://pub.dev/packages/dartz) `^0.10.1` | `Either<Failure, T>` for type-safe error handling |

### Location & Maps

| Package | Purpose |
|---------|---------|
| [geolocator](https://pub.dev/packages/geolocator) `^13.0.3` | GPS location services |
| [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) `^2.11.0` | Google Maps widget |
| [flutter_map](https://pub.dev/packages/flutter_map) `^8.1.1` | OpenStreetMap widget |
| [geocoding](https://pub.dev/packages/geocoding) `^3.0.0` | Address ↔ coordinates |
| [latlong2](https://pub.dev/packages/latlong2) `^0.9.1` | Latitude/longitude types |

### Connectivity & Utilities

| Package | Purpose |
|---------|---------|
| [internet_connection_checker_plus](https://pub.dev/packages/internet_connection_checker_plus) `^2.7.1` | Internet connectivity check |
| [connectivity_plus](https://pub.dev/packages/connectivity_plus) `^6.1.3` | Network type detection |
| [image_picker](https://pub.dev/packages/image_picker) `^1.1.2` | Camera/gallery image selection |
| [url_launcher](https://pub.dev/packages/url_launcher) `^6.3.1` | Open external URLs |
| [app_links](https://pub.dev/packages/app_links) `^6.4.0` | Deep linking support |
| [carousel_slider](https://pub.dev/packages/carousel_slider) `^5.0.0` | Image carousel |

---

## ⚙️ Configuration

### API Configuration

Update the base URL in `lib/core/constants/api_constants.dart`:

```dart
static const String apiDomain = 'http://YOUR_SERVER_IP:8000';
static const String baseUrl = '$apiDomain/api/';
```

### Cache Keys

Cache keys are centralized in `lib/core/constants/cache_constants.dart`:

```dart
static const String accessToken = 'ACCESS_TOKEN';
static const String refreshToken = 'REFRESH_TOKEN';
```

### Theme

Customize colors and text styles in `lib/core/theme/`:

| File | Purpose |
|------|---------|
| `colors.dart` | App color palette (primary: `#007AFF`, secondary: `#FF9500`) |
| `text_styles.dart` | Typography definitions |
| `spacing.dart` | Spacing constants (small: 8, medium: 16, large: 24) |
| `app_theme.dart` | Light & dark `ThemeData` |

---

## 📦 Features Overview

### 🔐 Authentication
- Email/password login with JWT tokens
- User registration with profile setup
- Password reset via email (deep link flow)
- Account confirmation via OTP
- Automatic token refresh

### 🏠 Home & Browse
- Image carousel for recommendations
- Category grid navigation
- Most popular & latest offers sections
- Horizontal and vertical offer lists

### 🔍 Search
- Keyword-based offer search
- Image-based offer search
- Real-time search results

### ❤️ Favorites
- Save/remove offers from favorites
- Dedicated favorites page

### 🏪 Merchant — Store Management
- Create, update, delete stores
- Store details with map location
- Store contact & social media info

### 🎯 Merchant — Offer Management
- Create, update, delete offers
- Offer form with categories & pricing
- Offer details view

### 👤 Profile
- User profile view & edit
- Merchant profile with commercial info
- Password change

---

## 🧩 Adding a New Feature

Follow the existing Clean Architecture pattern:

```
lib/features/your_feature/
├── data/
│   ├── models/                  # JSON serializable models
│   ├── sources/                 # Remote data source (API calls)
│   └── repos/                   # Repository implementation
├── domain/
│   ├── entities/                # Business objects
│   ├── repos/                   # Abstract repository interface
│   └── use_cases/               # Single-purpose business logic
└── presentation/
    ├── views/
    │   ├── pages/               # Full-screen pages
    │   └── widgets/             # Reusable UI components
    ├── getX/
    │   ├── controllers/         # GetxController state management
    │   └── binding.dart         # Dependency injection setup
    └── ...
```

### Steps

1. **Entity** — Define the business object in `domain/entities/`
2. **Repository Interface** — Define the contract in `domain/repos/`
3. **Use Case** — Encapsulate business logic in `domain/use_cases/`
4. **Model** — Create the JSON model in `data/models/`
5. **Data Source** — Implement API calls in `data/sources/`
6. **Repository Impl** — Wire data sources to domain in `data/repos/`
7. **Controller** — Manage UI state in `presentation/getX/controllers/`
8. **Binding** — Register dependencies in `presentation/getX/binding.dart`
9. **Route** — Add the route in `lib/core/routes/app_pages.dart` and `app_routes.dart`

---

## 📊 Error Handling

The project uses a functional error handling pattern with `dartz`:

```dart
// Domain layer defines failures
abstract class Failure {}
class ServerFailure extends Failure { final String message; }
class CacheFailure extends Failure {}
class NetworkFailure extends Failure {}

// Repositories return Either<Failure, T>
Future<Either<Failure, LoginModel>> login(LoginParams params) async {
  try {
    final result = await remoteDataSource.login(params);
    return Right(result);
  } on ServerException catch (e) {
    return Left(ServerFailure(message: e.message));
  }
}
```

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'feat: add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Commit Convention

This project follows [Conventional Commits](https://www.conventionalcommits.org/):

```
feat:     new feature
fix:      bug fix
docs:     documentation changes
style:    formatting, missing semicolons, etc.
refactor: code refactoring
test:     adding tests
chore:    maintenance tasks
```

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Built with ❤️ for Yemen**

[![Flutter](https://img.shields.io/badge/Powered_by-Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Powered_by-Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

</div>
