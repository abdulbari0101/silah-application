class NavItemData {
  const NavItemData({
    required this.routeName,
    required this.selectedIconAsset,
    required this.unselectedIconAsset,
    required this.labelKey,
    this.branchIndex,
  });

  final String routeName;

  final String selectedIconAsset;

  final String unselectedIconAsset;

  final String labelKey;

  final int? branchIndex;
}
