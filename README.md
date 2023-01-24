# Assets Variation - Flutter App

Yahoo Finance API assets variation app (https://finance.yahoo.com/). The App was made in Flutter and has a TextField which allows typing of an asset. If the asset is valid, it brings the price of the asset for the last 30 days with the percentage of price variation from one day to the next and the percentage since the first trading session presented. If the name of the asset entered is not valid, a message is displayed by Toast informing that the asset was not found. AppLocalizations were used for the Strings used (which are in Portuguese and also translated into English) and it also uses the Bloc Pattern (with a test class that I also created for it).

# Main Screen:

<img width="439" alt="image" src="https://user-images.githubusercontent.com/69281497/214378681-82d420b8-e87f-437f-931a-7d4f2fb00d36.png">

# Loading:

<img width="445" alt="image" src="https://user-images.githubusercontent.com/69281497/214378745-9ee229ff-fbc5-4e0d-a4ca-9158af9ba99e.png">

# Positive scenario:

<img width="443" alt="image" src="https://user-images.githubusercontent.com/69281497/214378814-554e24f4-bfc5-4d42-b875-5e12887a7edd.png">

# Negative scenario:

<img width="445" alt="image" src="https://user-images.githubusercontent.com/69281497/214378901-0223acd6-b455-4cb5-9c4e-559bddb9eac5.png">

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
