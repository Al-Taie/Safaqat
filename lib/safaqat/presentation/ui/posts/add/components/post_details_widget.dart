import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';
import 'package:safaqat/safaqat/presentation/custom_views/autocomplete_textfield.dart';
import 'package:safaqat/safaqat/presentation/custom_views/dropdown_field.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/small_map_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget({
    Key? key,
    required this.title,
    required this.expiryDate,
    required this.onCountryChange,
    required this.onCityChange,
    required this.countries,
    required this.cities,
    required this.onEndChange,
    required this.locationController,
    required this.onPressed,
    required this.onExpansionChanged,
    required this.expanded,
    required this.postTypeFormKey,
    required this.postCategoryFormKey,
    required this.onCategoryChange,
    required this.onTypeChange,
    required this.typeExpanded,
    required this.categoryExpanded,
    required this.onCategoryExpansionChange,
    required this.onTypeExpansionChange,
    this.expiryDateInitialValue,
    this.cityInitialValue,
    this.countryInitialValue,
    this.cameraPosition,
    this.postTypeInitialValue,
    this.postCategoryInitialValue,
    required this.categories,
  }) : super(key: key);

  final String title, expiryDate;
  final ValueChanged<String> onEndChange;
  final bool expanded, typeExpanded, categoryExpanded;
  final ValueChanged<bool> onExpansionChanged,
      onCategoryExpansionChange,
      onTypeExpansionChange;
  final ValueChanged<CountryDto> onCountryChange;
  final ValueChanged<CityDto> onCityChange;
  final ValueChanged<PostType> onTypeChange;
  final ValueChanged<PostCategoryDto> onCategoryChange;
  final List<CountryDto> countries;
  final List<CityDto> cities;
  final List<PostCategoryDto> categories;
  final ValueChanged<LatLng> onPressed;
  final LocationController locationController;
  final GlobalKey<FormState> postTypeFormKey;
  final GlobalKey<FormState> postCategoryFormKey;
  final String? expiryDateInitialValue, cityInitialValue, countryInitialValue;
  final CameraPosition? cameraPosition;
  final PostType? postTypeInitialValue;
  final PostCategoryDto? postCategoryInitialValue;

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: title,
      expanded: expanded,
      onExpansionChanged: onExpansionChanged,
      children: [
        DropdownField<PostType>(
          initialValue: postTypeInitialValue,
          hint: AppStrings.type,
          formKey: postTypeFormKey,
          expanded: typeExpanded,
          onExpansionChanged: onTypeExpansionChange,
          onSelected: (value) => onTypeChange(value),
          items: PostType.items,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        DropdownField<PostCategoryDto>(
          initialValue: postCategoryInitialValue,
          hint: AppStrings.category,
          formKey: postCategoryFormKey,
          expanded: categoryExpanded,
          onExpansionChanged: onCategoryExpansionChange,
          onSelected: (value) => onCategoryChange(value),
          items: categories,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        AutocompleteTextField<CountryDto>(
          hintText: AppStrings.country,
          initialValue: countryInitialValue,
          suggestions: countries,
          onSelected: onCountryChange,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        AutocompleteTextField<CityDto>(
          hintText: AppStrings.city,
          initialValue: cityInitialValue,
          suggestions: cities,
          onSelected: onCityChange,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        SmallMapWidget(
          height: 200,
          width: Get.width,
          controller: locationController,
          onPressed: onPressed,
          cameraPosition: cameraPosition,
        ),
        const SizedBox(height: 8),
        DateTimePicker(
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 5),
          initialDate: DateTime.now(),
          dateMask: 'y-MM-dd',
          initialValue: expiryDateInitialValue,
          decoration: InputDecoration(
            label: Text(expiryDate),
            labelStyle: AppTextStyle.hint,
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            prefixIcon: const Icon(Icons.event),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onChanged: onEndChange,
          onSaved: (val) {
            if (val != null) onEndChange(val);
          },
        ),
      ],
    );
  }
}
