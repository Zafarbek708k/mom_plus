part of 'package:mom_plus/feature/home/presentation/pages/home.dart';

mixin HomeMixin on State<Home> {
  late final TextEditingController valueCtrl;
  late final TextEditingController dateCtrl;
  late final TabController _tabController;
  late final ValueNotifier<MainItems> _selectedView;
  late final HomeBloc homeBloc;

  void init(TickerProvider provider, BuildContext context) {
    homeBloc = context.read<HomeBloc>();
    _selectedView = ValueNotifier(MainItems.values.first);
    _tabController = TabController(length: 3, vsync: provider);
    _tabController.addListener(() {});
    dateCtrl = TextEditingController();
    valueCtrl = TextEditingController();

    homeBloc.add(GetBabiesEvent());
    homeBloc.add(GetHistoriesEvent());
  }

  @override
  void dispose() {
    dateCtrl.dispose();
    valueCtrl.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void addNew({
    required BuildContext context,
    required TextEditingController valueCtrl,
    required TextEditingController dateCtrl,
  }) {
    showModalBottomSheet(
      constraints: BoxConstraints(maxWidth: context.sizeOf.height * 0.8),
      isDismissible: true,
      isScrollControlled: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return ConfigureDataBottomSheet(info: _selectedView.value, valueCtrl: valueCtrl, dateCtrl: dateCtrl);
      },
    );
  }
}
