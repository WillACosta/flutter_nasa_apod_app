### @flutter_nasa_apod_app

This application provides a showcase of using NASA's APOD (Astronomic Picture of The Day) API to show awesome pictures of the universe, made with Dart/Flutter 💙. Here you'll find concepts such as Clean Architecture, Clean Code, SOLID, and other things related to the best coding practices.

#

- **[Features and Architecture](#features-and-architecture)**
- **[Technical Resources](#technical-resources)**
- **[Getting Started](#getting-started)**

<br>

![Screenshot showing app pages](docs/images/screenshots.png "Screenshot showing app pages")

<br>
<br>

## Features and Architecture

The project has only one main feature called: `:feature_media`, which holds the business rule for retrieving media items from NASA's Open API and handling the results accordingly. You can find out more details in the next section.

![An image of app feature flow](docs/images/apod_flow.png "An image of app feature flow")

## App Modularization Guide

This project uses a modularization approach with mono-repo, to organize
and breaking the concept of monolithic into loosely coupled, self-contained
modules.

![A module graph of project](docs/images/apod_modules.png "A module graph of project")

Here we have the following types of modules:

- The `app` module - is the main entry point for the app and contains some app-level
  configuration.

- `feature` modules - contains specific modules which have a single responsibility
  and it follows Clean Architecture's approach.

- `core` modules - common library modules and specific dependencies that need to be
  shared between other modules in the app. These modules can be dependent on another core modules, but they shouldn’t depend on feature or app modules.

All these modules are managed by Melos CLI, with this tool, we have more control
over the dependencies in the entire project and we able to execute common tasks in all modules
at the same time -- [know more about Melos here](https://melos.invertase.dev/).
You can find, some scripts that are used by the project on `melos.yaml` file in the
root directory.

As mentioned above, the project uses a mono-repo approach to organize all
the modules, this means that all the necessary modules exist inside this repository.
As you can see below:

```
.
├── apps
│   └── apod
│
├── packages
│  ├── core
│  ├── feature
│  └── ui
│
└── melos.yaml
```

<br>

# Technical Resources

- Usage of a simple state management with `Value Notifier`
- Clean architecture, SOLID, and mono-repo concepts
- Usage of package `Result` for handling errors and success cases
- Lazy Loading for Infinity Scroll
- Offline storage with Shared Preferences (caching)
- Usage of Google Fonts (Poppins) for custom UIs
- CI workflow with GitHub Actions
- Melos CLI for management of mono-repo packages

<br>

# Getting Started

1. First you need to set up Flutter SDK. The project uses `FVM CLI` to manage flutter versions.

- Install FVM globally (macOS)

```shell
brew tap leoafarias/fvm
brew install fvm
```

- Install the compatible version for this project, which you can find in this directory `.fvm/fvm_config.json`

```shell
fvm install 3.19.3
```

- Set the installed version as global

```shell
fvm global 3.19.3
```

- Add the Flutter SDK path in your terminal config file `.zshrc` or `.bashrc`

```shell
export PATH=$PATH:~/fvm/default/bin
```

2. Clone this repository

```shell
git clone https://github.com/WillACosta/cloudwalk-mobile-test
```

3. Install `Melos CLI` as a global package with:

```shell
dart pub global activate melos
```

4. Use the following command to setup the application

```shell
melos bootstrap
```

5. Go to the directory `apps/apod` and run the following command, to get a copy for `.env` file, and fill it with your credentials.

```shell
cd apps/apod
cp .env.example .env
## open the file and add your API KEY (Get on https://api.nasa.gov/)
```

6. Now, you have to install Android and iOS SDK

- [iOS SDK/Xcode](https://developer.apple.com/xcode/)
- [Android SDK/Android Studio](https://developer.android.com/studio/install)

7. Open any available emulators and run the application with

```shell
flutter run
```

## Running unit tests

1. Run all tests

```shell
melos test
```

You can find more scripts to execute in `melos.yaml` file.

## Usage of JSON Server

In the case of NASA's Open API is not available, you can use the [Json Server](https://github.com/typicode/json-server) for testing purposes.

- First of all, you need to setup the NodeJS environment -- see here: https://nodejs.org/en/download

- After that, navigate to the json-api directory: `/api` and run:

```shell
npx json-server database.json
```

- Then you will need to change the APOD_BASE_URL from `.env` file,
  for using the local server address, for example:

```
http://localhost:3000
```
