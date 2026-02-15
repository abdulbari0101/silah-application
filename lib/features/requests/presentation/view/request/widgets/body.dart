import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/features/requests/presentation/blocs/requests/requests_bloc.dart';
import 'package:silah_app/features/requests/presentation/view/request/widgets/requests_builder.dart';

class RequestsBody extends StatelessWidget {
  const RequestsBody({super.key, this.onRefresh});

  final VoidCallback? onRefresh;

  Future<void> _handleRefresh(BuildContext context) async {
    if (onRefresh != null) {
      onRefresh!.call();
    } else {
      context.read<RequestsBloc>().add(LoadRequests());
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
