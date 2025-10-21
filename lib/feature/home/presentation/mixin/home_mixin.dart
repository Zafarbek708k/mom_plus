part of 'package:mom_plus/feature/home/presentation/pages/home.dart';

mixin HomeMixin on State<Home> {
  late final TabController _tabController;
  late final ValueNotifier<MainItems> _selectedView;
  late final HomeBloc homeBloc;

  void init(TickerProvider provider, BuildContext context) {
    homeBloc = context.read<HomeBloc>();
    _selectedView = ValueNotifier(MainItems.values.first);
    _tabController = TabController(length: 3, vsync: provider);
    _tabController.addListener(() {});

    homeBloc.add(GetBabiesEvent());
  }
}
