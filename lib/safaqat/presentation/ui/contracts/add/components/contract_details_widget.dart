import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/data/models/contract/service_dto.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_status.dart';
import 'package:safaqat/safaqat/domain/entities/currency_type.dart';
import 'package:safaqat/safaqat/presentation/custom_views/dropdown_field.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';

class ContractDetailsWidget extends StatelessWidget {
  const ContractDetailsWidget({
    Key? key,
    required this.title,
    required this.onEndDateChange,
    required this.onExpansionChanged,
    required this.expanded,
    required this.serviceFormKey,
    required this.statusFormKey,
    required this.onStatusChange,
    required this.onServiceChange,
    required this.serviceExpanded,
    required this.statusExpanded,
    required this.onStatusExpansionChange,
    required this.onServiceExpansionChange,
    this.serviceInitialValue,
    this.statusInitialValue,
    this.startDateInitialValue,
    this.endDateInitialValue,
    required this.services,
    required this.onStartDateChange,
    required this.onCostChange,
    this.costInitialValue,
    required this.currencyExpanded,
    required this.onCurrencyExpansionChange,
    required this.onCurrencyChange,
    required this.currencyFormKey,
    this.currencyInitialValue,
  }) : super(key: key);

  final String title;
  final ValueChanged<String> onStartDateChange, onEndDateChange, onCostChange;
  final bool expanded, serviceExpanded, statusExpanded, currencyExpanded;
  final ValueChanged<bool> onExpansionChanged,
      onStatusExpansionChange,
      onCurrencyExpansionChange,
      onServiceExpansionChange;
  final ValueChanged<CurrencyType> onCurrencyChange;
  final ValueChanged<ContractStatus> onStatusChange;
  final ValueChanged<ServiceDto> onServiceChange;
  final List<ServiceDto> services;
  final GlobalKey<FormState> serviceFormKey, statusFormKey, currencyFormKey;
  final String? startDateInitialValue, endDateInitialValue, costInitialValue;
  final ServiceDto? serviceInitialValue;
  final ContractStatus? statusInitialValue;
  final CurrencyType? currencyInitialValue;

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
        DropdownField<ServiceDto>(
          initialValue: serviceInitialValue,
          hint: AppStrings.services,
          formKey: serviceFormKey,
          expanded: serviceExpanded,
          onExpansionChanged: onServiceExpansionChange,
          onSelected: (value) => onServiceChange(value),
          items: services,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        DropdownField<ContractStatus>(
          initialValue: statusInitialValue,
          hint: AppStrings.status,
          formKey: statusFormKey,
          expanded: statusExpanded,
          onExpansionChanged: onStatusExpansionChange,
          onSelected: (value) => onStatusChange(value),
          items: ContractStatus.items,
          displayStringForOption: (item) => item.name,
        ),
        const SizedBox(height: 8),
        DropdownField<CurrencyType>(
          initialValue: currencyInitialValue,
          hint: AppStrings.currency,
          formKey: currencyFormKey,
          expanded: currencyExpanded,
          onExpansionChanged: onCurrencyExpansionChange,
          onSelected: (value) => onCurrencyChange(value),
          items: CurrencyType.items,
          displayStringForOption: (item) => item.name,
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
      ],
    );
  }
}
