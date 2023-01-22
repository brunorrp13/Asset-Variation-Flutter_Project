# Assets Variation - Flutter App

Yahoo Finance API assets variation app (https://finance.yahoo.com/). The App was made in Flutter and has a TextField which allows typing of an asset. If the asset is valid, it brings the price of the asset for the last 30 days with the percentage of price variation from one day to the next and the percentage since the first trading session presented. If the name of the asset entered is not valid, a message is displayed by Toast informing that the asset was not found. AppLocalizations were used for the Strings used (which are in Portuguese and also translated into English) and it also uses the Bloc Pattern (with a test class that I also created for it).

# Main Screen:

<img width="448" alt="image" src="https://user-images.githubusercontent.com/69281497/213923770-2010cb1a-0be8-4226-a931-8f3e0f7b3863.png">


# Positive scenario:

<img width="451" alt="image" src="https://user-images.githubusercontent.com/69281497/211949139-213cb6ff-69c3-44c4-851e-620816762ac2.png">

# Negative scenario:

<img width="442" alt="image" src="https://user-images.githubusercontent.com/69281497/211948994-131d25b4-3108-414e-99bf-659efcda970c.png">

# Loading:

<img width="464" alt="image" src="https://user-images.githubusercontent.com/69281497/211948973-c9790dfc-37b6-49ea-b74c-963eb0e71393.png">


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
