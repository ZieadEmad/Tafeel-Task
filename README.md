# Tafeel-Task

# 🧑‍💻 Flutter Users List App

A simple but well-architected Flutter application that connects to a mock API to fetch and display a paginated list of users. Users can be selected to view detailed information on a separate screen. This app showcases clean architecture, layered design, and reactive state management using flutter_bloc.


# 📋 Task Overview

Objective:
Build a Flutter app that:

Fetches users from a mock API (https://reqres.in/api/users)
Implements infinite scrolling to load more users as the user scrolls
Shows user details on a separate screen when a user is tapped


# 🏗️ App Architecture

The app follows a clean architecture pattern with separation of concerns between layers:

lib/
├── business_layer/                # State management (Cubit/Bloc logic)
│
├── core_layer/                   # Core utilities used across the app
│   ├── constants/                # App-wide constants
│   ├── extensions/               # Dart/Flutter extensions
│   └── helpers/                  # General helper functions
│
├── data_layer/                   # Data models and local data handling
│   ├── data_models/              # User and API response models
│   └── local/                    # Local storage (e.g., SharedPreferences)
│
├── domain_layer/                 # API interaction and endpoints
│   ├── end_points/               # API route definitions
│   ├── local_source/             # Local data abstraction (from shared/local)
│   └── remote_source/            # API calls and remote data access
│
├── presentation_layer/           # UI components
│   ├── screens/                  # Full app screens (list view, details)
│   └── widgets/                  # UI components
│       ├── screens_widgets/      # Widgets specific to a certain screen
│       └── shared_widgets/       # Reusable UI components
│
└── main.dart                     # App entry point


# 🔌 API Endpoints

Functionality	Endpoint	Method	Notes
Get Users List	https://reqres.in/api/users?page=1	GET	Returns a JSON array
Get Single User	https://reqres.in/api/users/{userId}	GET	Returns a single JSON object with user details


# 💡 Features

✅ Fetch and display list of users
✅ Infinite scroll to load more users
✅ Tap on a user to view full details
✅ Responsive and clear UI/UX
✅ Proper state management with flutter_bloc
✅ Efficient image loading with caching


# 🚀 Getting Started

Prerequisites
Flutter SDK: 3.24.3


Installation

Clone the repository: 
git clone https://github.com/ZieadEmad/Tafeel-Task.git
cd Tafeel-Task

Get dependencies:
flutter pub get

Run the app:
flutter run


# 📦 Dependencies

Package	Usage
flutter_bloc --	State management
dio	-- HTTP requests
cached_network_image --	Cached image loading
shared_preferences --	Local storage (if needed)
conditional_builder_null_safety -- Conditional widget building
path_provider --	Platform directory paths


