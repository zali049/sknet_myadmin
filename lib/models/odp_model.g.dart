// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OdpModel _$OdpModelFromJson(Map<String, dynamic> json) => OdpModel(
      id: json['id'] as String?,
      kodeOdp: json['kode_odp'] as String?,
      namaOdp: json['nama_odp'] as String?,
      addressOdp: json['lokasi'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      noFeeder: json['no_feeder'] as String?,
      tube: json['tube'] as String?,
      core: json['core'] as String?,
      feederOut: json['feeder_out'] as String?,
      ratioSplitter: json['ratio_splitter'] as String?,
      ratioSplitRed: json['ratio_out_red'] as String?,
      ratioSplitBlue: json['ratio_out_blue'] as String?,
      splitter: json['splitter'] as String?,
      splitterOut: json['splitter_out'] as String?,
      keterangan: json['keterangan'] as String?,
    );

Map<String, dynamic> _$OdpModelToJson(OdpModel instance) => <String, dynamic>{
      'id': instance.id,
      'kode_odp': instance.kodeOdp,
      'nama_odp': instance.namaOdp,
      'lokasi': instance.addressOdp,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'no_feeder': instance.noFeeder,
      'tube': instance.tube,
      'core': instance.core,
      'feeder_out': instance.feederOut,
      'ratio_splitter': instance.ratioSplitter,
      'ratio_out_red': instance.ratioSplitRed,
      'ratio_out_blue': instance.ratioSplitBlue,
      'splitter': instance.splitter,
      'splitter_out': instance.splitterOut,
      'keterangan': instance.keterangan,
    };
