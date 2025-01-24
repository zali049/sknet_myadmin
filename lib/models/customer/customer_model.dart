import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class CustomerModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "group_id")
  String? groupId;
  @JsonKey(name: "custno")
  String? noCust;
  @JsonKey(name: "jenis_pasang")
  String? typeInstallasi;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "jabatan")
  String? titleJob;
  @JsonKey(name: "fname")
  String? firstname;
  @JsonKey(name: "lname")
  String? lastName;
  @JsonKey(name: "email_cust")
  String? emailCustomer;
  @JsonKey(name: "kelamin")
  String? gender;
  @JsonKey(name: "no_telepon")
  String? noTelp;
  @JsonKey(name: "no_hp")
  String? noMobilePhone;
  @JsonKey(name: "pengenal")
  String? identityCard;
  @JsonKey(name: "no_pengenal")
  String? noIdentity;
  @JsonKey(name: "alamat")
  String? addressCust;
  @JsonKey(name: "kodepos")
  String? zipCode;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "signature")
  String? signature;
  @JsonKey(name: "kab_id")
  String? regencyId;
  @JsonKey(name: "kec_id")
  String? districId;
  @JsonKey(name: "desa_id")
  String? villageId;
  @JsonKey(name: "longitude")
  String? longitude;
  @JsonKey(name: "latitude")
  String? latitude;
  @JsonKey(name: "jenis")
  String? typeService;
  @JsonKey(name: "layanan_id")
  String? serviceId;
  @JsonKey(name: "paket_id")
  String? packetId;
  @JsonKey(name: "kapasitas")
  String? typePacket;
  @JsonKey(name: "cek_alamat_psg")
  String? coverageCheck;
  @JsonKey(name: "alamat_psg")
  String? addressInst;
  @JsonKey(name: "kodepos_psg")
  String? zipCodeInst;
  @JsonKey(name: "kab_id_psg")
  String? regencyIdInst;
  @JsonKey(name: "kec_id_psg")
  String? districkIdInst;
  @JsonKey(name: "desa_id_psg")
  String? villageIdInst;
  @JsonKey(name: "status_tempat")
  String? placeStatus;
  @JsonKey(name: "perusahaan")
  String? corporation;
  @JsonKey(name: "alamat_usaha")
  String? addressCorp;
  @JsonKey(name: "telp_usaha")
  String? telpCorp;
  @JsonKey(name: "npwp")
  String? taxId;
  @JsonKey(name: "kantor")
  String? office;
  @JsonKey(name: "jenis_usaha")
  String? typeBussiness;
  @JsonKey(name: "website")
  String? website;
  @JsonKey(name: "finansial_nama")
  String? nameBussiness;
  @JsonKey(name: "finansial_jabatan")
  String? titleBussiness;
  @JsonKey(name: "finansial_alamat")
  String? addressBussiness;
  @JsonKey(name: "finansial_kodepos")
  String? zipCodeBussines;
  @JsonKey(name: "finansial_ponsel")
  String? mobileBussiness;
  @JsonKey(name: "finansial_telepon")
  String? telpBussines;
  @JsonKey(name: "finansial_fax")
  String? faxBussiness;
  @JsonKey(name: "finansial_email")
  String? emailBussiness;
  @JsonKey(name: "teknis_nama")
  String? nameTechnician;
  @JsonKey(name: "teknis_jabatan")
  String? titleTecnichian;
  @JsonKey(name: "teknis_ponsel")
  String? mobileTechnician;
  @JsonKey(name: "teknis_telepon")
  String? telpTechnician;
  @JsonKey(name: "teknis_email")
  String? emailTechnician;
  @JsonKey(name: "activation_code")
  String? activationCode;
  @JsonKey(name: "forgotten_password_code")
  String? forgotPasswdCode;
  @JsonKey(name: "forgotten_password_time")
  String? forgotPasswdTime;
  @JsonKey(name: "remember_code")
  String? rememberCode;
  @JsonKey(name: "last_login")
  String? lastLogin;
  @JsonKey(name: "active")
  String? active;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "berlangganan")
  String? subscribe;
  @JsonKey(name: "asal")
  String? asal;
  @JsonKey(name: "tgl_daftar")
  String? dateRegister;
  @JsonKey(name: "tgl_pasang")
  String? dateInst;
  @JsonKey(name: "tgl_aktif")
  String? dateActive;
  @JsonKey(name: "tipe")
  String? type;
  @JsonKey(name: "sales_id")
  String? idSales;
  @JsonKey(name: "sales_name")
  String? nameSales;
  @JsonKey(name: "biaya_bulanan")
  String? monthlyPrice;
  @JsonKey(name: "biaya_tax")
  String? taxPrice;
  @JsonKey(name: "biaya_registrasi")
  String? regPrice;
  @JsonKey(name: "biaya_material")
  String? materialPrice;
  @JsonKey(name: "biaya_lain")
  String? otherPrice;
  @JsonKey(name: "biaya_total")
  String? priceAll;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  CustomerModel({
    this.id,
    this.groupId,
    this.noCust,
    this.typeInstallasi,
    this.username,
    this.password,
    this.titleJob,
    this.firstname,
    this.lastName,
    this.emailCustomer,
    this.gender,
    this.noTelp,
    this.noMobilePhone,
    this.identityCard,
    this.noIdentity,
    this.addressCust,
    this.zipCode,
    this.photo,
    this.signature,
    this.regencyId,
    this.districId,
    this.villageId,
    this.longitude,
    this.latitude,
    this.typeService,
    this.serviceId,
    this.packetId,
    this.typePacket,
    this.coverageCheck,
    this.addressInst,
    this.zipCodeInst,
    this.regencyIdInst,
    this.districkIdInst,
    this.villageIdInst,
    this.placeStatus,
    this.corporation,
    this.addressCorp,
    this.telpCorp,
    this.taxId,
    this.office,
    this.typeBussiness,
    this.website,
    this.nameBussiness,
    this.titleBussiness,
    this.addressBussiness,
    this.zipCodeBussines,
    this.mobileBussiness,
    this.telpBussines,
    this.faxBussiness,
    this.emailBussiness,
    this.nameTechnician,
    this.titleTecnichian,
    this.mobileTechnician,
    this.telpTechnician,
    this.emailTechnician,
    this.activationCode,
    this.forgotPasswdCode,
    this.forgotPasswdTime,
    this.rememberCode,
    this.lastLogin,
    this.active,
    this.status,
    this.subscribe,
    this.asal,
    this.dateRegister,
    this.dateInst,
    this.dateActive,
    this.type,
    this.idSales,
    this.nameSales,
    this.monthlyPrice,
    this.taxPrice,
    this.regPrice,
    this.materialPrice,
    this.otherPrice,
    this.priceAll,
  });

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
