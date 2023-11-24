# flutter_hive

This is an example for implementing hive in Flutter

## Installation

- ### Install packages

  ```bash
      flutter pub get
  ```

- ### Generate command

  1. Generate dependencies file, model, third party.

  ```bash
     dart run build_runner build
  ```

  if there are some conflict files you can solve by this command:

  ```bash
      dart run build_runner build --delete-conflicting-outputs
  ```

## Packages for hive implementation in this project

- ### hive

  Lightweight and blazing fast key-value database written in pure Dart. [more info](https://pub.dev/packages/hive).

- ### hive_flutter

  Extension for Hive. Makes it easier to use Hive in Flutter apps. [more info](https://pub.dev/packages/hive_flutter)

- ### hive_generator
  Extension for Hive. Automatically generates TypeAdapters to store any class. [more info](https://pub.dev/packages/hive_generator)

- ### build_runner
  Providing a concrete way of generating files using Dart code. [more info](https://pub.dev/packages/build_runner)