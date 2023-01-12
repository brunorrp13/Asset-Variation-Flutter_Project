# flutter_variacao_do_ativo

App de consulta a API do Yahoo Finance https://finance.yahoo.com/. O App foi feito em Flutter e possui um TextField do qual permite a digitação de um ativo. Caso o ativo seja válido, ele trás o preço do ativo dos últimos 30 dias com o percentual de variação de preço de um dia para o outro e o percentual desde o primeiro pregão apresentado. Caso o nome do ativo digitado não seja válido, uma mensagem é exibida por Toast informando que o ativo não foi localizado. Foi utilizado AppLocalizations para as Strings utilizadas (que estão em português e traduzidas para o inglês também) e o Bloc Pattern.

# Cenário positivo:

<img width="456" alt="image" src="https://user-images.githubusercontent.com/69281497/211948917-609913fe-7c80-490d-9b62-ed3ab10cb06f.png">

# Cenário negativo:

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
