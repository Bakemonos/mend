import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mend/core/constants/colors.dart';
import 'package:mend/core/constants/sizes.dart';
import 'package:mend/core/routing/routes_path.dart';
import 'package:mend/features/navigation/controllers/navigation_provider.dart';
import 'package:mend/shared/widgets/app_bar.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(navigationProvider);

    return Scaffold(
      appBar: MyAppBar(
        title: 'Medications', 
        subTitle: '23 active medications',
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primary,
              overlayColor: AppColor.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.radiusDefault.r))
              )
            ),
            icon: Icon(Icons.add, color: AppColor.white),
            onPressed: (){
              context.push(Routes.addMedication);
            }
          ),
        ], 
      ),
      body: IndexedStack(index: state, children: NavigationConfig.navigationScreens), 
      bottomNavigationBar: NavigationBar(
        selectedIndex: state,
        onDestinationSelected: (i) => ref.read(navigationProvider.notifier).setSelected(i),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: NavigationConfig.navigationOptions,
      ),
    );
  }
}