
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_stakeholder_type.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/dropdown_field.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/stakeholder_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/stakholder_local_image_widget.dart';

class EventStakeHoldersWidget extends StatelessWidget {
  const EventStakeHoldersWidget({
    super.key,
    required this.title,
    required this.expanded,
    required this.onExpansionChanged,
    required this.sponsorType,
    required this.name,
    required this.stakeHolderTypeExpanded,
    required this.onStakeHolderTypeExpansionChanged,
    required this.onStakeHolderTypeChange,
    required this.eventstakeHolderTypeFormKey,
    this.sponsorTypeInitialValue,
    this.nameInitialValue,
    required this.stakeholders,
    required this.stakeholderImageExpanded,
    required this.onStakeHolderImageExpansionChanged,
    required this.onStakeHoldersChanged,
    required this.imageController,
    this.stakeholder,
    required this.onStakeHolderChange,
  });

  final List<Stakeholder> stakeholders;
  final ValueChanged<List<Stakeholder>> onStakeHoldersChanged;
  final String title, sponsorType, name;
  final bool expanded, stakeHolderTypeExpanded, stakeholderImageExpanded;
  final ValueChanged<bool> onExpansionChanged,
      onStakeHolderTypeExpansionChanged,
      onStakeHolderImageExpansionChanged;
  final ValueChanged<EventStakeHolderType> onStakeHolderTypeChange;
  final GlobalKey<FormState> eventstakeHolderTypeFormKey;
  final String? sponsorTypeInitialValue, nameInitialValue;
  final MultiImagePickerController imageController;
  final Stakeholder? stakeholder;
  final ValueChanged<Stakeholder?> onStakeHolderChange;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final sponsorTypeController = TextEditingController();

    nameInitialValue?.let((it) {
      if (nameController.text.isEmpty) nameController.text = it;
    });

    sponsorTypeInitialValue?.let((it) {
      if (sponsorTypeController.text.isEmpty) sponsorTypeController.text = it;
    });

    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: title,
      expanded: expanded,
      onExpansionChanged: onExpansionChanged,
      children: [
        StakeHolderLocalImageWidget(
          index: stakeholders.length,
          expanded: stakeholderImageExpanded,
          onExpansionChanged: onStakeHolderImageExpansionChanged,
          onImagesChange: (index, image) {
            if (stakeholder == null) {
              onStakeHolderChange(Stakeholder(
                stakeholderName: '',
                stakeholderOrder: stakeholders.length,
                stakeholderType: EventStakeHolderType.organizer,
                sponsorType: '',
                stakeholderLogo: image,
              ));
            }
            stakeholder?.stakeholderLogo = image;
          },
          imageController: imageController,
        ),
        const SizedBox(height: 8),
        DropdownField(
          hint: AppStrings.stakeholderType,
          expanded: stakeHolderTypeExpanded,
          formKey: eventstakeHolderTypeFormKey,
          onExpansionChanged: onStakeHolderTypeExpansionChanged,
          onSelected: (EventStakeHolderType type) {
            stakeholder?.stakeholderType = type;
             onStakeHolderChange(stakeholder);
          },
          items: EventStakeHolderType.items,
          displayStringForOption: (EventStakeHolderType type) => type.toString(),
        ),
        const SizedBox(height: 8),
        TextFiledForm(
          hintText: name,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          controller: nameController,
          onEditingComplete: () => onStakeHolderChange(stakeholder),
          onTextChanged: (value) {
            stakeholder?.stakeholderName = value;
          },
        ),
        const SizedBox(height: 8),
        TextFiledForm(
          hintText: sponsorType,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          controller: sponsorTypeController,
          onEditingComplete: () => onStakeHolderChange(stakeholder),
          onTextChanged: (value) {
            stakeholder?.sponsorType = value;
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 50,
          width: 148,
          child: CustomButton(
            text: AppStrings.add,
            enabled: stakeholder != null,
            onPressed: () {
              stakeholder?.let((value) {
                stakeholders.add(value);
                onStakeHolderChange(null);
                nameController.clear();
                sponsorTypeController.clear();
                eventstakeHolderTypeFormKey.currentState?.reset();
                FocusScope.of(context).requestFocus(FocusNode());
                onStakeHoldersChanged(stakeholders);
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: stakeholders.isEmpty ? 0 : 228,
            width: Get.width,
            child: DraggableGridViewBuilder(
              scrollDirection: Axis.horizontal,
              cacheExtent: 100,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisExtent: 105,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              children: _stakholdersBuilder(
                stakeholders: stakeholders,
                onClick: (value) {
                  // Logger.log('CLICKED FROM WIDGET');
                  // nameController.text = value.stakeholderName;
                  // sponsorTypeController.text = value.sponsorType;
                },
                onDeleteCliked: (value) {
                  stakeholders.remove(value);
                  onStakeHoldersChanged(stakeholders);
                },
              ),
              isOnlyLongPress: false,
              dragCompletion: (List<DraggableGridItem> list, int beforeIndex,
                  int afterIndex) {
                List<Stakeholder> result = list
                    .asMap()
                    .map((index, value) {
                      var item = (value.child as StakeholderWidget).stakeholder;
                      item.stakeholderOrder = index;
                      return MapEntry(index, item);
                    })
                    .values
                    .toList();
                onStakeHoldersChanged(result);
              },
              dragFeedback: (List<DraggableGridItem> list, int index) {
                return ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: list[index].child,
                  ),
                );
              },
              dragPlaceHolder: (List<DraggableGridItem> list, int index) {
                return PlaceHolderWidget(
                  child: ClipOval(
                    child: Container(
                      color: AppColors.blueLight,
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

List<DraggableGridItem> _stakholdersBuilder(
    {required List<Stakeholder> stakeholders,
    required ValueChanged<Stakeholder> onClick,
    required ValueChanged<Stakeholder> onDeleteCliked}) {
  if (stakeholders.isEmpty) return [DraggableGridItem(child: const SizedBox())];

  List<Widget> widgets = stakeholders
      .map((stakeholder) => StakeholderWidget(
            stakeholder: stakeholder,
            onClick: onClick,
            onDeleteCliked: onDeleteCliked,
            index: stakeholder.stakeholderOrder,
          ))
      .toList();

  return widgets
      .map((child) => DraggableGridItem(child: child, isDraggable: true))
      .toList();
}
