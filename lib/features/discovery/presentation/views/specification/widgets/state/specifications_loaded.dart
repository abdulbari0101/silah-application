import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/specifications/specifications_bloc.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/admin/specification_editor_sheet.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/item/specification_item.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/state/add_specification_card.dart';

class OperatorsLoaded extends StatelessWidget {
  const OperatorsLoaded({super.key, required this.data});

  final List<LegalSpecializationEntity> data;

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.select<AppStateBloc, bool>((bloc) {
      final accountType = bloc.state.data.customer?.profile?['accountType']
          ?.toString()
          .toLowerCase();
      return accountType == 'admin';
    });
    final itemCount = isAdmin ? data.length + 1 : data.length;

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.98,
          ),
          itemBuilder: (context, index) {
            if (isAdmin && index == 0) {
              return AddSpecificationCard(onTap: () => _openEditor(context));
            }

            final dataIndex = isAdmin ? index - 1 : index;
            final item = data[dataIndex];
            final onTap = isAdmin
                ? () => _openEditor(context, item: item)
                : null;

            return SpecificationItem(enabled: true, onTap: onTap, item: item);
          },
        );
      },
    );
  }

  Future<void> _openEditor(
    BuildContext context, {
    LegalSpecializationEntity? item,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        return SpecificationEditorSheet(
          initial: item,
          onSubmit: (payload) async {
            return context.read<SpecificationsBloc>().upsertSpecialization(
              specializationId: payload.specializationId,
              nameAr: payload.nameAr,
              nameEn: payload.nameEn,
              order: payload.order,
              iconUrl: payload.currentIconUrl,
              iconFile: payload.iconFile,
            );
          },
        );
      },
    );

    if (!context.mounted || result != true) return;

    Toasts.success(context, Strings.update_success.tr());
  }
}
