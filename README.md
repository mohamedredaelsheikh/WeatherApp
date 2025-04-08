# Weather App

A Flutter-based weather application that allows users to check the weather for any city by entering its name. The app includes user authentication (login and registration) using Firebase Authentication, and provides a clean and dynamic UI to display weather information.

## Features
- **Weather Search**: Search for weather information by entering a city name.
- **Dynamic UI**: Displays weather details (temperature, condition, etc.) with a dynamic AppBar color based on weather conditions.
- **User Authentication**: Login and register using email and password with Firebase Authentication.
- **Loading Indicators**: Shows a loading indicator while fetching weather data.
- **Custom Fonts**: Uses the `Pacifico` font for a unique UI style.
- **Multi-Platform Support**: Works on Android, iOS, and Web.


## Prerequisites
Before running the app, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.2.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- [Firebase CLI](https://firebase.google.com/docs/cli) (for Firebase setup)
- An active internet connection to fetch weather data and use Firebase services.

## Installation and Setup

### 1. Clone the Repository
Clone the project to your local machine:

git clone <https://github.com/mohamedredaelsheikh/WeatherApp.git>
cd Weather_app

2. Install Dependencies
Run the following command to install the required packages:
flutter pub get
Setup Firebase
The app uses Firebase for user authentication. Follow these steps to set up Firebase:

#Create a Firebase project in the Firebase Console.
Add your app (Android, iOS, Web) to the Firebase project.
Download the google-services.json (for Android) or GoogleService-Info.plist (for iOS) and place them in the appropriate directories:
For Android: android/app/
For iOS: ios/Runner/
For Web, ensure the Firebase configuration is added in web/index.html (if required).
Run the following command to configure Firebase for your Flutter app:
flutterfire configure

4. Configure Weather API
The app uses a weather API to fetch data (via the http package). You need to:

Sign up for a weather API service (e.g., OpenWeatherMap) and get an API key.
Add the API key to the WeatherService class in lib/features/home/data/remote_data_source/services/weather_service.dart. (Update the API key in the code where the HTTP request is made.)

5. Run the App
Connect a device, emulator, or browser, then run:
flutter run

Weather_app/
├── lib/
│   ├── core/                           # Constants and utilities
│   │   └── show_snack_bar.dart         # Utility for showing SnackBar
│   ├── features/                       # Feature modules
│   │   ├── Auth/                       # Authentication feature
│   │   │   ├── presentation/           # UI and logic for Auth
│   │   │   │   ├── manager/            # BLoC for Auth
│   │   │   │   │   └── AuthBloc/       # AuthBloc, events, and states
│   │   │   │   ├── views/              # Auth screens (Login, Register)
│   │   │   │   └── widgets/            # Reusable widgets (CustomButton, CustomTextField)
│   │   └── home/                       # Weather feature
│   │       ├── data/                   # Data layer
│   │       │   ├── models/             # Data models (WeatherModel)
│   │       │   └── remote_data_source/ # API services
│   │       │       └── services/       # WeatherService for API calls
│   │       ├── presentation/           # UI and logic for Weather
│   │       │   ├── manager/            # Cubit for Weather
│   │       │   │   └── cubits/         # WeatherCubit and states
│   │       │   ├── views/              # Weather screens (HomeView, SearchView)
│   │       │   └── widgets/            # Reusable widgets (WeatherInfoBody, NoWeatherInfoBody)
│   ├── firebase_options.dart           # Firebase configuration
│   └── main.dart                       # Entry point of the app
├── android/                            # Android-specific files
├── ios/                                # iOS-specific files
├── web/                                # Web-specific files (e.g., index.html)
└── pubspec.yaml                        # Dependencies and project metadata


#Dependencies
The app uses the following packages:

flutter_bloc: ^8.1.3 - For state management.

firebase_core: ^3.13.0 - For Firebase integration.

firebase_auth: ^5.5.2 - For user authentication.

http: ^1.1.2 - For making API requests to fetch weather data.

modal_progress_hud_nsn: ^0.5.1 - For showing loading indicators.



simple_circular_progress_bar: ^1.0.2 - For custom loading indicators.

cupertino_icons: ^1.0.2 - For iOS-style icons.

##Supported Platforms
Android: Fully supported.

iOS: Fully supported.

Web: Supported, but may require additional setup for index.html (see Flutter Web Initialization).

#Additional Notes

Weather API: The app fetches weather data using the http package. Ensure you have a valid API key and configure it in WeatherService. The app currently uses a placeholder API; replace it with your preferred 
weather API (e.g., OpenWeatherMap).

Firebase Setup: If you encounter issues with Firebase, ensure the Firebase CLI is installed and configured properly. Run flutterfire configure to regenerate the firebase_options.dart file if needed.

Web Support: For web builds, ensure flutter.js is loaded correctly in web/index.html. If you face issues like _flutter is not defined, check the index.html file and ensure the build is clean (flutter clean then flutter build web).

Fonts: The app uses the Pacifico font, which is included in the assets/fonts/ directory.
##Contributing

Feel free to fork the repository, make changes, and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.
