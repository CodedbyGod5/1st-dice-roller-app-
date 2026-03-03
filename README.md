# Flutter Dice Roller & Advanced Basics

A collection of Flutter learning projects demonstrating mobile app development with Dart.

## Project Overview

This repository contains two Flutter applications:

### 1. **dice_roller** – Interactive Dice Rolling App
A simple, elegant dice roller built with Flutter. Roll two dice simultaneously with smooth rotation animations. Features:
- Clean Material Design UI
- Tap-to-roll on dice or dedicated button
- Animated rotation effect during rolls
- Separated, reusable `Die` widget

### 2. **adv_basics** – Advanced Flutter Concepts  
A reference project exploring Flutter fundamentals and advanced patterns (quiz app with assets, navigation, state management).

## Setup & Run Instructions

### Prerequisites
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK**: Included with Flutter
- **Git**: For version control

### Clone & Install

```bash
# Clone the repository
git clone git@github.com:CodedbyGod5/1st-dice-roller-app-.git
cd flutter_projec

# Install dependencies for both projects
cd dice_roller
flutter pub get
cd ../adv_basics
flutter pub get
cd ..
```

### Run Dice Roller

```bash
cd dice_roller
flutter run
```

### Run Advanced Basics

```bash
cd adv_basics
flutter run
```

### Analyze Code Quality

```bash
flutter analyze
```

## Project Structure

```
flutter_projec/
├── dice_roller/              # Main dice roller app
│   ├── lib/
│   │   ├── main.dart         # App entry point & DiceApp widget
│   │   ├── die.dart          # Reusable Die widget
│   │   └── assets/           # Static images & resources
│   ├── pubspec.yaml          # Dependencies & metadata
│   ├── android/              # Android native code
│   ├── ios/                  # iOS native code
│   ├── web/                  # Web build target
│   ├── linux/                # Linux native code
│   ├── macos/                # macOS native code
│   └── windows/              # Windows native code
│
├── adv_basics/               # Advanced Flutter reference project
│   ├── lib/
│   │   ├── main.dart         # App entry & navigation
│   │   └── assets/
│   ├── pubspec.yaml
│   └── [platform folders]
│
└── README.md                 # This file
```

## Contributing

1. **Create a feature branch:**
   ```bash
   git checkout -b feature/my-feature
   ```

2. **Make your changes** – follow Dart style guidelines:
   - Use meaningful variable names
   - Add docstrings to public APIs
   - Use `const` where applicable (immutability)

3. **Test & analyze:**
   ```bash
   flutter analyze
   flutter test
   ```

4. **Commit with clear messages:**
   ```bash
   git commit -m "feat: add new feature description"
   ```

5. **Push and open a pull request:**
   ```bash
   git push origin feature/my-feature
   ```

## Git Configuration

This project is configured with:
- **User**: nicholas oden
- **Email**: nicholas.oden8@gmail.com


## License

This project is open-source and available for learning and personal use.

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design for Flutter](https://material.io/develop/flutter)
