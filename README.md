# Flutter environment build using devenv.sh

Thanks to the amazing work from the [devenv.sh](https://devenv.sh/integrations/android/#emulators) team (thanks Domen!) it is now easy to get a good working flutter environment up in NixOS.

With devenv being usable for other OSes (once nix is installed) it could be a low friction approach for other OSes to use to (untested).

This environment provides a working environment that will give you the following result from flutter doctor (as per the current date of writing this [Jul 2024]).

I tested this from NixOS - but it should work from nix with devenv on other OSes as well.

```bash
➜  flutter flutter doctor
Doctor summary (to see all details, run
flutter doctor -v):
[✓] Flutter (Channel stable, 3.19.0, on
    NixOS 24.11 (Vicuna) 6.6.39, locale
    en_NZ.UTF-8)
[✓] Android toolchain - develop for
    Android devices (Android SDK version
    33.0.2)
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux
    desktop
[!] Android Studio (not installed)
[✓] Connected device (2 available)
[✓] Network resources

```

For further notes refer to the [devenv.sh](https://devenv.sh/integrations/android/#emulators) and [flutter documentation](https://docs.flutter.dev/)

# When in the instantiated devenv shell

```bash
# create an android emulator
avdmanager create avd -n android-simple -k "system-images;android-32;google_apis_playstore;x86_64"

# run the emulator
emulator -avd android-simple

# enable web if you are going to use flutter for web dev
flutter config --enable-web

# start your editor
codium .
```
## VS code extensions

I used the following 2

- vscode-marketplace.dart-code.flutter
- vscode-marketplace.dart-Code.dart-code

## Once in VS code

Creating a quick "Hello World" Flutter app and checking if your environment is working properly involves a few steps. 

Open VS Code:

1. Ensure you have the Flutter and Dart extensions installed in VS Code.
1. Create a New Flutter Project:
    - Open the Command Palette by pressing Ctrl+Shift+P (Windows/Linux) or Cmd+Shift+P (Mac).
    - Type Flutter: New Project and select it.
    - Choose Application to create a new Flutter application.
    - Select a directory where you want to create the project.
    - Enter a project name, for example, hello_world.
1. Navigate to the Project Directory:
    - edit lib/main.dart
1. Run the App with F5 in debugging:

If everything is set up correctly, your app should launch in the emulator, and you should see a screen with your changes
