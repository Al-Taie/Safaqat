import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_status.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/components/contract_card_widget.dart';

class ContractItemsWidget extends StatelessWidget {
  const ContractItemsWidget({
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
  final List<ContractDto> data;
  final ValueChanged<ContractDto> onPressed;
  final ValueChanged<ContractDto>? onDelete, onEdit;

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
            return ContractCardWidget(
              title: item.name,
              name: item.contractor ?? '-',
              image: item.images.firstOrNull ?? '',
              date: Utils.formatDate(dateStr: item.startDate),
              service: item.service,
              status: ContractStatus.fromInt(item.status ?? 0),
              isLogged: isLogged,
              onEdit: () {
                onEdit?.call(item);
              },
              onDelete: () {
                onDelete?.call(item);
              },
              onPressed: () {
                onPressed(item);
                // TODO: IMPLEMENT ME
                // ContractDetailsPage(contract: item).navTo();
              },
            );
          }),
    );
  }
}
