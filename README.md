# Flutter To-Do App

## Version 1.0

This is a simple To-Do app built with Flutter. It allows users to add tasks, mark them as completed, and delete tasks. The app uses [Hive](https://pub.dev/packages/hive) as the local database to maintain data across sessions, providing persistent storage even when the app is closed.

## Features

- **Add To-Do**: Add a new task to the list.
- **Mark as Completed**: Mark a task as completed by tapping on it.
- **Delete To-Do**: Remove tasks from the list when they are no longer needed.
- **Persistent Storage**: All tasks are stored locally using Hive, ensuring that data remains intact across app sessions.

## Installation

### Prerequisites

- Flutter SDK (>=3.5.1)
- Hive (>=2.2.3)

### Clone the Repository

```sh
git clone https://github.com/agrpaavan/flutter-chat-app.git
cd chat-app
```

### Install Dependencies

```sh
flutter pub get
```

### Configuration

**Create `key.properties` File**:

- You will need this when you build your app to sign the APK.
- Inside the `android/` folder, create a file named `key.properties`.
- Add your keystore configuration details to `key.properties`. Replace the placeholders with your actual keystore information:

```properties
storePassword=YOUR_KEYSTORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=upload
storeFile=C:\\Users\\paava\\upload-keystore.jks
```

### Run the App

Connect an Android or IOS device or start an emulator, then run:

```sh
flutter run
```

## APK Download and Installation

You can download the latest APK file from the [Releases](https://github.com/agrpaavan/flutter-todo-app/releases) section of this repository.

### Installation Instructions

1. **Download the APK**:
   - Go to the [Releases page](https://github.com/agrpaavan/flutter-chat-app/releases) and download the latest APK file.

2. **Install the APK**:
   - Ensure that installation from unknown sources is enabled on your device:
     - Go to `Settings` > `Security` > `Install unknown apps` and enable the option for your file manager or browser.
   - Open the downloaded APK file on your device and follow the prompts to install the app.

## Contributing

Feel free to fork this repository and make improvements or suggest features!

1. Fork the repository.
2. Create a new branch for your changes.
3. Commit your changes and push to your branch.
4. Open a pull request to merge your changes.

## Issues

If you encounter any issues or have suggestions, please use the [Issue Tracker](https://github.com/agrpaavan/flutter-todo-app/issues) to report them.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/AgrPaavan/flutter-todo-app/blob/main/LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) - The framework used for building this app.
- [Material Design](https://material.io/design) - Design system used for UI components.
- **Tutorial**: This project was created following the tutorial by Mitch Koko. You can watch the tutorial [here](https://www.youtube.com/watch?v=mMgr47QBZWA).
