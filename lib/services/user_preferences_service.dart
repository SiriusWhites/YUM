class UserPreferencesService {
  List<String> _dietaryRestrictions = [];
  List<String> _favoriteCuisines = [];
  int _defaultServings = 4;

  List<String> get dietaryRestrictions => _dietaryRestrictions;
  List<String> get favoriteCuisines => _favoriteCuisines;
  int get defaultServings => _defaultServings;

  void setDietaryRestrictions(List<String> restrictions) {
    _dietaryRestrictions = restrictions;
  }

  void setFavoriteCuisines(List<String> cuisines) {
    _favoriteCuisines = cuisines;
  }

  void setDefaultServings(int servings) {
    _defaultServings = servings;
  }
}