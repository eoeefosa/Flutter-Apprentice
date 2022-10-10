import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_dropdown.dart';
import '../colors.dart';

// recipes
class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  // key
  static const String prefSearchKey = 'previousSearches';

  // controllers
  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();

  // initial data
  List currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];

// initState
  @override
  void initState() {
    super.initState();
    // This loads any previous searches when the user restarts the app.
    getPreviousSearches();
    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final triggerFetchMoreSize = 0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore && currentEndPosition < currentCount && !loading && !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition = min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    // Use the await keyword to wait for an instance of SharedPreferences.
    final pref = await SharedPreferences.getInstance();
    // Check if a preference for your saved list already exists
    if (pref.containsKey(prefSearchKey)) {
      // Get the list of previous searches
      final searches = pref.getStringList(prefSearchKey);
      // If the list is not null, set the previous searches, otherwise initialize an empty list
      if (searches != null) {
        previousSearches = searches;
      } else {
        previousSearches = <String>[];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSearchCard(),
            _buildRecipeLoader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            IconButton(
              // Add onPressed to handle the tap event
              onPressed: () {
                // Use the current search text to start a search.
                startSearch(searchTextController.text);
                // Hide the keyboard by using the FocusScope class.
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              icon: const Icon(Icons.search),
            ),
            const SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    // Add a TextField to enter your search queries
                    child: TextField(
                      decoration: const InputDecoration(border: InputBorder.none, hintText: 'Search'),
                      autofocus: false,
                      // Set the keyboard action to TextInputAction.done. This closes the keyboard
// when the user presses the Done button.
                      textInputAction: TextInputAction.done,
                      // Save the search when the user finishes entering text.
                      onSubmitted: (value) {
                        if (!previousSearches.contains(value)) {
                          previousSearches.add(value);
                          savePreviousSearches();
                        }
                      },
                      controller: searchTextController,
                    ),
                  ),
                  // Create a PopupMenuButton to show previous searches.
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: lightGrey,
                    ),
                    // When the user selects an item from previous searches, start a new search
                    onSelected: (String value) {
                      searchTextController.text = value;
                      startSearch(searchTextController.text);
                    },
                    itemBuilder: (BuildContext context) {
                      // Build a list of custom drop-down menus (see widgets/custom_dropdown.dart)
                      // to display previous searches
                      return previousSearches.map<CustomDropdownMenuItem<String>>((String value) {
                        return CustomDropdownMenuItem<String>(
                          value: value,
                          text: value,
                          callback: () {
                            setState(() {
                              // If the X icon is pressed, remove the search from the previous searches and close
                              // the pop-up menu.
                              previousSearches.remove(value);
                              Navigator.pop(context);
                            });
                          },
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// to perform a search you need to clear any of your variables and save the new search value
  void startSearch(String value) {
    // Tell the system to redraw the widgets by
    //calling setState()
    setState(() {
      // Clear the current search list and reset
      //the count, start and end positions
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      value = value.trim();
      // Check to make sure the search text hasn’t already
      //been added to the previous search list.
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        // Save the new list of previous searches.
        savePreviousSearches();
      }
    });
  }

  Widget _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return Container();
    }
    // Show a loading indicator while waiting for the movies
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
