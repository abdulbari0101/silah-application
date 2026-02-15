import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/features/support/presentation/blocs/support/support_bloc.dart';
import 'package:silah_app/features/support/presentation/view/support/widgets/support_builder.dart';

class SupportBody extends StatelessWidget {
  const SupportBody({super.key, this.onRefresh});

  final VoidCallback? onRefresh;

  Future<void> _handleRefresh(BuildContext context) async {
    if (onRefresh != null) {
      onRefresh!.call();
    } else {
      context.read<SupportBloc>().add(LoadSupports());
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
