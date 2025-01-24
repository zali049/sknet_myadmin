import 'package:json_annotation/json_annotation.dart';

part 'workorder_model.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class WorkOrderModel {
  @JsonKey(name: "id_wo")
  String? id;
  @JsonKey(name: "no_wo")
  String? numberWo;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "customer_id")
  String? customerId;
  @JsonKey(name: "jenis_pek")
  String? workType;
  @JsonKey(name: "tgl_pek")
  String? workDate;
  @JsonKey(name: "jenis_site")
  String? typeSite;
  @JsonKey(name: "nama_site")
  String? nameSite;
  @JsonKey(name: "pic_site")
  String? picSite;
  @JsonKey(name: "pic_hp")
  String? picNoHp;
  @JsonKey(name: "alamat_site")
  String? addressSite;
  @JsonKey(name: "site_kab_id")
  String? siteKabId;
  @JsonKey(name: "site_kec_id")
  String? siteKecId;
  @JsonKey(name: "site_des_id")
  String? siteDesaId;
  @JsonKey(name: "uraian_pek")
  String? listWork;
  @JsonKey(name: "analisis_pek")
  String? workAnalysis;
  @JsonKey(name: "tindakan_pek")
  String? workAction;
  @JsonKey(name: "pjg_kabel")
  String? cableLenght;
  @JsonKey(name: "no_rol")
  String? cabelRoll;
  @JsonKey(name: "jml_roset")
  String? itemRoset;
  @JsonKey(name: "odp_id")
  String? odpId;
  @JsonKey(name: "kode_odp")
  String? odpCode;
  @JsonKey(name: "nama_odp")
  String? nameOdp;
  @JsonKey(name: "port_odp")
  String? portOdp;
  @JsonKey(name: "sn_ont")
  String? snOnt;
  @JsonKey(name: "material_lain")
  String? otherMaterial;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "tgl_selesai")
  String? completeDate;
  @JsonKey(name: "catatan")
  String? note;
  @JsonKey(name: "pemberi")
  String? superior;

  factory WorkOrderModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderModelFromJson(json);

  WorkOrderModel({
    this.id,
    this.numberWo,
    this.userId,
    this.customerId,
    this.typeSite,
    this.workType,
    this.workDate,
    this.nameSite,
    this.picSite,
    this.picNoHp,
    this.addressSite,
    this.siteKabId,
    this.siteKecId,
    this.siteDesaId,
    this.listWork,
    this.workAnalysis,
    this.workAction,
    this.cableLenght,
    this.cabelRoll,
    this.itemRoset,
    this.odpId,
    this.odpCode,
    this.nameOdp,
    this.portOdp,
    this.snOnt,
    this.otherMaterial,
    this.status,
    this.completeDate,
    this.note,
    this.superior,
  });

  Map<String, dynamic> toJson() => _$WorkOrderModelToJson(this);
}
