// this is your navigation state object
// it is the intermeidiary btw a "URL string" and your "app state"
/*
AppLink is an object that helps store the route information. It helps to parse 
the URL string to a route and vice versa, converting the route information back
to a URL string. It essentially encapsulates all the logic that transforms a 
simple string into a state and back 
*/
class Applink {
  // constants for each URL path
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/Onboarding';
  static const String kLoginPath = '/Login';
  static const String kProfilePath = '/Profile';
  static const String kItemPath = '/Item';
  // constants for each of the query parameters you’ll support
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';

// Store the path of the URL using location
  String? location;

  // Use currentTab to store the tab you want to redirect the user to
  int? currentTab;

  // Store the ID of the item you want to view in itemId
  String? itemId;

  // initialize the app link with the location and the two query parameters
  Applink({this.location, this.currentTab, this.itemId});

  // from location
  static Applink fromLocation(String? location) {
    // decode the URL. URLs often include special characters in their  paths, so
    //you need to percent-encode the URL path. For example, you’d encode
    //hello!world to hello%21world
    location = Uri.decodeFull(location ?? '');
    // Parse the URI for query parameter keys and key-value pairs.
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    // Extract the currentTab from the URL path if it exists
    final currentTab = int.tryParse(params[Applink.kTabParam] ?? '');
    // Extract the itemId from the URL path if it exists
    final itemId = params[kIdParam];

    // Create the AppLink by passing in the query parameters you extract from
    //the URL string.
    final link = Applink(
      currentTab: currentTab,
      itemId: itemId,
      location: uri.path,
    );
    // Return the instance of AppLink
    return link;
  }

  //  toLocation
  String toLocation() {
    // Create an internal function that formats the query parameter key-value
    //pair into a string format
    String addKeyVAlPair({required String key, String? value}) {
      return value == null ? '' : '$key=$value&';
    }

// Go through each defined path.
    switch (location) {
      // If the path is kLoginPath, return the right string path: /login
      case kLoginPath:
        return kLoginPath;

      // If the path is kOnboardingPath, return the right string path: /onboarding.
      case kOnboardingPath:
        return kOnboardingPath;

      // If the path is kProfilePath, return the right string path: /profile.
      case kProfilePath:
        return kProfilePath;

      // If the path is kItemPath, return the right string path: /item, and
      //if there are any parameters, append ?id=${id}.
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyVAlPair(
          key: kIdParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);

// If the path is invalid, default to the path /home. If the
//user selected a tab, append ?tab=${tabIndex}.
      default:
        var loc = '$kHomePath?';
        loc += addKeyVAlPair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(loc);
    }
  }
}
