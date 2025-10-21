import 'package:mom_plus/core/utils/enums/main_items.dart';
import 'package:mom_plus/feature/home/domain/entities/baby_info_entity.dart';

abstract class MyFunctions {
  static String title(MainItems item) {
    switch (item) {
      case MainItems.head:
        return "Tug’ilgandagi bosh o’lchami";
      case MainItems.weight:
        return 'Tug’ilgandagi vazni';
      case MainItems.height:
        return "Tug’ilgandagi bo’yi";
    }
  }

  static String date(MainItems item, BabyInfoEntity baby) {
    switch (item) {
      case MainItems.head:
        return baby.date.toString();
      case MainItems.weight:
        return baby.date.toString();
      case MainItems.height:
        return baby.date.toString();
    }
  }

  static String value(MainItems item, BabyInfoEntity baby) {
    switch (item) {
      case MainItems.head:
        return baby.value.toString();
      case MainItems.weight:
        return baby.toString();
      case MainItems.height:
        return baby.value.toString();
    }
  }

  static String addingTitle(MainItems item) {
    switch (item) {
      case MainItems.head:
        return 'Bosh o’lchami qo’shish';
      case MainItems.weight:
        return 'Og’irlikni qo’shish';
      case MainItems.height:
        return 'Bo’y uzunligini qo’shish';
    }
  }
}
