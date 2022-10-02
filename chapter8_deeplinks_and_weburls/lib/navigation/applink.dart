// this is your navigation state object
// it is the intermeidiary btw a "URL string" and your "app state"
class Applink {
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/Onboarding';
  static const String kLoginPath = '/Login';
  static const String kProfilePath = '/Profile';
  static const String kItemPath = '/Item';
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;
  Applink({this.location, this.currentTab, this.itemId});

  // from location
  static Applink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[Applink.kTabParam] ?? '');
    final itemId = params[kIdParam];
    final link = Applink(
      currentTab: currentTab,
      itemId: itemId,
      location: uri.path,
    );
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
//user selected a tab, sappend ?tab=${tabIndex}.
      default:
        var loc = '$kHomePath?';
        loc += addKeyVAlPair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(loc);
    }
  }
}
