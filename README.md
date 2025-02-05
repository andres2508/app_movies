# Prueba Técnica Rappi Pay: Flutter

La prueba técnica consiste en crear una aplicación móvil en Flutter, con el objetivo de listar películas y series desde
el backend de `https://www.themoviedb.org/`. Además de listar, es necesario ver el detalle de estas y permitir al
usuario buscar películas o series.

### Versiones de Código:

* Flutter 3.27.3 • channel beta
* Dart 3.6.1

## Getting Started:

Para compilar el proyecto, es necesario tener activo un emulador que reconozca la librería de Flutter. Después de tener
activo el emulador, simplemente se ejecuta la siguiente línea de comandos:

```
flutter run --dart-define-from-file=.env/prod_env.json
```

### Environment Files:

El proyecto cuenta con un archivo de configuración para cargar los atributos del ambiente de pruebas o de producción.
Actualmente, el proyecto cuenta con un archivo en la carpeta [.env](.env) que hace referencia al ambiente de producción.
El objetivo es marcar la carpeta `.env` en el `.gitignore`. El archivo de configuración debe tener:

```json
{
  "server": "https://XXXXXXX",
  "image_server": "https://XXXXXX",
  "access_token": "XXXXX",
  "api_key": "XXXXX"
}
```

### Internationalization build:

Para generar los archivos de internacionalización, ejecutar este código.

```
flutter gen-l10n
```

### Json serialize build:

Para crear las clases que transforman los modelos en objetos JSON, se debe ejecutar el siguiente código:

```
flutter pub run build_runner build --delete-conflicting-outputs 
```

### Splash screen compile:

Para compilar el splash screen, se debe ejecutar el siguiente código. Es importante tener en cuenta que este apunta al
archivo de configuración previamente definido.

```
dart run flutter_native_splash:create --path=splash_screen_config.yaml
```

## Funcionalities:

### Home View (Popular and Top Rated):

![home_view.gif](.evidence/home_view.gif)

### Movie o Serie Detail:

![detail_view.gif](.evidence/detail_view.gif)

### Movie o Serie Search:

![search_view.gif](.evidence/search_view.gif)
