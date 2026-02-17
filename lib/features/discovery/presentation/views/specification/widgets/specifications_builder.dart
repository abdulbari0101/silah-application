import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button_with_progress.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/features/discovery/presentation/blocs/specifications/specifications_bloc.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/state/specifications_loaded.dart';
import 'package:silah_app/features/discovery/presentation/views/specification/widgets/state/specifications_loading.dart';

class OperatorsBuilder extends StatelessWidget {
  const OperatorsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificationsBloc, SpecificationsState>(
      builder: (context, state) {
        if (state is DataPaymentLoading || state is DataPaymentInitial) {
          return const OperatorsLoading();
        }

        if (state is DataPaymentError) {
          return _ScrollableState(
            child: CustomeErrorWidget(
              message: state.message,
              onRetry: () => context.read<SpecificationsBloc>().add(LoadSpecifications()),
            ),
          );
        }

        if (state is DataPaymentLoaded) {
          if (state.data.isEmpty) {
            return _ScrollableState(
              child: EmptyWidget(
                retryWidget: PrimaryButtonWithProgress(
                  text: Strings.try_again.tr(),
                  onTap: () => context.read<SpecificationsBloc>().add(LoadSpecifications()),
                  isLoading: false,
                ),
              ),
            );
          }

          return OperatorsLoaded(data: state.data);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ScrollableState extends StatelessWidget {
  const _ScrollableState({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: child),
          ),
        );
      },
    );
  }
}
