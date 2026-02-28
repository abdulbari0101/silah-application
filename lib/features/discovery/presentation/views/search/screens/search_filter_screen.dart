import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';
import 'package:silah_app/features/discovery/presentation/blocs/search/discovery_search_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/search_filter_body.dart';

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiscoverySearchCubit(repository: locator())..load(),
      child: PlatformScreenWrapper(body: const SearchFilterBody()),
    );
  }
}
