// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRecipeQuery _$ApiRecipeQueryFromJson(Map<String, dynamic> json) =>
    ApiRecipeQuery(
      query: json['q'] as String,
      from: json['from'] as int,
      to: json['to'] as int,
      more: json['more'] as bool,
      hits: (json['hits'] as List<dynamic>)
          .map((e) => APIHits.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$ApiRecipeQueryToJson(ApiRecipeQuery instance) =>
    <String, dynamic>{
      'q': instance.query,
      'from': instance.from,
      'to': instance.to,
      'more': instance.more,
      'count': instance.count,
      'hits': instance.hits,
    };

APIHits _$APIHitsFromJson(Map<String, dynamic> json) => APIHits(
      recipe: APIRecipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$APIHitsToJson(APIHits instance) => <String, dynamic>{
      'recipe': instance.recipe,
    };

APIRecipe _$APIRecipeFromJson(Map<String, dynamic> json) => APIRecipe(
      calories: (json['calories'] as num).toDouble(),
      image: json['image'] as String,
      url: json['url'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => APIIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalTime: (json['totalTime'] as num).toDouble(),
      totalWeight: (json['totalWeight'] as num).toDouble(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$APIRecipeToJson(APIRecipe instance) => <String, dynamic>{
      'label': instance.label,
      'image': instance.image,
      'url': instance.url,
      'ingredients': instance.ingredients,
      'calories': instance.calories,
      'totalWeight': instance.totalWeight,
      'totalTime': instance.totalTime,
    };

APIIngredient _$APIIngredientFromJson(Map<String, dynamic> json) =>
    APIIngredient(
      name: json['text'] as String,
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$APIIngredientToJson(APIIngredient instance) =>
    <String, dynamic>{
      'text': instance.name,
      'weight': instance.weight,
    };
