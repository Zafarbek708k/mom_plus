import 'package:equatable/equatable.dart';
import 'baby_info_entity.dart';

class HistoryEntity extends Equatable {
  final List<String> date;
  @BabyInfoEntityConvertor()
  final List<BabyInfoEntity> items;

  const HistoryEntity({this.date = const [], this.items = const []});

  @override
  List<Object?> get props => [date, items];
}
