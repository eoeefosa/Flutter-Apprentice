// import HTTP package
import 'package:http/http.dart';

// add constants that you'll use when calling the Apis

const String apiKey = 'b426e5ec';
const String apiId = "e197f6eb492a00e1e94acbfaaba87e3e";
const String apiUrl = 'http://api.edamam.com/search';

// class and function to get the data from the API
class RecipeService {
  // getData returns a Future because the API'S returned data type is determined in the future
  Future getData(String url) async {
    // for debugging purpose
    print('Calling url: $url');
    // response doesnt have a value until await is complete
    final response = await get(Uri.parse(url));
    // get fetches data from the provided url
// note Response and get are from HTTP package
// if successful
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
  // getRecipes

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&apiKey=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
