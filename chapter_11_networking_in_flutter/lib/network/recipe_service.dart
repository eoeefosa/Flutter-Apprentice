// import HTTP package
import 'package:http/http.dart';

// add constants that you'll use when calling the Apis

const String apiKey = 'b426e5ec';
const String apiId = "e197f6eb492a00e1e94acbfaaba87e3e";
const String apiUrl = 'http://api.edamam.com/search';

// class and function to get the data from the API
class RecipeService {
  Future getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
  // TODO: Add getRecipes
}
