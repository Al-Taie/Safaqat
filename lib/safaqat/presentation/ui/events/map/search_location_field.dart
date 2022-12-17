import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';

class LocationSearchField extends StatelessWidget {
  final LocationController controller;
  final ValueChanged<PlacesSearchResult>? onPlaceSelected;

  const LocationSearchField({
    super.key,
    required this.onPlaceSelected,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.15),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: Get.width,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: textController,
              textInputAction: TextInputAction.search,
              autofocus: true,
              onSubmitted: (query) {
                var result = controller.findInSearchResults(query);
                if (result != null) {
                  onPlaceSelected?.call(result);
                  Get.back();
                }
              },
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                hintText: AppStrings.search,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(style: BorderStyle.none, width: 0),
                ),
                hintStyle: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).disabledColor,
                    ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    fontSize: 16,
                  ),
            ),
            suggestionsCallback: (query) async {
              controller.placeSearch(query: query);
              return controller.searchResults;
            },
            itemBuilder: (context, PlacesSearchResult suggestion) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: AppColors.primaryColor),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        suggestion.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
            onSuggestionSelected: (PlacesSearchResult suggestion) {
              onPlaceSelected?.call(suggestion);
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
