// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workorder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderModel _$WorkOrderModelFromJson(Map<String, dynamic> json) =>
    WorkOrderModel(
      id: json['id_wo'] as String?,
      numberWo: json['no_wo'] as String?,
      userId: json['user_id'] as String?,
      customerId: json['customer_id'] as String?,
      typeSite: json['jenis_site'] as String?,
      workType: json['jenis_pek'] as String?,
      workDate: json['tgl_pek'] as String?,
      nameSite: json['nama_site'] as String?,
      picSite: json['pic_site'] as String?,
      picNoHp: json['pic_hp'] as String?,
      addressSite: json['alamat_site'] as String?,
      siteKabId: json['site_kab_id'] as String?,
      siteKecId: json['site_kec_id'] as String?,
      siteDesaId: json['site_des_id'] as String?,
      listWork: json['uraian_pek'] as String?,
      workAnalysis: json['analisis_pek'] as String?,
      workAction: json['tindakan_pek'] as String?,
      cableLenght: json['pjg_kabel'] as String?,
      cabelRoll: json['no_rol'] as String?,
      itemRoset: json['jml_roset'] as String?,
      odpId: json['odp_id'] as String?,
      odpCode: json['kode_odp'] as String?,
      nameOdp: json['nama_odp'] as String?,
      portOdp: json['port_odp'] as String?,
      snOnt: json['sn_ont'] as String?,
      otherMaterial: json['material_lain'] as String?,
      status: json['status'] as String?,
      completeDate: json['tgl_selesai'] as String?,
      note: json['catatan'] as String?,
      superior: json['pemberi'] as String?,
    );

Map<String, dynamic> _$WorkOrderModelToJson(WorkOrderModel instance) =>
    <String, dynamic>{
      'id_wo': instance.id,
      'no_wo': instance.numberWo,
      'user_id': instance.userId,
      'customer_id': instance.customerId,
      'jenis_pek': instance.workType,
      'tgl_pek': instance.workDate,
      'jenis_site': instance.typeSite,
      'nama_site': instance.nameSite,
      'pic_site': instance.picSite,
      'pic_hp': instance.picNoHp,
      'alamat_site': instance.addressSite,
      'site_kab_id': instance.siteKabId,
      'site_kec_id': instance.siteKecId,
      'site_des_id': instance.siteDesaId,
      'uraian_pek': instance.listWork,
      'analisis_pek': instance.workAnalysis,
      'tindakan_pek': instance.workAction,
      'pjg_kabel': instance.cableLenght,
      'no_rol': instance.cabelRoll,
      'jml_roset': instance.itemRoset,
      'odp_id': instance.odpId,
      'kode_odp': instance.odpCode,
      'nama_odp': instance.nameOdp,
      'port_odp': instance.portOdp,
      'sn_ont': instance.snOnt,
      'material_lain': instance.otherMaterial,
      'status': instance.status,
      'tgl_selesai': instance.completeDate,
      'catatan': instance.note,
      'pemberi': instance.superior,
    };
