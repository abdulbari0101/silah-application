import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/search/discovery_results_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/search_results_body.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key, required this.specialization});

  final LegalSpecializationEntity specialization;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DiscoveryResultsCubit(repository: locator(), specialization: specialization)..load(),
      child: PlatformScreenWrapper(body: SearchResultsBody(specialization: specialization)),
    );
  }
}
