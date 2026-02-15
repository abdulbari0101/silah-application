import 'package:dart_mappable/dart_mappable.dart';

part 'post_request_entity.mapper.dart';

@MappableClass()
class PostRequestEntity with PostRequestEntityMappable {
  final String? langNo;
  final String? nationality;
  final String? idNo;
  final String? address;
  final String? socialStatus;
  final String? cardImgFront;
  final String? cardImgBack;
  final String? custPass;
  final String? custMobile;
  final String? custName;
  final int? notify;
  final String? custEmail;
  final String? custBrith;
  final String? kycType;
  final String? kycValue;
  final int? langId;
  final String? operatorId;
  final String? operatorType;
  final String? subscriberNo;
  final String? customerPayeeId;
  final String? transAmount;
  final String? pin;
  final String? newPin;
  final String? otpType;
  final String? otp;
  final String? codeName;
  final String? ipc;
  final String? prn;
  final String? destinationMobile;
  final String? newPass;
  final String? authType;
  final String? transactionId;
  final String? serviceCode;
  final String? subcat;
  final String? transType;
  final int? rate;
  final String? notes;
  final String? personalNumber;
  final int? govCode;
  final String? devName;
  final String? merCode;
  final String? refNo;
  final String? pNote;
  final String? offerId;
  final String? smNotes;
  final String? cityNo;
  final String? netNo;
  final String? remNo;
  final double? feeAmt;
  final String? remPurpose;
  final String? activeType;
  final String? opType;
  final String? cvv;
  final int? firstRec;
  final int? lastRec;
  final int? firstRow;
  final int? lastRow;
  final String? companyNo;
  final String? categoryNo;
  final String? extraMessage;
  final String? firstName;
  final String? secondName;
  final String? thirdName;
  final String? lastName;
  final String? email;
  final String? cardAddress;
  final String? cardType;
  final String? cardNo;
  final String? cardStatus;
  final String? fromDate;
  final String? toDate;
  final String? cardLimit;
  final String? cardExpiry;
  final String? targetNo;
  final String? extmsg;

  // add her the new

  const PostRequestEntity({
    this.langNo,
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
    this.custBrith,
    this.kycType,
    this.kycValue,
    this.langId,
    this.operatorId,
    this.operatorType,
    this.subscriberNo,
    this.customerPayeeId,
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
    this.extmsg,

  });

  @override
  String toString() {
    return 'PostRequestEntity(${toJson()})';
  }
}
