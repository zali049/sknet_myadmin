import 'package:json_annotation/json_annotation.dart';

part 'odp_model.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class OdpModel {
  final String? id;
  @JsonKey(name: 'kode_odp')
  final String? kodeOdp;
  @JsonKey(name: 'nama_odp')
  final String? namaOdp;
  @JsonKey(name: 'lokasi')
  final String? addressOdp;
  final String? longitude;
  final String? latitude;
  @JsonKey(name: 'no_feeder')
  final String? noFeeder;
  final String? tube;
  final String? core;
  @JsonKey(name: 'feeder_out')
  final String? feederOut;
  @JsonKey(name: 'ratio_splitter')
  final String? ratioSplitter;
  @JsonKey(name: 'ratio_out_red')
  final String? ratioSplitRed;
  @JsonKey(name: 'ratio_out_blue')
  final String? ratioSplitBlue;
  final String? splitter;
  @JsonKey(name: 'splitter_out')
  final String? splitterOut;
  final String? keterangan;

  factory OdpModel.fromJson(Map<String, dynamic> json) =>
      _$OdpModelFromJson(json);

  OdpModel({
    this.id,
    this.kodeOdp,
    this.namaOdp,
    this.addressOdp,
    this.longitude,
    this.latitude,
    this.noFeeder,
    this.tube,
    this.core,
    this.feederOut,
    this.ratioSplitter,
    this.ratioSplitRed,
    this.ratioSplitBlue,
    this.splitter,
    this.splitterOut,
    this.keterangan,
  });

  Map<String, dynamic> toJson() => _$OdpModelToJson(this);
}
