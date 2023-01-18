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
import 'package:safaqat/safaqat/domain/entities/projects/project_convener_type.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_sector_type.dart';
import 'package:safaqat/safaqat/presentation/custom_views/autocomplete_textfield.dart';
import 'package:safaqat/safaqat/presentation/custom_views/dropdown_field.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/small_map_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';

class ProjectDetailsWidget extends StatelessWidget {
  const ProjectDetailsWidget({
    Key? key,
    required this.title,
    required this.onCountryChange,
    required this.onCityChange,
    required this.countries,
    required this.cities,
    required this.onEndDateChange,
    required this.locationController,
    required this.onPressed,
    required this.onExpansionChanged,
    required this.expanded,
    required this.convenerFormKey,
    required this.sectorFormKey,
    required this.onSectorChange,
    required this.onConvenerChange,
    required this.convenerExpanded,
    required this.sectorExpanded,
    required this.onSectorExpansionChange,
    required this.onConvenerExpansionChange,
    this.cityInitialValue,
    this.countryInitialValue,
    this.cameraPosition,
    this.convenerInitialValue,
    this.sectorInitialValue,
    this.startDateInitialValue,
    this.endDateInitialValue,
    this.actualEndDateInitialValue,
    required this.onStartDateChange,
    required this.onActualEndDateChange,
    required this.onCostChange,
    this.costInitialValue,
    required this.categoryExpanded,
    required this.onCategoryExpansionChange,
    required this.onCategoryChange,
    required this.categories,
    required this.categoryFormKey,
    this.categoryInitialValue,
  }) : super(key: key);

  final String title;
  final ValueChanged<String> onStartDateChange,
      onEndDateChange,
      onActualEndDateChange,
      onCostChange;
  final bool expanded, convenerExpanded, sectorExpanded, categoryExpanded;
  final ValueChanged<bool> onExpansionChanged,
      onSectorExpansionChange,
      onCategoryExpansionChange,
      onConvenerExpansionChange;
  final ValueChanged<CountryDto> onCountryChange;
  final ValueChanged<CityDto> onCityChange;
  final ValueChanged<ProjectConvenerType> onConvenerChange;
  final ValueChanged<ProjectSectorType> onSectorChange;
  final ValueChanged<PostCategoryDto> onCategoryChange;
  final List<CountryDto> countries;
  final List<CityDto> cities;
  final List<PostCategoryDto> categories;
  final ValueChanged<LatLng> onPressed;
  final LocationController locationController;
  final GlobalKey<FormState> convenerFormKey, sectorFormKey, categoryFormKey;
  final String? startDateInitialValue,
      endDateInitialValue,
      actualEndDateInitialValue,
      cityInitialValue,
      countryInitialValue,
      costInitialValue;
  final CameraPosition? cameraPosition;
  final ProjectConvenerType? convenerInitialValue;
  final ProjectSectorType? sectorInitialValue;
  final PostCategoryDto? categoryInitialValue;

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
        DropdownField<ProjectConvenerType>(
          initialValue: convenerInitialValue,
          hint: AppStrings.convener,
          formKey: convenerFormKey,
          expanded: convenerExpanded,
          onExpansionChanged: onConvenerExpansionChange,
          onSelected: (value) => onConvenerChange(value),
          items: ProjectConvenerType.items,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        DropdownField<ProjectSectorType>(
          initialValue: sectorInitialValue,
          hint: AppStrings.sector,
          formKey: sectorFormKey,
          expanded: sectorExpanded,
          onExpansionChanged: onSectorExpansionChange,
          onSelected: (value) => onSectorChange(value),
          items: ProjectSectorType.items,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        DropdownField<PostCategoryDto>(
          initialValue: categoryInitialValue,
          hint: AppStrings.category,
          formKey: categoryFormKey,
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
          initialValue: startDateInitialValue,
          decoration: InputDecoration(
            label: Text(AppStrings.startDate),
            labelStyle: AppTextStyle.hint,
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            prefixIcon: const Icon(Icons.event),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onChanged: onStartDateChange,
          onSaved: (val) {
            if (val != null) onStartDateChange(val);
          },
        ),
        const SizedBox(height: 8),
        DateTimePicker(
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 5),
          initialDate: DateTime.now(),
          dateMask: 'y-MM-dd',
          initialValue: endDateInitialValue,
          decoration: InputDecoration(
            label: Text(AppStrings.endDate),
            labelStyle: AppTextStyle.hint,
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            prefixIcon: const Icon(Icons.event),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onChanged: onEndDateChange,
          onSaved: (val) {
            if (val != null) onEndDateChange(val);
          },
        ),
        const SizedBox(height: 8),
        DateTimePicker(
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 5),
          initialDate: DateTime.now(),
          dateMask: 'y-MM-dd',
          initialValue: actualEndDateInitialValue,
          decoration: InputDecoration(
            label: Text(AppStrings.actualEndDate),
            labelStyle: AppTextStyle.hint,
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            prefixIcon: const Icon(Icons.event),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onChanged: onActualEndDateChange,
          onSaved: (val) {
            if (val != null) onActualEndDateChange(val);
          },
        ),
        const SizedBox(height: 8),
        TextFiledForm(
          hintText: AppStrings.cost,
          prefixIcon: const Icon(Icons.monetization_on),
          initialValue: costInitialValue,
          textAlign: TextAlign.left,
          onTextChanged: onCostChange,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
