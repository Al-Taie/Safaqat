import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_type.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_attend.dart';
import 'package:safaqat/safaqat/presentation/custom_views/autocomplete_textfield.dart';
import 'package:safaqat/safaqat/presentation/custom_views/dropdown_field.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/small_map_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';

class EventDetailsWidget extends StatelessWidget {
  const EventDetailsWidget({
    Key? key,
    required this.title,
    required this.website,
    required this.email,
    required this.endAt,
    required this.startAt,
    required this.onWebsiteChange,
    required this.onEmailChange,
    this.websiteInitialValue,
    this.emailInitialValue,
    required this.onCountryChange,
    required this.onCityChange,
    required this.countries,
    required this.cities,
    required this.onStartChange,
    required this.onEndChange,
    required this.phone,
    this.phoneInitialValue,
    required this.onPhoneChange,
    required this.locationController,
    required this.onPressed,
    required this.onExpansionChanged,
    required this.expanded,
    required this.eventTypeFormKey,
    required this.eventAttendFormKey,
    required this.onAttendChange,
    required this.onTypeChange,
    required this.typeExpaned,
    required this.attendExpaned,
    required this.onAttendExpansionChange,
    required this.onTypeExpansionChange,
  }) : super(key: key);

  final String title, website, email, startAt, endAt, phone;
  final String? websiteInitialValue, emailInitialValue, phoneInitialValue;
  final ValueChanged<String> onWebsiteChange,
      onEmailChange,
      onPhoneChange,
      onStartChange,
      onEndChange;
  final bool expanded, typeExpaned, attendExpaned;
  final ValueChanged<bool> onExpansionChanged,
      onAttendExpansionChange,
      onTypeExpansionChange;
  final ValueChanged<CountryDto> onCountryChange;
  final ValueChanged<CityDto> onCityChange;
  final ValueChanged<EventType> onTypeChange;
  final ValueChanged<EventAttend> onAttendChange;
  final List<CountryDto> countries;
  final List<CityDto> cities;
  final ValueChanged<LatLng> onPressed;
  final LocationController locationController;
  final GlobalKey<FormState> eventTypeFormKey;
  final GlobalKey<FormState> eventAttendFormKey;

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
        DropdownField(
          hint: AppStrings.evenType,
          formKey: eventTypeFormKey,
          expanded: typeExpaned,
          onExpansionChanged: onTypeExpansionChange,
          onSelected: (EventType value) => onTypeChange(value),
          items: EventType.values,
          selector: (EventType type) => type.toString(),
        ),
        const SizedBox(height: 8),
        DropdownField(
          hint: AppStrings.eventAttend,
          formKey: eventAttendFormKey,
          expanded: attendExpaned,
          onExpansionChanged: onAttendExpansionChange,
          onSelected: (EventAttend value) => onAttendChange(value),
          items: EventAttend.values,
          selector: (EventAttend attend) => attend.toString(),
        ),
        const SizedBox(height: 8),
        AutocompleteTextField<CountryDto>(
          hintText: AppStrings.country,
          suggestions: countries,
          displayStringForOption: (country) => country.name,
          onSelected: onCountryChange,
        ),
        const SizedBox(height: 8),
        AutocompleteTextField<CityDto>(
          hintText: AppStrings.city,
          suggestions: cities,
          displayStringForOption: (city) => city.name,
          onSelected: onCityChange,
        ),
        const SizedBox(height: 8),
        SmallMapWidget(
          height: 200,
          width: Get.width,
          controller: locationController,
          onPressed: onPressed,
        ),
        const SizedBox(height: 8),
        DateTimePicker(
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 5),
          initialDate: DateTime.now(),
          dateMask: 'y-MM-dd',
          decoration: InputDecoration(
            label: Text(startAt),
            labelStyle: AppTextStyle.hint,
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            prefixIcon: const Icon(Icons.event),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onChanged: onStartChange,
          onSaved: (val) {
            if (val != null) onStartChange(val);
          },
        ),
        const SizedBox(height: 8),
        DateTimePicker(
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 5),
          initialDate: DateTime.now(),
          dateMask: 'y-MM-dd',
          decoration: InputDecoration(
            label: Text(endAt),
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
        const SizedBox(height: 8),
        TextFiledForm(
          hintText: phone,
          initialValue: phoneInitialValue,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.phone,
          onTextChanged: onPhoneChange,
        ),
        const SizedBox(height: 8),
        TextFiledForm(
          hintText: email,
          initialValue: emailInitialValue,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          onTextChanged: onEmailChange,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFiledForm(
            hintText: website,
            initialValue: websiteInitialValue,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            onTextChanged: onWebsiteChange,
          ),
        ),
      ],
    );
  }
}
