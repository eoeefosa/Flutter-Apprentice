import 'package:flutter/material.dart';
import 'applink.dart';

// AppRouteParser extends RouteInformationParser.it takes a generic type. In
//this case, your type is AppLink, which holds all the route and navigation
//information
class AppRouteParser extends RouteInformationParser<Applink> {
  // The first method you need to override is parseRouteInformation(). The
  // route information contains the URL string
  @override
  Future<Applink> parseRouteInformation(RouteInformation routeInformation) //
  async {
    // Take the route information and build an instance of AppLink from it.
    final link = Applink.fromLocation(routeInformation.location);
    return link;
  }

// The second method you need to override is restoreRouteInformation()
  @override
  RouteInformation? restoreRouteInformation(Applink applink) {
    // This function passes in an AppLink object. You ask AppLink to give you
    //back the URL string
    final location = applink.toLocation();
    // You wrap it in RouteInformation to pass it along
    return RouteInformation(location: location);
  }
}
