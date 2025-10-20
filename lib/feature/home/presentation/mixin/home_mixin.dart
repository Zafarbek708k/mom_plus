part of 'package:mom_plus/feature/home/presentation/pages/home.dart';

mixin HomeMixin on State<Home> {
  late final TabController _tabController;
  late final ValueNotifier<MainItems> _selectedView;

  void init(TickerProvider provider) {
    _selectedView = ValueNotifier(MainItems.values.first);
    _tabController = TabController(length: 3, vsync: provider);
    _tabController.addListener(() {});
  }
}
