import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/features/discovery/presentation/blocs/specifications/specifications_bloc.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/specifications_builder.dart';

class SpecificationsBody extends StatelessWidget {
  const SpecificationsBody({super.key, this.onRefresh});

  final VoidCallback? onRefresh;

  Future<void> _handleRefresh(BuildContext context) async {
    if (onRefresh != null) {
      onRefresh!.call();
    } else {
      context.read<SpecificationsBloc>().add(LoadSpecifications());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        edgeOffset: UIConstants.mediumPadding,
        onRefresh: () => _handleRefresh(context),
        child: Padding(
          padding: const EdgeInsets.all(UIConstants.mediumPadding),
          child: const OperatorsBuilder(),
        ),
      ),
    );
  }
}
