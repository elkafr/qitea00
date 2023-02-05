class Order {
    String? carttId;
    String? carttState;
    int? carttDone;
    int? carttPay;

    String? carttHikal;
    String? carttNumber;
    String? carttDetails1;
    String? carttPhoto1;
    String? carttDetails2;
    String? carttPhoto2;
    String? carttDetails3;
    String? carttPhoto3;

    String? carttDate;
    String? carttTime;
    String? carttAdress;
    String? carttMarka;
    String? carttMarkaName;
    String? carttTypee;
    String? carttTypeeName;
    String? carttModel;
    String? carttModelName;
    String? carttType;
    String? carttMapx;
    String? carttMapy;
    String? carttTawsilTime;
    String? carttTawsilCode;
    String? carttPrice;
    String? carttPrice1;
    String? carttFees;
    String? carttVat;
    String? carttTotal;

    String? carttUserId;
    String? carttUserName;
    String? carttUserPhone;
    String? carttUserEmail;
    String? carttUserCity;
    String? carttUserMapx;
    String? carttUserMapy;

    String? carttDriverId;
    String? carttDriverName;
    String? carttDriverPhone;
    String? carttDriverPhoto;
    String? carttDriverMapx;
    String? carttDriverMapy;
    String? carttDriverRate;

    String? carttMtgerId;
    String? carttMtgerName;
    String? carttMtgerPhone;
    String? carttMtgerPhoto;
    String? carttMtgerMapx;
    String? carttMtgerMapy;
    String? carttMtgerRate;
    String? carttSendToTawsil;


    Order({
        this.carttId,
        this.carttState,
        this.carttDone,
        this.carttPay,
        this.carttFees,
        this.carttVat,
        this.carttTotal,

        this.carttHikal,
        this.carttNumber,
        this.carttDetails1,
        this.carttPhoto1,
        this.carttDetails2,
        this.carttPhoto2,
        this.carttDetails3,
        this.carttPhoto3,

        this.carttDate,
        this.carttTime,
        this.carttAdress,
        this.carttMarka,
        this.carttMarkaName,
        this.carttTypee,
        this.carttTypeeName,
        this.carttModel,
        this.carttModelName,
        this.carttType,
        this.carttMapx,
        this.carttMapy,
        this.carttTawsilTime,
        this.carttTawsilCode,
        this.carttPrice,
        this.carttPrice1,
        this.carttUserId,
        this.carttUserName,
        this.carttUserPhone,
        this.carttUserEmail,
        this.carttUserMapx,
        this.carttUserMapy,
        this.carttUserCity,
        this.carttDriverId,
        this.carttDriverName,
        this.carttDriverPhone,
        this.carttDriverPhoto,
        this.carttDriverMapx,
        this.carttDriverMapy,
        this.carttDriverRate,
        this.carttMtgerId,
        this.carttMtgerName,
        this.carttMtgerPhone,
        this.carttMtgerPhoto,
        this.carttMtgerMapx,
        this.carttMtgerMapy,
        this.carttMtgerRate,
        this.carttSendToTawsil,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        carttId: json["cartt_id"],
        carttState: json["cartt_state"],
        carttDone: json["cartt_done"],
        carttPay: json["cartt_pay"],
        carttFees: json["cartt_fees"],
        carttVat: json["cartt_vat"],
        carttTotal: json["cartt_total"],

        carttHikal: json["cartt_hikal"],
        carttNumber: json["cartt_number"],
        carttDetails1: json["cartt_details1"],
        carttPhoto1: json["cartt_photo1"],
        carttDetails2: json["cartt_details2"],
        carttPhoto2: json["cartt_photo2"],
        carttDetails3: json["cartt_details3"],
        carttPhoto3: json["cartt_photo3"],

        carttDate: json["cartt_date"],
        carttTime: json["cartt_time"],
        carttAdress: json["cartt_adress"],
        carttMarka: json["cartt_marka"],
        carttMarkaName: json["cartt_marka_name"],
        carttTypee: json["cartt_typee"],
        carttTypeeName: json["cartt_typee_name"],
        carttModel: json["cartt_model"],
        carttModelName: json["cartt_model_name"],
        carttType: json["cartt_type"],
        carttMapx: json["cartt_mapx"],
        carttMapy: json["cartt_mapy"],
        carttTawsilTime: json["cartt_tawsil_time"],
        carttTawsilCode: json["cartt_tawsil_code"],
        carttPrice: json["cartt_price"],
        carttPrice1: json["cartt_price1"],
        carttUserId: json["cartt_user_id"],
        carttUserName: json["cartt_user_name"],
        carttUserPhone: json["cartt_user_phone"],
        carttUserEmail: json["cartt_user_email"],
        carttUserCity: json["cartt_user_city"],
        carttUserMapx: json["cartt_user_mapx"],
        carttUserMapy: json["cartt_user_mapy"],
        carttDriverId: json["cartt_driver_id"],
        carttDriverName: json["cartt_driver_name"],
        carttDriverPhone: json["cartt_driver_phone"],
        carttDriverPhoto: json["cartt_driver_photo"],
        carttDriverMapx: json["cartt_driver_mapx"],
        carttDriverMapy: json["cartt_driver_mapy"],
        carttDriverRate: json["cartt_driver_rate"],
        carttMtgerId: json["cartt_mtger_id"],
        carttMtgerName: json["cartt_mtger_name"],
        carttMtgerPhone: json["cartt_mtger_phone"],
        carttMtgerPhoto: json["cartt_mtger_photo"],
        carttMtgerMapx: json["cartt_mtger_mapx"],
        carttMtgerMapy: json["cartt_mtger_mapy"],
        carttMtgerRate: json["cartt_mtger_rate"],
        carttSendToTawsil: json["cartt_sendToTawsil"],
    );

    Map<String, dynamic> toJson() => {
        "cartt_id": carttId,
        "cartt_state": carttState,
        "cartt_done": carttDone,
        "cartt_pay": carttPay,
        "cartt_fees": carttFees,
        "cartt_vat": carttVat,
        "cartt_total": carttTotal,

        "cartt_hikal": carttHikal,
        "cartt_number": carttNumber,
        "cartt_details1": carttDetails1,
        "cartt_photo1": carttPhoto1,
        "cartt_details2": carttDetails2,
        "cartt_photo2": carttPhoto2,
        "cartt_details3": carttDetails3,
        "cartt_photo3": carttPhoto3,

        "cartt_date": carttDate,
        "cartt_time": carttTime,
        "cartt_adress": carttAdress,
        "cartt_marka": carttMarka,
        "cartt_marka_name": carttMarkaName,
        "cartt_typee": carttTypee,
        "cartt_typee_name": carttTypeeName,
        "cartt_model": carttModel,
        "cartt_model_name": carttModelName,
        "cartt_type": carttType,
        "cartt_mapx": carttMapx,
        "cartt_mapy": carttMapy,
        "cartt_tawsil_time": carttTawsilTime,
        "cartt_tawsil_code": carttTawsilCode,
        "cartt_price": carttPrice,
        "cartt_price1": carttPrice1,
        "cartt_user_id": carttUserId,
        "cartt_user_name": carttUserName,
        "cartt_user_phone": carttUserPhone,
        "cartt_user_email": carttUserEmail,
        "cartt_user_city": carttUserCity,
        "cartt_user_mapx": carttUserMapx,
        "cartt_user_mapy": carttUserMapy,
        "cartt_user_mapy": carttUserMapy,
        "cartt_driver_id": carttDriverId,
        "cartt_driver_name": carttDriverName,
        "cartt_driver_phone": carttDriverPhone,
        "cartt_driver_photo": carttDriverPhoto,
        "cartt_driver_mapx": carttDriverMapx,
        "cartt_driver_mapy": carttDriverMapy,
        "cartt_driver_rate": carttDriverRate,
        "cartt_mtger_id": carttMtgerId,
        "cartt_mtger_name": carttMtgerName,
        "cartt_mtger_phone": carttMtgerPhone,
        "cartt_mtger_photo": carttMtgerPhoto,
        "cartt_mtger_mapx": carttMtgerMapx,
        "cartt_mtger_mapy": carttMtgerMapy,
        "cartt_mtger_rate": carttMtgerRate,
        "cartt_sendToTawsil": carttSendToTawsil,
    };
}


