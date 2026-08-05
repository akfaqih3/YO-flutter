<div align="center">

<img src="screenshots/logo.png" alt="Yemen Offers Logo" width="150">

# 🇾🇪 Yemen Offers

**Flutter mobile application for the Yemen Offers platform — a marketplace connecting consumers with deals and offers across Yemen.**

![Flutter](https://img.shields.io/badge/Flutter-3.7+-02569B?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.7-0175C2?style=flat&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/State_Management-Getx-6366F1?style=flat)
![Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-10B981?style=flat)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat)
![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=flat)

[![Preview](https://img.shields.io/badge/Preview-Available_📱-purple?style=for-the-badge)](#-screenshots)

</div>

<div align="center">

![Demo](screenshots/demo.gif)

</div>

---

## ✨ Highlights

- **Feature-first Clean Architecture** — Self-contained feature modules with `data/domain/presentation` layers
- **GetX State Management** — Reactive state, dependency injection, and named routing
- **JWT Authentication** — Email/password login, Google OAuth, OTP verification, password reset via deep links
- **Dual-role Platform** — Separate consumer and merchant flows
- **Smart Search** — Vector keyword search and image-based offer search
- **Interactive Maps** — Google Maps and OpenStreetMap with store markers and popups
- **Image Upload** — Camera/gallery image picking for stores and offers
- **Shimmer Loading** — Skeleton placeholders for all major content lists
- **Dark Mode** — Full light/dark theme with persistence
- **Bilingual (AR/EN)** — Arabic and English with RTL support and language switching
- **Push Notifications** — Firebase Cloud Messaging with rich image notifications
- **Deep Linking** — URI-based navigation for password reset and OAuth callbacks
- **Offline Cache** — Hive local storage for tokens, preferences, and settings

---

## 📱 Screenshots

### Home & Browse

| | | |
|:---:|:---:|:---:|
| <img src="screenshots/home.png" alt="Home" width="200"> | <img src="screenshots/latest_offers.png" alt="Latest Offers" width="200"> | <img src="screenshots/most_popular.png" alt="Most Popular" width="200"> |
| <img src="screenshots/filters.png" alt="Filters" width="200"> | <img src="screenshots/offer_details.png" alt="Offer Details" width="200"> | <img src="screenshots/nearby_offers.png" alt="Nearby Offers" width="200"> |

### Merchant

| | | |
|:---:|:---:|:---:|
| <img src="screenshots/merchant_dashboard.png" alt="Merchant Dashboard" width="200"> | <img src="screenshots/store_management.png" alt="Store Management" width="200"> | <img src="screenshots/add_offer.png" alt="Add Offer" width="200"> |

---

## 🏗️ Architecture

This project follows **Clean Architecture** with a **feature-first** organization. Each feature is self-contained with its own `data`, `domain`, and `presentation` layers.

### Layer Flow

```
UI (Pages & Widgets)
        ↓
Controller (GetX)
        ↓
Use Case (Single-purpose business logic)
        ↓
Repository (Abstract interface)
        ↓
Data Source (Remote API / Local cache)
        ↓
REST API
```

### Layer Responsibilities

| Layer | Location | Responsibility |
|-------|----------|----------------|
| **UI** | `presentation/views/pages/` + `widgets/` | Screens, reusable widgets, layout. No business logic. |
| **Controller** | `presentation/getX/controllers/` | Manages UI state (`Rx` types), calls use cases, handles user actions. |
| **Binding** | `presentation/getX/*_binding.dart` | Registers all dependencies for a route via GetX DI. |
| **Use Case** | `domain/use_cases/` | Single-purpose class. One method. Encapsulates business logic. |
| **Repository** | `domain/repos/` (abstract) / `data/repos/` (impl) | Defines contract (domain) and implements it (data). |
| **Data Source** | `data/sources/` | Makes HTTP calls via `ApiService`. Handles response parsing. |
| **Model** | `data/models/` | JSON serialization (`fromJson`/`toJson`). Maps to entities. |
| **Entity** | `domain/entities/` | Pure business objects. No framework dependencies. |

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
├── main.dart                              # App entry, Hive init, runApp
├── app_home.dart                          # GetMaterialApp + deep link listener
│
├── core/                                  # Shared infrastructure
│   ├── binding/                           # Global DI (AppBinding)
│   ├── cache/                             # Hive box wrapper (CacheHelper)
│   ├── common/
│   │   ├── controllers/                   # Shared controllers (e.g. filters)
│   │   ├── presentation/
│   │   │   ├── layout/                    # Reusable layout wrappers
│   │   │   ├── no_internet_page.dart      # No internet screen
│   │   │   └── widgets/                   # 18+ shared widgets
│   │   └── services/                      # Network monitoring service
│   ├── constants/                         # API endpoints, cache keys, enums, assets
│   ├── errors/                            # Failure hierarchy, Dio exception mapping
│   ├── middlewares/                        # Route middlewares (onboarding guard)
│   ├── network/                           # Dio config, ApiService, connectivity
│   ├── routes/                            # Named routes + page definitions
│   ├── services/                          # Location, theme, FCM, language, notifications
│   ├── theme/                             # Colors, text styles, spacing, ThemeData
│   └── utils/                             # Validators, date utils, map utils, URL utils
│
└── features/                              # Feature modules (self-contained)
    ├── auth/                              # Login, register, OTP, password reset, Google OAuth
    ├── home/                              # Home feed, carousel, bottom nav, main scaffold
    ├── browse/                            # Category browsing, offer/store lists, nearby maps
    ├── search/                            # Keyword search, image search
    ├── favorite/                          # Save/remove favorites, share offers
    ├── offer/                             # Merchant offer CRUD
    ├── store/                             # Merchant store CRUD
    ├── profile/                           # User & merchant profile, settings
    ├── notification/                      # Push notification list
    └── onboarding/                        # Splash, onboarding walkthrough
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** — `>=3.7.0`
- **Dart SDK** — `>=3.7.0`
- **IDE** — VS Code / Android Studio with Flutter extensions
- **Backend** — REST API running at configured base URL

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/YO-flutter.git
cd YO-flutter

# Install dependencies
flutter pub get

# Run code generation (if needed)
dart run build_runner build --delete-conflicting-outputs
```

### Verify Setup

```bash
# Check Flutter environment
flutter doctor

# Analyze for issues
flutter analyze

# Run tests
flutter test
```

### Run

```bash
# Development
flutter run

# Release build
flutter build apk --release
```

---

## ⚙️ Configuration

### API Base URL

Update `lib/core/constants/api_constants.dart` to point to your backend:

```dart
static const String domain = 'http://YOUR_SERVER_IP:8000';
static const String baseUrl = '$domain/api/';
```

### Firebase

Firebase is configured via `lib/core/services/firebase/firebase_options.dart` (generated by FlutterFire CLI). Push notifications use Firebase Cloud Messaging.

### Google Maps

Google Maps requires an API key configured in:
- **Android:** `android/app/src/main/AndroidManifest.xml`
- **iOS:** `ios/Runner/AppDelegate.swift`

---

## 🛠️ Tech Stack

### State Management & DI

| Package | Version | Why |
|---------|---------|-----|
| [get](https://pub.dev/packages/get) | `^4.7.2` | Reactive state management, dependency injection, named routing, and bindings — all in one package |

### Networking

| Package | Version | Why |
|---------|---------|-----|
| [dio](https://pub.dev/packages/dio) | `^5.8.0+1` | HTTP client with interceptors for automatic JWT token attachment and request configuration |
| [internet_connection_checker_plus](https://pub.dev/packages/internet_connection_checker_plus) | `^2.7.1` | Real-time internet connectivity verification |
| [connectivity_plus](https://pub.dev/packages/connectivity_plus) | `^6.1.3` | Network type detection (WiFi vs mobile) |

### Local Storage

| Package | Version | Why |
|---------|---------|-----|
| [hive](https://pub.dev/packages/hive) | `^2.2.3` | Lightweight key-value NoSQL for tokens and preferences |
| [hive_flutter](https://pub.dev/packages/hive_flutter) | `^1.1.0` | Hive Flutter initialization |

### Functional Programming

| Package | Version | Why |
|---------|---------|-----|
| [dartz](https://pub.dev/packages/dartz) | `^0.10.1` | `Either<Failure, T>` for type-safe error handling without exceptions |

### Location & Maps

| Package | Version | Why |
|---------|---------|-----|
| [geolocator](https://pub.dev/packages/geolocator) | `^13.0.3` | GPS location services with permission handling |
| [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) | `^2.11.0` | Google Maps widget for store locations |
| [flutter_map](https://pub.dev/packages/flutter_map) | `^8.1.1` | OpenStreetMap widget for nearby offers/stores |
| [flutter_map_marker_popup](https://pub.dev/packages/flutter_map_marker_popup) | `^8.0.1` | Popup overlays on map markers |
| [geocoding](https://pub.dev/packages/geocoding) | `^3.0.0` | Address ↔ coordinate conversion |
| [latlong2](https://pub.dev/packages/latlong2) | `^0.9.1` | Latitude/longitude types for flutter_map |

### UI & Media

| Package | Version | Why |
|---------|---------|-----|
| [cached_network_image](https://pub.dev/packages/cached_network_image) | `^3.4.1` | Disk-cached network images with placeholder support |
| [image_picker](https://pub.dev/packages/image_picker) | `^1.1.2` | Camera/gallery image selection for store and offer forms |
| [carousel_slider](https://pub.dev/packages/carousel_slider) | `^5.0.0` | Image carousel for home recommendations |
| [shimmer](https://pub.dev/packages/shimmer) | `^3.0.0` | Shimmer loading skeleton effects |
| [lottie](https://pub.dev/packages/lottie) | `^3.3.1` | Lottie animation support |
| [iconsax](https://pub.dev/packages/iconsax) | `^0.0.8` | Extended icon pack |

### Navigation & Links

| Package | Version | Why |
|---------|---------|-----|
| [app_links](https://pub.dev/packages/app_links) | `^6.4.0` | Deep linking for password reset and OAuth callbacks |
| [url_launcher](https://pub.dev/packages/url_launcher) | `^6.3.1` | Open external URLs, maps, and phone dialer |
| [share_plus](https://pub.dev/packages/share_plus) | `^11.0.0` | Share offer content to other apps |

### Notifications & Firebase

| Package | Version | Why |
|---------|---------|-----|
| [firebase_core](https://pub.dev/packages/firebase_core) | `^3.13.0` | Firebase initialization |
| [firebase_messaging](https://pub.dev/packages/firebase_messaging) | `^15.2.5` | Push notifications via FCM |
| [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) | `^19.1.0` | Local notification display with rich content |

### Forms & Input

| Package | Version | Why |
|---------|---------|-----|
| [multi_select_flutter](https://pub.dev/packages/multi_select_flutter) | `^4.1.3` | Multi-select dropdown for category filtering |
| [intl](https://pub.dev/packages/intl) | `^0.20.2` | Date formatting and internationalization utilities |

---

## 📦 Features Overview

### 🔐 Authentication

- **Email/Password Login** — JWT-based with access and refresh tokens
- **Google OAuth** — Opens browser for Google login, receives tokens via deep link
- **Registration** — Form with validation, OTP email verification
- **Password Reset** — Email deep link flow with token-based confirmation
- **Join as Merchant** — Upgrade consumer account to merchant role
- **Logout** — Token invalidation, FCM token removal, cache cleanup

### 🏠 Home Feed

- **Image Carousel** — Recommendation banners with auto-scroll and indicators
- **Categories Grid** — Quick-access category navigation
- **Most Popular Offers** — Horizontally scrollable popular deals
- **Latest Offers** — Recently added offers
- **Horizontal Store List** — Scrollable store cards

### 📂 Browse

- **Category Browsing** — Browse offers and stores by category with tab switching
- **Offer Lists** — Filterable and sortable offer lists (by date, price, discount)
- **Offer Details** — Full offer view with image, pricing, store info, map, and share
- **Store Details** — Store profile with contact info, social links, and map location
- **Nearby Offers** — Map-based view of nearby deals
- **Nearby Stores** — Map view with marker popups for local stores

### 🔍 Search

- **Keyword Search** — Vector-based text search for offers
- **Image Search** — Upload an image to find visually similar offers

### ❤️ Favorites

- **Save/Remove** — Toggle favorite status on any offer
- **Favorites Page** — Dedicated list of saved offers
- **Share** — Share offer content to other apps

### 🏪 Merchant — Store Management

- **Create Store** — Form with name, description, address, category, map location, social links
- **Edit Store** — Update store details
- **Store Details** — View store with map and associated offers
- **Store List** — Manage all merchant stores

### 🎯 Merchant — Offer Management

- **Create Offer** — Form with title, description, pricing, discount percentage, date range, image, categories
- **Edit Offer** — Update offer details
- **Offer Details** — View offer with analytics (views, clicks, shares, favorites)
- **Offer List** — Manage all merchant offers

### 👤 Profile

- **User Profile** — View and update profile information
- **Change Password** — Secure password change
- **Dark Mode Toggle** — Persistent theme switching
- **Language Switcher** — Arabic/English with RTL support
- **Merchant Profile** — Merchant-specific commercial information

### 🔔 Notifications

- **Push Notifications** — Firebase Cloud Messaging for real-time alerts
- **Rich Notifications** — Image download and display in notification tray
- **Notification List** — View notification history

### 🚀 Onboarding

- **Splash Screen** — Animated logo with scale and fade transitions
- **Onboarding Walkthrough** — 3-page intro with indicators (shown on first launch)

---

## 🎨 Theme System

### Material 3

The app uses Material 3 with both light and dark `ThemeData` configurations.

### Color Palette

| Role | Light Mode | Dark Mode |
|------|------------|-----------|
| **Primary** | `#FF5F0C` (orange) | `#FF5F0C` |
| **Secondary** | `#01236A` (dark blue) | `#4A90D9` |
| **Background** | `#F2F2F7` | `#1C1C1E` |
| **Surface** | `#FFFFFF` | `#2C2C2E` |
| **Text Primary** | `#1C1C1E` | `#FFFFFF` |
| **Text Secondary** | `#8E8E93` | `#CCCCCC` |
| **Error** | `#FF3B30` | `#FF453A` |

### Dark Mode

Dark mode is persisted via Hive and toggled from the profile page. `ThemeService` manages the switch by calling `Get.changeThemeMode()`.

### Spacing System

Defined in `lib/core/theme/spacing.dart`:

| Token | Value |
|-------|-------|
| `small` | 8px |
| `medium` | 16px |
| `large` | 24px |

### Typography

Text styles are centralized in `lib/core/theme/text_styles.dart` with predefined `headline`, `subtitle`, `bodyText`, and `buttonText` styles.

---

## 🔄 State Management

### GetX Patterns

**Reactive State:**
```dart
RxList<OfferEntity> mostPopularOffers = RxList([]);
RxBool isMostPopularOffersLoading = true.obs;
```

**Controller Lifecycle:**
- Controllers extend `GetxController`
- State is managed via `Rx` types and `Obx` widgets
- Loading flags control skeleton/content switching

**Bindings:**
- Each route has a binding class that registers controllers and repositories
- Global singletons (`ApiService`, `ThemeService`, `LocationService`, `NetworkService`) registered in `AppBinding` with `permanent: true`
- Feature bindings use `fenix: true` for re-creation on route revisit

**Navigation:**
- Named routes defined in `lib/core/routes/app_routes.dart`
- Route-to-page mapping in `lib/core/routes/app_pages.dart`
- Methods: `Get.toNamed()`, `Get.offAllNamed()`, `Get.offNamed()`, `Get.back()`

---

## 🔗 Dependency Injection

### Global Singletons

Registered in `AppBinding` (applied to `GetMaterialApp`):

| Service | Scope |
|---------|-------|
| `ApiService` | `permanent: true` |
| `ThemeService` | `permanent: true` |
| `LocationService` | `permanent: true` |
| `NetworkService` | `permanent: true` |

### Feature-level DI

Each feature binding registers its own controllers and repositories:

```dart
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepoImpl(Get.find<ApiService>()));
    Get.lazyPut(() => LoginController(Get.find<LoginRepoImpl>()));
  }
}
```

### Pattern

1. Domain defines abstract repository interfaces
2. Data implements them with data sources
3. Bindings wire implementations to controllers
4. Controllers call use cases, which call repositories

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
    └── getX/
        ├── controllers/         # GetxController state management
        └── binding.dart         # Dependency injection setup
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

### Failure Hierarchy

```
Failure (abstract, message: String)
├── ServerFailure    — API/Dio errors
├── CacheFailure     — Local storage errors
└── NetworkFailure   — Connectivity errors
```

### Dio Exception Mapping

`DioErrorHandler` maps every `DioExceptionType` to a user-facing message:

| Exception | Behavior |
|-----------|----------|
| `connectionTimeout` | Connection timeout message |
| `sendTimeout` | Send timeout message |
| `receiveTimeout` | Receive timeout message |
| `badResponse` | HTTP status-specific messages (400, 401, 403, 404, 500) |
| `cancel` | Request cancelled message |
| `connectionError` | No connection message |

### Flow

```
DataSource (throws exception)
        ↓
Repository (catches → returns Left(Failure))
        ↓
Use Case (passes through)
        ↓
Controller (calls .fold() → shows snackbar on failure)
```

---

## 💾 Caching

### Hive Storage

Single Hive box (`APP_CACHE`) stores:

| Key | Purpose |
|-----|---------|
| `ACCESS_TOKEN` | JWT access token |
| `REFRESH_TOKEN` | JWT refresh token |
| `IS_FIRST_OPEN` | First launch detection (onboarding gate) |
| `IS_DARK_MODE` | Theme preference |
| `APP_LANG` | Selected language |
| `EMAIL_NOT_CONFIRMED` | Email confirmation state |

### Cache Helper

`CacheHelper` provides a simple static API:
- `saveData(key, value)` — Store a value
- `getData(key)` — Retrieve a value
- `removeData(key)` — Delete a value
- `clearCache()` — Clear all cached data

---

## 🌐 Localization

### Supported Languages

| Language | Code | RTL |
|----------|------|-----|
| Arabic | `ar` | Yes |
| English | `en` | No |

### Implementation

- **GetX Translations** — 150+ translation keys in `lib/core/services/localizition/`
- **Language Switching** — Available in profile page, persisted to Hive
- **Default Language** — Arabic (`"ar"`)
- **RTL Awareness** — Layout adjustments based on `Get.locale?.languageCode`

### Usage

```dart
Text('lblOffers'.tr)  // Resolves to current locale string
```

---

## 🗺️ Maps

### Dual Map Provider

| Provider | Use Case |
|----------|----------|
| **Google Maps** | Store location display, external map opening |
| **OpenStreetMap (flutter_map)** | Nearby offers/stores map view with custom markers |

### Location Services

- **GPS** — Primary location source via `geolocator`
- **IP Fallback** — Falls back to IP-based geolocation when GPS unavailable
- **Reactive** — Lat/lng updates propagate through GetX observables

### Map Features

- Custom store markers with popup details
- Marker clustering for dense areas
- "Open in Google Maps" for directions
- Location picker for store creation

---

## 📡 Networking

### Dio Configuration

- **Base URL:** `http://yemeni-offers.com/api/`
- **Timeouts:** 5000ms connect, 5000ms receive
- **Auth Interceptor:** Automatically attaches `Bearer <token>` to every request

### API Modules

| Module | Endpoints |
|--------|-----------|
| **Auth** | Login, register, OTP, password reset, Google OAuth, logout |
| **Profile** | User/merchant profile, password change |
| **Stores** | CRUD for merchant stores |
| **Offers** | CRUD for merchant offers |
| **Browse** | Categories, offer categories, stores, offers, nearby, latest, popular |
| **Search** | Vector text search, image search |
| **Favorites** | Save/remove/list favorites |
| **Recommendations** | Behavior-based offer recommendations |
| **Notifications** | FCM token management, notification list |

---

## 📋 User Experience

### Loading States

- **Shimmer Skeletons** — 8 skeleton widgets for offer cards, categories, images, and lists
- **Circular Progress Indicators** — Page-level loading for detail screens
- **RxBool Flags** — Every controller has loading state observables

### Form Validation

15+ validators in `lib/core/utils/validators.dart`:
- Email format validation
- Password strength (min length, complexity)
- Phone number (Yemeni prefixes: 77, 78, 73, 70, 71)
- URL and social media link validation
- Latitude/longitude format
- Address validation
- All messages localized in Arabic and English

### Empty States

- No internet page with illustration and retry
- Category/offer list pages handle empty results

### Smooth Navigation

- Named route navigation with GetX
- Route middlewares for onboarding flow
- Deep link handling for external entry points

---

## 🏭 Engineering Highlights

| Practice | Implementation |
|----------|----------------|
| **Clean Architecture** | Three-layer separation (presentation/domain/data) per feature |
| **Feature-first Organization** | Each feature is self-contained with its own layers |
| **Repository Pattern** | Abstract interfaces in domain, implementations in data |
| **Dependency Injection** | GetX bindings with singleton and lazy registration |
| **Functional Error Handling** | `Either<Failure, T>` with typed failure hierarchy |
| **Reactive State Management** | GetX `.obs` types with `Obx` widget bindings |
| **Centralized Constants** | API endpoints, cache keys, assets, enums in dedicated files |
| **Reusable Widgets** | 18+ shared widgets in `core/common/presentation/widgets/` |
| **Interceptor-based Auth** | Automatic JWT token attachment via Dio interceptor |
| **Persistent Preferences** | Theme, language, and auth state persisted via Hive |
| **Localization** | Full Arabic/English support with RTL awareness |
| **Modular Services** | Location, theme, network, notifications as independent services |

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

> **Note:** Test infrastructure is in place. Unit and widget tests should be added for each feature module.

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
