// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 0;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      notificationsEnabled: fields[0] as bool,
      emailNotifications: fields[1] as bool,
      autoJoinAudio: fields[2] as bool,
      autoJoinVideo: fields[3] as bool,
      videoQuality: fields[4] as String,
      theme: fields[5] as String,
      language: fields[6] as String,
      soundEnabled: fields[7] as bool,
      vibrationEnabled: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.notificationsEnabled)
      ..writeByte(1)
      ..write(obj.emailNotifications)
      ..writeByte(2)
      ..write(obj.autoJoinAudio)
      ..writeByte(3)
      ..write(obj.autoJoinVideo)
      ..writeByte(4)
      ..write(obj.videoQuality)
      ..writeByte(5)
      ..write(obj.theme)
      ..writeByte(6)
      ..write(obj.language)
      ..writeByte(7)
      ..write(obj.soundEnabled)
      ..writeByte(8)
      ..write(obj.vibrationEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
