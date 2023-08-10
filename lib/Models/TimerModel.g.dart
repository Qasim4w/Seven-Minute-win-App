// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimerModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerTracksModelAdapter extends TypeAdapter<TimerTracksModel> {
  @override
  final int typeId = 1;

  @override
  TimerTracksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerTracksModel(
      count: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, TimerTracksModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerTracksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
