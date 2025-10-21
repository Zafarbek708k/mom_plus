import 'package:equatable/equatable.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';
import 'package:mom_plus/feature/home/domain/entities/initial_info_entity.dart';

class BabyEntity extends Equatable {
  final String name;
  final String birthDate;
  final String id;
  final String gender;
  @InitialInfoEntityConvertor()
  final InitialInfoEntity initialInfo;
  @BabyInfoEntityConvertor()
  final List<BabyInfoEntity> weight;
  @BabyInfoEntityConvertor()
  final List<BabyInfoEntity> height;
  @BabyInfoEntityConvertor()
  final List<BabyInfoEntity> head;

  const BabyEntity({
    this.initialInfo = const InitialInfoEntity(),
    this.weight = const [],
    this.height = const [],
    this.head = const [],
    this.name = '',
    this.gender = '',
    this.id = '',
    this.birthDate = '',
  });

  @override
  List<Object?> get props => [weight, head, height, name, gender, id, birthDate];
}
