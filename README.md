# Todoist with Flutter, Firebase, and GetX MVC

## Overview

This project is a simple Todo app, Todoist. It's built using Flutter for the frontend, Firebase for the backend, and GetX for state management,MVC Architecture

## Prerequisites

- Flutter SDK
- Dart SDK
- Firebase account
- An IDE like VS Code or Android Studio

## Setup Instructions

1. **Clone the repository**
   - Open your terminal and run: `git clone https://github.com/Harshit2756/todoist.git`

2. **Navigate into the project directory**
   - Run: `cd todoist`

3. **Get Flutter packages**
   - Run: `flutter pub get`

4. **Setup Firebase**
   - Go to the Firebase console and create a new project.
   - Follow the instructions to add Firebase to your Flutter app for both Android and iOS.
   - Enable Email/Password authentication in the Firebase console under the Authentication section.
   - Create a Firestore database.

5. **Run the app**
   - Run: `flutter run`

## Features

- User Authentication (Login/Register)
- Task CRUD operations
- Realtime updates with Firestore

## Project Structure

The project follows the MVC pattern with GetX. The `controllers` directory contains all the controllers for the app. The `models` directory contains the data models. The `views` directory contains the UI of the app.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
