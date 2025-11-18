import 'package:expense_tracker/features/expense_tracker/data/model/expense_model/expense_model.dart';
import 'package:hive/hive.dart';

class ExpenseModelAdapter extends TypeAdapter<ExpenseModel> {
  @override
  final int typeId = 0;

  @override
  ExpenseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return ExpenseModel(
      id: fields[0] as int?,
      category: fields[1] as String,
      amount: fields[2] as double,
      currency: fields[3] as String,
      convertedAmount: fields[4] as double,
      date: fields[5] as DateTime,
      description: fields[6] as String?,
      receiptPath: fields[7] as String?,
      categoryIcon: fields[8] as String,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.convertedAmount)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.receiptPath)
      ..writeByte(8)
      ..write(obj.categoryIcon)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ExpenseModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

// Register Hive Adapters
void registerHiveAdapters() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }
}