import 'package:json_annotation/json_annotation.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class ApiRecipeQuery {
  ApiRecipeQuery({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.hits,
    required this.count,
  });

  factory ApiRecipeQuery.fromjson(Map<String, dynamic> json) => _$ApiRecipeQueryFromJson(json);

  Map<String, dynamic> tojson() => _$ApiRecipeQueryToJson(this);

  @JsonKey(name: 'q')
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<APIHits> hits;
}

// Marks the class serializable.
@JsonSerializable()
class APIHits {
  APIRecipe recipe;
  APIHits({required this.recipe});

// adds the methods for JSON serialization.
  factory APIHits.fromjson(Map<String, dynamic> json) => _$APIHitsFromjson(json);

  Map<String, dynamic> toJson() => _$APIHitToJson(this);
}

@JsonSerializable()
class APIRecipe {
  // Define the fields for a recipe. label is the text shown and
  // image is the URL of the image to show.
  String label;
  String image;
  String url;

  // State that each recipe has a list of ingredients
  List<APIIngredient> ingredients;
  double calories;
  double totalWeight;
  double totalTime;
  APIRecipe({
    required this.calories,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.totalTime,
    required this.totalWeight,
    required this.label,
  });

// Create the factory methods for serializing JSON
  factory APIRecipe.fromjson(Map<String, dynamic> json) => _$APIRecipeFromJson(json);
  Map<String, dynamic> tojson() => _APIRecipeToJson(this);
}

// Added a helper method to turn a calorie into a string.
String getCalories(double? calories) {
  if (calories == null) {
    return '0 KAL';
  }
  return "${calories.floor()} KCAL";
}

// Add a helper method to turn a weight into a string.
String getWeight(double? weight) {
  if (weight == null) {
    return '0 g';
  }
  return "${weight.floor()} g";
}

@JsonSerializable()
class APIIngredient {
  @JsonKey(name: 'text')
  String name;
  double weight;

  APIIngredient({required this.name, required this.weight});

  factory APIIngredient.fromJson(Map<String, dynamic> json) => _$APIIngredientFromJson(json);
  Map<String, dynamic> tojson() => _$APIIngredientToJson(this);
}
