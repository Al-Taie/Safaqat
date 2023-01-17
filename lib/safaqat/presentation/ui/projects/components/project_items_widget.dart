import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/components/project_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/details/project_details_page.dart';

class ProjectItemsWidget extends StatelessWidget {
  const ProjectItemsWidget({
    Key? key,
    required this.status,
    required this.apiCall,
    required this.data,
    required this.onPressed,
    this.isLogged = false,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  final Status status;
  final VoidCallback apiCall;
  final bool isLogged;
  final List<ProjectDto> data;
  final ValueChanged<ProjectDto> onPressed;
  final ValueChanged<ProjectDto>? onDelete, onEdit;

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      status: status,
      onClickTryAgain: apiCall,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.fromLTRB(
            16,
            8,
            16,
            16,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            var item = data[index];
            return ProjectCardWidget(
              title: item.name,
              name: item.ownerName ?? '-',
              image: item.images.firstOrNull ?? '',
              date: Utils.formatDate(dateStr: item.startDate),
              convener: item.convener,
              sector: item.sector,
              city: item.city,
              isLogged: isLogged,
              onEdit: () {
                onEdit?.call(item);
              },
              onDelete: () {
                onDelete?.call(item);
              },
              onPressed: () {
                onPressed(item);
                ProjectDetailsPage(project: item).navTo();
              },
            );
          }),
    );
  }
}
