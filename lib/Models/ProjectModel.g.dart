// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'ProjectModel.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class AllProjectsListModelAdapter extends TypeAdapter<AllProjectsListModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   AllProjectsListModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return AllProjectsListModel(
//       projectName: fields[0] as String?,
//       widget: fields[1] as Widget?,
//       minutes: fields[2] as int?,
//       title: fields[3] as String?,
//       description: fields[4] as String?,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, AllProjectsListModel obj) {
//     writer
//       ..writeByte(5)
//       ..writeByte(0)
//       ..write(obj.projectName)
//       ..writeByte(1)
//       ..write(obj.widget)
//       ..writeByte(2)
//       ..write(obj.minutes)
//       ..writeByte(3)
//       ..write(obj.title)
//       ..writeByte(4)
//       ..write(obj.description);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AllProjectsListModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
