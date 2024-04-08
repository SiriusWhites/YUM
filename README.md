# Yum Recipe App

Yum is a Flutter-based mobile application that helps users manage their pantry ingredients, discover recipes based on available ingredients, and create grocery lists. The app integrates with the Spoonacular API to provide recipe and ingredient data.

## Features

- Ingredient management: Add, edit, and remove pantry ingredients
- Recipe search: Find recipes based on available pantry ingredients
- User preferences: Set dietary restrictions and favorite cuisines
- Grocery list generation: Create grocery lists based on selected recipes
- Spoonacular API integration: Fetch recipe and ingredient data from the Spoonacular API

## Getting Started

To get started with the Yum recipe app, follow these steps:

1. Clone the repository: git clone https://github.com/yourusername/yum-recipe-app.git
2. Change to the project directory: cd yum-recipe-app
3. Install the dependencies: flutter pub get
4. Obtain a Spoonacular API key:
- Visit the [Spoonacular API website](https://spoonacular.com/food-api)
- Sign up for an account and obtain an API key
5. Configure the API key:
- Open the `lib/services/api_constants.dart` file
- Replace `'YOUR_API_KEY'` with your actual Spoonacular API key
6. Run the app: flutter run

## Project Structure

The project follows a modular structure and uses various Flutter packages for enhanced functionality. Here's an overview of the project structure:

- `lib/`: Contains the main Dart code for the app
- `models/`: Data models for ingredients, recipes, grocery lists, and user preferences
- `services/`: Service classes for API communication, data management, and business logic
- `widgets/`: Reusable widget components
- `pages/`: App screens and pages
- `assets/`: Contains app assets such as images
- `fonts/`: Contains custom fonts used in the app

## Dependencies

The Yum recipe app relies on the following dependencies:

- `flutter`: The Flutter SDK
- `http`: For making HTTP requests to the Spoonacular API
- `image_picker`: For picking images from the device's gallery or camera
- `provider`: For state management
- `shared_preferences`: For persisting user preferences and data locally
- `json_annotation` and `json_serializable`: For JSON serialization and deserialization
- `intl`: For internationalization and localization
- `collection`: For additional collection utilities
- `cached_network_image` and `flutter_cache_manager`: For caching network images
- `url_launcher`: For launching URLs

## Contributing

Contributions to the Yum recipe app are welcome! If you find any bugs, have feature requests, or want to contribute improvements, please open an issue or submit a pull request.

## License

The Yum recipe app is open-source software licensed under the [MIT License](LICENSE).

## Contact

If you have any questions, suggestions, or feedback, feel free to contact the project maintainer:

- Name: [Adam Fakirni]
- Email: [aj.fakirni@gmail.com]
- GitHub: [SiriusWhites]
