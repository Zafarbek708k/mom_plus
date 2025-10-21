import 'package:equatable/equatable.dart';
import 'baby_info_entity.dart';

class HistoryEntity extends Equatable {
  final String date;
  @BabyInfoEntityConvertor()
  final List<BabyInfoEntity> items;

  const HistoryEntity({this.date = '', this.items = const []});

  @override
  List<Object?> get props => [date, items];
}
