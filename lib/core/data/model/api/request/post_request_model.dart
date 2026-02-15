import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/foundation/formatting/phone_utils.dart';
import 'package:silah_app/core/foundation/formatting/text_util.dart';

import '../../../../domain/entities/api/request/post_request_entity.dart';

part 'post_request_model.mapper.dart';

@MappableClass(ignoreNull: true)
class PostRequestModel with PostRequestModelMappable {
  @MappableField(key: 'langNo')
  final String? langNo;

  @MappableField(key: 'mobileversion')
  final String? mobileVersion;

  @MappableField(key: 'nationality')
  final String? nationality;

  @MappableField(key: 'id_no')
  final String? idNo;

  @MappableField(key: 'p_add')
  final String? address;

  @MappableField(key: 'social')
  final String? socialStatus;

  @MappableField(key: 'cardimg')
  final String? cardImgFront;

  @MappableField(key: 'cardsideimg')
  final String? cardImgBack;

  @MappableField(key: 'custpass')
  final String? custPass;

  @MappableField(key: 'custMobile')
  final String? custMobile;

  @MappableField(key: 'custname')
  final String? custName;

  @MappableField(key: 'notifyConsumer')
  final int? notify;

  @MappableField(key: 'custemail')
  final String? custEmail;

  @MappableField(key: 'custIMEI')
  final String? custIMEI;

  @MappableField(key: 'custbrith')
  final String? custBrith;

  @MappableField(key: 'kyctype')
  final String? kycType;

  @MappableField(key: 'kycvalue')
  final String? kycValue;

  @MappableField(key: 'langid')
  final int? langId;

  @MappableField(key: 'operatorId')
  final String? operatorId;

  @MappableField(key: 'operatortype')
  final String? operatorType;

  @MappableField(key: 'subscriberNo')
  final String? subscriberNo;

  @MappableField(key: 'custPayeeno')
  final String? customerPayeeId;

  @MappableField(key: 'transamounts')
  final String? transAmount;

  @MappableField(key: 'custpin')
  final String? pin;

  @MappableField(key: 'newPIN')
  final String? newPin;

  @MappableField(key: 'otpType')
  final String? otpType;

  @MappableField(key: 'otpcode')
  final String? otp;

  @MappableField(key: 'codeName')
  final String? codeName;

  @MappableField(key: 'ipc')
  final String? ipc;

  @MappableField(key: 'PRN')
  final String? prn;

  @MappableField(key: 'destinationmobile')
  final String? destinationMobile;

  @MappableField(key: 'newPass')
  final String? newPass;

  @MappableField(key: 'authType')
  final String? authType;

  @MappableField(key: 'transactionId')
  final String? transactionId;

  @MappableField(key: 'serviceCode')
  final String? serviceCode;

  @MappableField(key: 'subcat')
  final String? subcat;

  @MappableField(key: 'transtype')
  final String? transType;

  @MappableField(key: 'rate')
  final int? rate;

  @MappableField(key: 'notes')
  final String? notes;

  @MappableField(key: 'senderCardid')
  final String? personalNumber;

  @MappableField(key: 'govCode')
  final int? govCode;

  @MappableField(key: 'dev_na')
  final String? devName;

  @MappableField(key: 'dev_mo')
  final String? devType;

  @MappableField(key: 'dev_ver')
  final String? devVersion;

  @MappableField(key: 'mercode')
  final String? merCode;

  @MappableField(key: 'ref_no')
  final String? refNo;

  @MappableField(key: 'p_note')
  final String? pNote;

  @MappableField(key: 'offerid')
  final String? offerId;

  @MappableField(key: 'note_tr')
  final String? smNotes;

  @MappableField(key: 'cityno')
  final String? cityNo;

  @MappableField(key: 'net_no')
  final String? netNo;

  @MappableField(key: 'rem_no')
  final String? remNo;

  @MappableField(key: 'fee_amt')
  final double? feeAmt;

  @MappableField(key: 'rem_purpose')
  final String? remPurpose;

  @MappableField(key: 'activetype')
  final String? activeType;

  @MappableField(key: 'optype')
  final String? opType;

  @MappableField(key: 'cvv')
  final String? cvv;

  @MappableField(key: 'firstRec')
  final int? firstRec;

  @MappableField(key: 'lastRec')
  final int? lastRec;

  @MappableField(key: 'firstRow')
  final int? firstRow;

  @MappableField(key: 'lastRow')
  final int? lastRow;

  @MappableField(key: 'company_no')
  final String? companyNo;

  @MappableField(key: 'cat_no')
  final String? categoryNo;

  @MappableField(key: 'extmsg')
  final String? extraMessage;

  @MappableField(key: 'first_name')
  final String? firstName;

  @MappableField(key: 'second_name')
  final String? secondName;

  @MappableField(key: 'third_name')
  final String? thirdName;

  @MappableField(key: 'last_name')
  final String? lastName;

  @MappableField(key: 'email')
  final String? email;

  @MappableField(key: 'address')
  final String? cardAddress;

  @MappableField(key: 'card_type')
  final String? cardType;

  @MappableField(key: 'card_no')
  final String? cardNo;

  @MappableField(key: 'card_status')
  final String? cardStatus;

  @MappableField(key: 'fromdate')
  final String? fromDate;

  @MappableField(key: 'todate')
  final String? toDate;

  @MappableField(key: 'card_limit')
  final String? cardLimit;

  @MappableField(key: 'card_exp')
  final String? cardExpiry;

  @MappableField(key: 'targetno')
  final String? targetNo;

  @MappableField(key: 'deviceSerial')
  final String? deviceSerial;

  @MappableField(key: 'extmsg')
  final String? extmsg;

  const PostRequestModel({
    this.langNo,
    this.mobileVersion,
    this.nationality,
    this.idNo,
    this.address,
    this.socialStatus,
    this.cardImgFront,
    this.cardImgBack,
    this.custPass,
    this.custMobile,
    this.custName,
    this.notify,
    this.custEmail,
    this.custIMEI,
    this.custBrith,
    this.kycType,
    this.kycValue,
    this.langId,
    this.operatorId,
    this.operatorType,
    this.subscriberNo,
    this.customerPayeeId,
    this.extmsg,

    this.transAmount,
    this.pin,
    this.newPin,
    this.otpType,
    this.otp,
    this.codeName,
    this.ipc,
    this.prn,
    this.destinationMobile,
    this.newPass,
    this.authType,
    this.transactionId,
    this.serviceCode,
    this.subcat,
    this.transType,
    this.rate,
    this.notes,
    this.personalNumber,
    this.govCode,
    this.devName,
    this.devType,
    this.devVersion,
    this.merCode,
    this.refNo,
    this.pNote,
    this.offerId,
    this.smNotes,
    this.cityNo,
    this.netNo,
    this.remNo,
    this.feeAmt,
    this.remPurpose,
    this.activeType,
    this.opType,
    this.cvv,
    this.firstRec,
    this.lastRec,
    this.firstRow,
    this.lastRow,
    this.companyNo,
    this.categoryNo,
    this.extraMessage,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.lastName,
    this.email,
    this.cardAddress,
    this.cardType,
    this.cardNo,
    this.cardStatus,
    this.fromDate,
    this.toDate,
    this.cardLimit,
    this.cardExpiry,
    this.targetNo,
    this.deviceSerial,
  });

  factory PostRequestModel.fromEntity(PostRequestEntity entity) {
    return PostRequestModel(
      langNo: entity.langNo,
      nationality: entity.nationality,
      idNo: entity.idNo,
      address: entity.address,
      socialStatus: entity.socialStatus,
      cardImgFront: entity.cardImgFront,
      cardImgBack: entity.cardImgBack,
      custPass: entity.custPass,
      custMobile: entity.custMobile?.normalizePhone(),
      custName: entity.custName,
      notify: entity.notify,
      custEmail: entity.custEmail,
      custBrith: entity.custBrith,
      kycType: entity.kycType,
      kycValue: entity.kycValue,
      langId: entity.langId,
      operatorId: entity.operatorId,
      operatorType: entity.operatorType,
      subscriberNo: entity.subscriberNo,
      customerPayeeId: entity.customerPayeeId,
      transAmount: entity.transAmount,
      pin: entity.pin,
      newPin: entity.newPin,
      otpType: entity.otpType,
      otp: entity.otp,
      codeName: entity.codeName,
      ipc: entity.ipc,
      prn: entity.prn,
      destinationMobile: entity.destinationMobile?.normalizePhone(),
      newPass: entity.newPass,
      authType: entity.authType,
      transactionId: entity.transactionId,
      serviceCode: entity.serviceCode,
      subcat: entity.subcat,
      transType: entity.transType,
      rate: entity.rate,
      personalNumber: entity.personalNumber,
      govCode: entity.govCode,
      devName: entity.devName,
      merCode: entity.merCode,
      refNo: entity.refNo,
      offerId: entity.offerId,
      cityNo: entity.cityNo,
      netNo: entity.netNo,
      notes: entity.notes.sanitizeNoteText(),
      pNote: entity.pNote.sanitizeNoteText(),
      smNotes: entity.smNotes.sanitizeNoteText(),

      remNo: entity.remNo,
      feeAmt: entity.feeAmt,
      remPurpose: entity.remPurpose,
      activeType: entity.activeType,
      opType: entity.opType,
      cvv: entity.cvv,
      firstRec: entity.firstRec,
      lastRec: entity.lastRec,
      firstRow: entity.firstRow,
      lastRow: entity.lastRow,
      companyNo: entity.companyNo,
      categoryNo: entity.categoryNo,
      extraMessage: entity.extraMessage,
      firstName: entity.firstName,
      secondName: entity.secondName,
      thirdName: entity.thirdName,
      lastName: entity.lastName,
      email: entity.email,
      cardAddress: entity.cardAddress,
      cardType: entity.cardType,
      cardNo: entity.cardNo,
      cardStatus: entity.cardStatus,
      fromDate: entity.fromDate,
      toDate: entity.toDate,
      cardLimit: entity.cardLimit,
      cardExpiry: entity.cardExpiry,
      targetNo: entity.targetNo,
      extmsg: entity.extmsg,
    );
  }

  PostRequestEntity toEntity() => PostRequestEntity(
    langNo: langNo,

    nationality: nationality,
    idNo: idNo,
    address: address,
    socialStatus: socialStatus,
    cardImgFront: cardImgFront,
    cardImgBack: cardImgBack,
    custPass: custPass,
    custMobile: custMobile?.normalizePhone(),
    custName: custName,
    notify: notify,
    custEmail: custEmail,
    custBrith: custBrith,
    kycType: kycType,
    kycValue: kycValue,
    langId: langId,
    operatorId: operatorId,
    operatorType: operatorType,
    subscriberNo: subscriberNo,
    customerPayeeId: customerPayeeId,
    transAmount: transAmount,
    pin: pin,
    newPin: newPin,
    otpType: otpType,
    otp: otp,
    codeName: codeName,
    ipc: ipc,
    prn: prn,
    destinationMobile: destinationMobile?.normalizePhone(),
    newPass: newPass,
    authType: authType,
    transactionId: transactionId,
    serviceCode: serviceCode,
    subcat: subcat,
    transType: transType,
    rate: rate,
    notes: notes,
    personalNumber: personalNumber,
    govCode: govCode,
    devName: devName,
    merCode: merCode,
    refNo: refNo,
    pNote: pNote,
    offerId: offerId,
    smNotes: smNotes,
    cityNo: cityNo,
    netNo: netNo,
    remNo: remNo,
    feeAmt: feeAmt,
    remPurpose: remPurpose,
    activeType: activeType,
    opType: opType,
    cvv: cvv,
    firstRec: firstRec,
    lastRec: lastRec,
    firstRow: firstRow,
    lastRow: lastRow,
    companyNo: companyNo,
    categoryNo: categoryNo,
    extraMessage: extraMessage,
    firstName: firstName,
    extmsg: extmsg,

    secondName: secondName,
    thirdName: thirdName,
    lastName: lastName,
    email: email,
    cardAddress: cardAddress,
    cardType: cardType,
    cardNo: cardNo,
    cardStatus: cardStatus,
    fromDate: fromDate,
    toDate: toDate,
    cardLimit: cardLimit,
    cardExpiry: cardExpiry,
    targetNo: targetNo,
  );
}
