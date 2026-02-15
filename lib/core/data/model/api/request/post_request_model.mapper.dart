// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post_request_model.dart';

class PostRequestModelMapper extends ClassMapperBase<PostRequestModel> {
  PostRequestModelMapper._();

  static PostRequestModelMapper? _instance;
  static PostRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostRequestModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PostRequestModel';

  static String? _$langNo(PostRequestModel v) => v.langNo;
  static const Field<PostRequestModel, String> _f$langNo = Field(
    'langNo',
    _$langNo,
    opt: true,
  );
  static String? _$mobileVersion(PostRequestModel v) => v.mobileVersion;
  static const Field<PostRequestModel, String> _f$mobileVersion = Field(
    'mobileVersion',
    _$mobileVersion,
    key: r'mobileversion',
    opt: true,
  );
  static String? _$nationality(PostRequestModel v) => v.nationality;
  static const Field<PostRequestModel, String> _f$nationality = Field(
    'nationality',
    _$nationality,
    opt: true,
  );
  static String? _$idNo(PostRequestModel v) => v.idNo;
  static const Field<PostRequestModel, String> _f$idNo = Field(
    'idNo',
    _$idNo,
    key: r'id_no',
    opt: true,
  );
  static String? _$address(PostRequestModel v) => v.address;
  static const Field<PostRequestModel, String> _f$address = Field(
    'address',
    _$address,
    key: r'p_add',
    opt: true,
  );
  static String? _$socialStatus(PostRequestModel v) => v.socialStatus;
  static const Field<PostRequestModel, String> _f$socialStatus = Field(
    'socialStatus',
    _$socialStatus,
    key: r'social',
    opt: true,
  );
  static String? _$cardImgFront(PostRequestModel v) => v.cardImgFront;
  static const Field<PostRequestModel, String> _f$cardImgFront = Field(
    'cardImgFront',
    _$cardImgFront,
    key: r'cardimg',
    opt: true,
  );
  static String? _$cardImgBack(PostRequestModel v) => v.cardImgBack;
  static const Field<PostRequestModel, String> _f$cardImgBack = Field(
    'cardImgBack',
    _$cardImgBack,
    key: r'cardsideimg',
    opt: true,
  );
  static String? _$custPass(PostRequestModel v) => v.custPass;
  static const Field<PostRequestModel, String> _f$custPass = Field(
    'custPass',
    _$custPass,
    key: r'custpass',
    opt: true,
  );
  static String? _$custMobile(PostRequestModel v) => v.custMobile;
  static const Field<PostRequestModel, String> _f$custMobile = Field(
    'custMobile',
    _$custMobile,
    opt: true,
  );
  static String? _$custName(PostRequestModel v) => v.custName;
  static const Field<PostRequestModel, String> _f$custName = Field(
    'custName',
    _$custName,
    key: r'custname',
    opt: true,
  );
  static int? _$notify(PostRequestModel v) => v.notify;
  static const Field<PostRequestModel, int> _f$notify = Field(
    'notify',
    _$notify,
    key: r'notifyConsumer',
    opt: true,
  );
  static String? _$custEmail(PostRequestModel v) => v.custEmail;
  static const Field<PostRequestModel, String> _f$custEmail = Field(
    'custEmail',
    _$custEmail,
    key: r'custemail',
    opt: true,
  );
  static String? _$custIMEI(PostRequestModel v) => v.custIMEI;
  static const Field<PostRequestModel, String> _f$custIMEI = Field(
    'custIMEI',
    _$custIMEI,
    opt: true,
  );
  static String? _$custBrith(PostRequestModel v) => v.custBrith;
  static const Field<PostRequestModel, String> _f$custBrith = Field(
    'custBrith',
    _$custBrith,
    key: r'custbrith',
    opt: true,
  );
  static String? _$kycType(PostRequestModel v) => v.kycType;
  static const Field<PostRequestModel, String> _f$kycType = Field(
    'kycType',
    _$kycType,
    key: r'kyctype',
    opt: true,
  );
  static String? _$kycValue(PostRequestModel v) => v.kycValue;
  static const Field<PostRequestModel, String> _f$kycValue = Field(
    'kycValue',
    _$kycValue,
    key: r'kycvalue',
    opt: true,
  );
  static int? _$langId(PostRequestModel v) => v.langId;
  static const Field<PostRequestModel, int> _f$langId = Field(
    'langId',
    _$langId,
    key: r'langid',
    opt: true,
  );
  static String? _$operatorId(PostRequestModel v) => v.operatorId;
  static const Field<PostRequestModel, String> _f$operatorId = Field(
    'operatorId',
    _$operatorId,
    opt: true,
  );
  static String? _$operatorType(PostRequestModel v) => v.operatorType;
  static const Field<PostRequestModel, String> _f$operatorType = Field(
    'operatorType',
    _$operatorType,
    key: r'operatortype',
    opt: true,
  );
  static String? _$subscriberNo(PostRequestModel v) => v.subscriberNo;
  static const Field<PostRequestModel, String> _f$subscriberNo = Field(
    'subscriberNo',
    _$subscriberNo,
    opt: true,
  );
  static String? _$customerPayeeId(PostRequestModel v) => v.customerPayeeId;
  static const Field<PostRequestModel, String> _f$customerPayeeId = Field(
    'customerPayeeId',
    _$customerPayeeId,
    key: r'custPayeeno',
    opt: true,
  );
  static String? _$extmsg(PostRequestModel v) => v.extmsg;
  static const Field<PostRequestModel, String> _f$extmsg = Field(
    'extmsg',
    _$extmsg,
    opt: true,
  );
  static String? _$transAmount(PostRequestModel v) => v.transAmount;
  static const Field<PostRequestModel, String> _f$transAmount = Field(
    'transAmount',
    _$transAmount,
    key: r'transamounts',
    opt: true,
  );
  static String? _$pin(PostRequestModel v) => v.pin;
  static const Field<PostRequestModel, String> _f$pin = Field(
    'pin',
    _$pin,
    key: r'custpin',
    opt: true,
  );
  static String? _$newPin(PostRequestModel v) => v.newPin;
  static const Field<PostRequestModel, String> _f$newPin = Field(
    'newPin',
    _$newPin,
    key: r'newPIN',
    opt: true,
  );
  static String? _$otpType(PostRequestModel v) => v.otpType;
  static const Field<PostRequestModel, String> _f$otpType = Field(
    'otpType',
    _$otpType,
    opt: true,
  );
  static String? _$otp(PostRequestModel v) => v.otp;
  static const Field<PostRequestModel, String> _f$otp = Field(
    'otp',
    _$otp,
    key: r'otpcode',
    opt: true,
  );
  static String? _$codeName(PostRequestModel v) => v.codeName;
  static const Field<PostRequestModel, String> _f$codeName = Field(
    'codeName',
    _$codeName,
    opt: true,
  );
  static String? _$ipc(PostRequestModel v) => v.ipc;
  static const Field<PostRequestModel, String> _f$ipc = Field(
    'ipc',
    _$ipc,
    opt: true,
  );
  static String? _$prn(PostRequestModel v) => v.prn;
  static const Field<PostRequestModel, String> _f$prn = Field(
    'prn',
    _$prn,
    key: r'PRN',
    opt: true,
  );
  static String? _$destinationMobile(PostRequestModel v) => v.destinationMobile;
  static const Field<PostRequestModel, String> _f$destinationMobile = Field(
    'destinationMobile',
    _$destinationMobile,
    key: r'destinationmobile',
    opt: true,
  );
  static String? _$newPass(PostRequestModel v) => v.newPass;
  static const Field<PostRequestModel, String> _f$newPass = Field(
    'newPass',
    _$newPass,
    opt: true,
  );
  static String? _$authType(PostRequestModel v) => v.authType;
  static const Field<PostRequestModel, String> _f$authType = Field(
    'authType',
    _$authType,
    opt: true,
  );
  static String? _$transactionId(PostRequestModel v) => v.transactionId;
  static const Field<PostRequestModel, String> _f$transactionId = Field(
    'transactionId',
    _$transactionId,
    opt: true,
  );
  static String? _$serviceCode(PostRequestModel v) => v.serviceCode;
  static const Field<PostRequestModel, String> _f$serviceCode = Field(
    'serviceCode',
    _$serviceCode,
    opt: true,
  );
  static String? _$subcat(PostRequestModel v) => v.subcat;
  static const Field<PostRequestModel, String> _f$subcat = Field(
    'subcat',
    _$subcat,
    opt: true,
  );
  static String? _$transType(PostRequestModel v) => v.transType;
  static const Field<PostRequestModel, String> _f$transType = Field(
    'transType',
    _$transType,
    key: r'transtype',
    opt: true,
  );
  static int? _$rate(PostRequestModel v) => v.rate;
  static const Field<PostRequestModel, int> _f$rate = Field(
    'rate',
    _$rate,
    opt: true,
  );
  static String? _$notes(PostRequestModel v) => v.notes;
  static const Field<PostRequestModel, String> _f$notes = Field(
    'notes',
    _$notes,
    opt: true,
  );
  static String? _$personalNumber(PostRequestModel v) => v.personalNumber;
  static const Field<PostRequestModel, String> _f$personalNumber = Field(
    'personalNumber',
    _$personalNumber,
    key: r'senderCardid',
    opt: true,
  );
  static int? _$govCode(PostRequestModel v) => v.govCode;
  static const Field<PostRequestModel, int> _f$govCode = Field(
    'govCode',
    _$govCode,
    opt: true,
  );
  static String? _$devName(PostRequestModel v) => v.devName;
  static const Field<PostRequestModel, String> _f$devName = Field(
    'devName',
    _$devName,
    key: r'dev_na',
    opt: true,
  );
  static String? _$devType(PostRequestModel v) => v.devType;
  static const Field<PostRequestModel, String> _f$devType = Field(
    'devType',
    _$devType,
    key: r'dev_mo',
    opt: true,
  );
  static String? _$devVersion(PostRequestModel v) => v.devVersion;
  static const Field<PostRequestModel, String> _f$devVersion = Field(
    'devVersion',
    _$devVersion,
    key: r'dev_ver',
    opt: true,
  );
  static String? _$merCode(PostRequestModel v) => v.merCode;
  static const Field<PostRequestModel, String> _f$merCode = Field(
    'merCode',
    _$merCode,
    key: r'mercode',
    opt: true,
  );
  static String? _$refNo(PostRequestModel v) => v.refNo;
  static const Field<PostRequestModel, String> _f$refNo = Field(
    'refNo',
    _$refNo,
    key: r'ref_no',
    opt: true,
  );
  static String? _$pNote(PostRequestModel v) => v.pNote;
  static const Field<PostRequestModel, String> _f$pNote = Field(
    'pNote',
    _$pNote,
    key: r'p_note',
    opt: true,
  );
  static String? _$offerId(PostRequestModel v) => v.offerId;
  static const Field<PostRequestModel, String> _f$offerId = Field(
    'offerId',
    _$offerId,
    key: r'offerid',
    opt: true,
  );
  static String? _$smNotes(PostRequestModel v) => v.smNotes;
  static const Field<PostRequestModel, String> _f$smNotes = Field(
    'smNotes',
    _$smNotes,
    key: r'note_tr',
    opt: true,
  );
  static String? _$cityNo(PostRequestModel v) => v.cityNo;
  static const Field<PostRequestModel, String> _f$cityNo = Field(
    'cityNo',
    _$cityNo,
    key: r'cityno',
    opt: true,
  );
  static String? _$netNo(PostRequestModel v) => v.netNo;
  static const Field<PostRequestModel, String> _f$netNo = Field(
    'netNo',
    _$netNo,
    key: r'net_no',
    opt: true,
  );
  static String? _$remNo(PostRequestModel v) => v.remNo;
  static const Field<PostRequestModel, String> _f$remNo = Field(
    'remNo',
    _$remNo,
    key: r'rem_no',
    opt: true,
  );
  static double? _$feeAmt(PostRequestModel v) => v.feeAmt;
  static const Field<PostRequestModel, double> _f$feeAmt = Field(
    'feeAmt',
    _$feeAmt,
    key: r'fee_amt',
    opt: true,
  );
  static String? _$remPurpose(PostRequestModel v) => v.remPurpose;
  static const Field<PostRequestModel, String> _f$remPurpose = Field(
    'remPurpose',
    _$remPurpose,
    key: r'rem_purpose',
    opt: true,
  );
  static String? _$activeType(PostRequestModel v) => v.activeType;
  static const Field<PostRequestModel, String> _f$activeType = Field(
    'activeType',
    _$activeType,
    key: r'activetype',
    opt: true,
  );
  static String? _$opType(PostRequestModel v) => v.opType;
  static const Field<PostRequestModel, String> _f$opType = Field(
    'opType',
    _$opType,
    key: r'optype',
    opt: true,
  );
  static String? _$cvv(PostRequestModel v) => v.cvv;
  static const Field<PostRequestModel, String> _f$cvv = Field(
    'cvv',
    _$cvv,
    opt: true,
  );
  static int? _$firstRec(PostRequestModel v) => v.firstRec;
  static const Field<PostRequestModel, int> _f$firstRec = Field(
    'firstRec',
    _$firstRec,
    opt: true,
  );
  static int? _$lastRec(PostRequestModel v) => v.lastRec;
  static const Field<PostRequestModel, int> _f$lastRec = Field(
    'lastRec',
    _$lastRec,
    opt: true,
  );
  static int? _$firstRow(PostRequestModel v) => v.firstRow;
  static const Field<PostRequestModel, int> _f$firstRow = Field(
    'firstRow',
    _$firstRow,
    opt: true,
  );
  static int? _$lastRow(PostRequestModel v) => v.lastRow;
  static const Field<PostRequestModel, int> _f$lastRow = Field(
    'lastRow',
    _$lastRow,
    opt: true,
  );
  static String? _$companyNo(PostRequestModel v) => v.companyNo;
  static const Field<PostRequestModel, String> _f$companyNo = Field(
    'companyNo',
    _$companyNo,
    key: r'company_no',
    opt: true,
  );
  static String? _$categoryNo(PostRequestModel v) => v.categoryNo;
  static const Field<PostRequestModel, String> _f$categoryNo = Field(
    'categoryNo',
    _$categoryNo,
    key: r'cat_no',
    opt: true,
  );
  static String? _$extraMessage(PostRequestModel v) => v.extraMessage;
  static const Field<PostRequestModel, String> _f$extraMessage = Field(
    'extraMessage',
    _$extraMessage,
    key: r'extmsg',
    opt: true,
  );
  static String? _$firstName(PostRequestModel v) => v.firstName;
  static const Field<PostRequestModel, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
    opt: true,
  );
  static String? _$secondName(PostRequestModel v) => v.secondName;
  static const Field<PostRequestModel, String> _f$secondName = Field(
    'secondName',
    _$secondName,
    key: r'second_name',
    opt: true,
  );
  static String? _$thirdName(PostRequestModel v) => v.thirdName;
  static const Field<PostRequestModel, String> _f$thirdName = Field(
    'thirdName',
    _$thirdName,
    key: r'third_name',
    opt: true,
  );
  static String? _$lastName(PostRequestModel v) => v.lastName;
  static const Field<PostRequestModel, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    key: r'last_name',
    opt: true,
  );
  static String? _$email(PostRequestModel v) => v.email;
  static const Field<PostRequestModel, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$cardAddress(PostRequestModel v) => v.cardAddress;
  static const Field<PostRequestModel, String> _f$cardAddress = Field(
    'cardAddress',
    _$cardAddress,
    key: r'address',
    opt: true,
  );
  static String? _$cardType(PostRequestModel v) => v.cardType;
  static const Field<PostRequestModel, String> _f$cardType = Field(
    'cardType',
    _$cardType,
    key: r'card_type',
    opt: true,
  );
  static String? _$cardNo(PostRequestModel v) => v.cardNo;
  static const Field<PostRequestModel, String> _f$cardNo = Field(
    'cardNo',
    _$cardNo,
    key: r'card_no',
    opt: true,
  );
  static String? _$cardStatus(PostRequestModel v) => v.cardStatus;
  static const Field<PostRequestModel, String> _f$cardStatus = Field(
    'cardStatus',
    _$cardStatus,
    key: r'card_status',
    opt: true,
  );
  static String? _$fromDate(PostRequestModel v) => v.fromDate;
  static const Field<PostRequestModel, String> _f$fromDate = Field(
    'fromDate',
    _$fromDate,
    key: r'fromdate',
    opt: true,
  );
  static String? _$toDate(PostRequestModel v) => v.toDate;
  static const Field<PostRequestModel, String> _f$toDate = Field(
    'toDate',
    _$toDate,
    key: r'todate',
    opt: true,
  );
  static String? _$cardLimit(PostRequestModel v) => v.cardLimit;
  static const Field<PostRequestModel, String> _f$cardLimit = Field(
    'cardLimit',
    _$cardLimit,
    key: r'card_limit',
    opt: true,
  );
  static String? _$cardExpiry(PostRequestModel v) => v.cardExpiry;
  static const Field<PostRequestModel, String> _f$cardExpiry = Field(
    'cardExpiry',
    _$cardExpiry,
    key: r'card_exp',
    opt: true,
  );
  static String? _$targetNo(PostRequestModel v) => v.targetNo;
  static const Field<PostRequestModel, String> _f$targetNo = Field(
    'targetNo',
    _$targetNo,
    key: r'targetno',
    opt: true,
  );
  static String? _$deviceSerial(PostRequestModel v) => v.deviceSerial;
  static const Field<PostRequestModel, String> _f$deviceSerial = Field(
    'deviceSerial',
    _$deviceSerial,
    opt: true,
  );

  @override
  final MappableFields<PostRequestModel> fields = const {
    #langNo: _f$langNo,
    #mobileVersion: _f$mobileVersion,
    #nationality: _f$nationality,
    #idNo: _f$idNo,
    #address: _f$address,
    #socialStatus: _f$socialStatus,
    #cardImgFront: _f$cardImgFront,
    #cardImgBack: _f$cardImgBack,
    #custPass: _f$custPass,
    #custMobile: _f$custMobile,
    #custName: _f$custName,
    #notify: _f$notify,
    #custEmail: _f$custEmail,
    #custIMEI: _f$custIMEI,
    #custBrith: _f$custBrith,
    #kycType: _f$kycType,
    #kycValue: _f$kycValue,
    #langId: _f$langId,
    #operatorId: _f$operatorId,
    #operatorType: _f$operatorType,
    #subscriberNo: _f$subscriberNo,
    #customerPayeeId: _f$customerPayeeId,
    #extmsg: _f$extmsg,
    #transAmount: _f$transAmount,
    #pin: _f$pin,
    #newPin: _f$newPin,
    #otpType: _f$otpType,
    #otp: _f$otp,
    #codeName: _f$codeName,
    #ipc: _f$ipc,
    #prn: _f$prn,
    #destinationMobile: _f$destinationMobile,
    #newPass: _f$newPass,
    #authType: _f$authType,
    #transactionId: _f$transactionId,
    #serviceCode: _f$serviceCode,
    #subcat: _f$subcat,
    #transType: _f$transType,
    #rate: _f$rate,
    #notes: _f$notes,
    #personalNumber: _f$personalNumber,
    #govCode: _f$govCode,
    #devName: _f$devName,
    #devType: _f$devType,
    #devVersion: _f$devVersion,
    #merCode: _f$merCode,
    #refNo: _f$refNo,
    #pNote: _f$pNote,
    #offerId: _f$offerId,
    #smNotes: _f$smNotes,
    #cityNo: _f$cityNo,
    #netNo: _f$netNo,
    #remNo: _f$remNo,
    #feeAmt: _f$feeAmt,
    #remPurpose: _f$remPurpose,
    #activeType: _f$activeType,
    #opType: _f$opType,
    #cvv: _f$cvv,
    #firstRec: _f$firstRec,
    #lastRec: _f$lastRec,
    #firstRow: _f$firstRow,
    #lastRow: _f$lastRow,
    #companyNo: _f$companyNo,
    #categoryNo: _f$categoryNo,
    #extraMessage: _f$extraMessage,
    #firstName: _f$firstName,
    #secondName: _f$secondName,
    #thirdName: _f$thirdName,
    #lastName: _f$lastName,
    #email: _f$email,
    #cardAddress: _f$cardAddress,
    #cardType: _f$cardType,
    #cardNo: _f$cardNo,
    #cardStatus: _f$cardStatus,
    #fromDate: _f$fromDate,
    #toDate: _f$toDate,
    #cardLimit: _f$cardLimit,
    #cardExpiry: _f$cardExpiry,
    #targetNo: _f$targetNo,
    #deviceSerial: _f$deviceSerial,
  };
  @override
  final bool ignoreNull = true;

  static PostRequestModel _instantiate(DecodingData data) {
    return PostRequestModel(
      langNo: data.dec(_f$langNo),
      mobileVersion: data.dec(_f$mobileVersion),
      nationality: data.dec(_f$nationality),
      idNo: data.dec(_f$idNo),
      address: data.dec(_f$address),
      socialStatus: data.dec(_f$socialStatus),
      cardImgFront: data.dec(_f$cardImgFront),
      cardImgBack: data.dec(_f$cardImgBack),
      custPass: data.dec(_f$custPass),
      custMobile: data.dec(_f$custMobile),
      custName: data.dec(_f$custName),
      notify: data.dec(_f$notify),
      custEmail: data.dec(_f$custEmail),
      custIMEI: data.dec(_f$custIMEI),
      custBrith: data.dec(_f$custBrith),
      kycType: data.dec(_f$kycType),
      kycValue: data.dec(_f$kycValue),
      langId: data.dec(_f$langId),
      operatorId: data.dec(_f$operatorId),
      operatorType: data.dec(_f$operatorType),
      subscriberNo: data.dec(_f$subscriberNo),
      customerPayeeId: data.dec(_f$customerPayeeId),
      extmsg: data.dec(_f$extmsg),
      transAmount: data.dec(_f$transAmount),
      pin: data.dec(_f$pin),
      newPin: data.dec(_f$newPin),
      otpType: data.dec(_f$otpType),
      otp: data.dec(_f$otp),
      codeName: data.dec(_f$codeName),
      ipc: data.dec(_f$ipc),
      prn: data.dec(_f$prn),
      destinationMobile: data.dec(_f$destinationMobile),
      newPass: data.dec(_f$newPass),
      authType: data.dec(_f$authType),
      transactionId: data.dec(_f$transactionId),
      serviceCode: data.dec(_f$serviceCode),
      subcat: data.dec(_f$subcat),
      transType: data.dec(_f$transType),
      rate: data.dec(_f$rate),
      notes: data.dec(_f$notes),
      personalNumber: data.dec(_f$personalNumber),
      govCode: data.dec(_f$govCode),
      devName: data.dec(_f$devName),
      devType: data.dec(_f$devType),
      devVersion: data.dec(_f$devVersion),
      merCode: data.dec(_f$merCode),
      refNo: data.dec(_f$refNo),
      pNote: data.dec(_f$pNote),
      offerId: data.dec(_f$offerId),
      smNotes: data.dec(_f$smNotes),
      cityNo: data.dec(_f$cityNo),
      netNo: data.dec(_f$netNo),
      remNo: data.dec(_f$remNo),
      feeAmt: data.dec(_f$feeAmt),
      remPurpose: data.dec(_f$remPurpose),
      activeType: data.dec(_f$activeType),
      opType: data.dec(_f$opType),
      cvv: data.dec(_f$cvv),
      firstRec: data.dec(_f$firstRec),
      lastRec: data.dec(_f$lastRec),
      firstRow: data.dec(_f$firstRow),
      lastRow: data.dec(_f$lastRow),
      companyNo: data.dec(_f$companyNo),
      categoryNo: data.dec(_f$categoryNo),
      extraMessage: data.dec(_f$extraMessage),
      firstName: data.dec(_f$firstName),
      secondName: data.dec(_f$secondName),
      thirdName: data.dec(_f$thirdName),
      lastName: data.dec(_f$lastName),
      email: data.dec(_f$email),
      cardAddress: data.dec(_f$cardAddress),
      cardType: data.dec(_f$cardType),
      cardNo: data.dec(_f$cardNo),
      cardStatus: data.dec(_f$cardStatus),
      fromDate: data.dec(_f$fromDate),
      toDate: data.dec(_f$toDate),
      cardLimit: data.dec(_f$cardLimit),
      cardExpiry: data.dec(_f$cardExpiry),
      targetNo: data.dec(_f$targetNo),
      deviceSerial: data.dec(_f$deviceSerial),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PostRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PostRequestModel>(map);
  }

  static PostRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<PostRequestModel>(json);
  }
}

mixin PostRequestModelMappable {
  String toJsonString() {
    return PostRequestModelMapper.ensureInitialized()
        .encodeJson<PostRequestModel>(this as PostRequestModel);
  }

  Map<String, dynamic> toJson() {
    return PostRequestModelMapper.ensureInitialized()
        .encodeMap<PostRequestModel>(this as PostRequestModel);
  }

  PostRequestModelCopyWith<PostRequestModel, PostRequestModel, PostRequestModel>
  get copyWith =>
      _PostRequestModelCopyWithImpl<PostRequestModel, PostRequestModel>(
        this as PostRequestModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PostRequestModelMapper.ensureInitialized().stringifyValue(
      this as PostRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return PostRequestModelMapper.ensureInitialized().equalsValue(
      this as PostRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return PostRequestModelMapper.ensureInitialized().hashValue(
      this as PostRequestModel,
    );
  }
}

extension PostRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PostRequestModel, $Out> {
  PostRequestModelCopyWith<$R, PostRequestModel, $Out>
  get $asPostRequestModel =>
      $base.as((v, t, t2) => _PostRequestModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PostRequestModelCopyWith<$R, $In extends PostRequestModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? langNo,
    String? mobileVersion,
    String? nationality,
    String? idNo,
    String? address,
    String? socialStatus,
    String? cardImgFront,
    String? cardImgBack,
    String? custPass,
    String? custMobile,
    String? custName,
    int? notify,
    String? custEmail,
    String? custIMEI,
    String? custBrith,
    String? kycType,
    String? kycValue,
    int? langId,
    String? operatorId,
    String? operatorType,
    String? subscriberNo,
    String? customerPayeeId,
    String? extmsg,
    String? transAmount,
    String? pin,
    String? newPin,
    String? otpType,
    String? otp,
    String? codeName,
    String? ipc,
    String? prn,
    String? destinationMobile,
    String? newPass,
    String? authType,
    String? transactionId,
    String? serviceCode,
    String? subcat,
    String? transType,
    int? rate,
    String? notes,
    String? personalNumber,
    int? govCode,
    String? devName,
    String? devType,
    String? devVersion,
    String? merCode,
    String? refNo,
    String? pNote,
    String? offerId,
    String? smNotes,
    String? cityNo,
    String? netNo,
    String? remNo,
    double? feeAmt,
    String? remPurpose,
    String? activeType,
    String? opType,
    String? cvv,
    int? firstRec,
    int? lastRec,
    int? firstRow,
    int? lastRow,
    String? companyNo,
    String? categoryNo,
    String? extraMessage,
    String? firstName,
    String? secondName,
    String? thirdName,
    String? lastName,
    String? email,
    String? cardAddress,
    String? cardType,
    String? cardNo,
    String? cardStatus,
    String? fromDate,
    String? toDate,
    String? cardLimit,
    String? cardExpiry,
    String? targetNo,
    String? deviceSerial,
  });
  PostRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PostRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PostRequestModel, $Out>
    implements PostRequestModelCopyWith<$R, PostRequestModel, $Out> {
  _PostRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PostRequestModel> $mapper =
      PostRequestModelMapper.ensureInitialized();
  @override
  $R call({
    Object? langNo = $none,
    Object? mobileVersion = $none,
    Object? nationality = $none,
    Object? idNo = $none,
    Object? address = $none,
    Object? socialStatus = $none,
    Object? cardImgFront = $none,
    Object? cardImgBack = $none,
    Object? custPass = $none,
    Object? custMobile = $none,
    Object? custName = $none,
    Object? notify = $none,
    Object? custEmail = $none,
    Object? custIMEI = $none,
    Object? custBrith = $none,
    Object? kycType = $none,
    Object? kycValue = $none,
    Object? langId = $none,
    Object? operatorId = $none,
    Object? operatorType = $none,
    Object? subscriberNo = $none,
    Object? customerPayeeId = $none,
    Object? extmsg = $none,
    Object? transAmount = $none,
    Object? pin = $none,
    Object? newPin = $none,
    Object? otpType = $none,
    Object? otp = $none,
    Object? codeName = $none,
    Object? ipc = $none,
    Object? prn = $none,
    Object? destinationMobile = $none,
    Object? newPass = $none,
    Object? authType = $none,
    Object? transactionId = $none,
    Object? serviceCode = $none,
    Object? subcat = $none,
    Object? transType = $none,
    Object? rate = $none,
    Object? notes = $none,
    Object? personalNumber = $none,
    Object? govCode = $none,
    Object? devName = $none,
    Object? devType = $none,
    Object? devVersion = $none,
    Object? merCode = $none,
    Object? refNo = $none,
    Object? pNote = $none,
    Object? offerId = $none,
    Object? smNotes = $none,
    Object? cityNo = $none,
    Object? netNo = $none,
    Object? remNo = $none,
    Object? feeAmt = $none,
    Object? remPurpose = $none,
    Object? activeType = $none,
    Object? opType = $none,
    Object? cvv = $none,
    Object? firstRec = $none,
    Object? lastRec = $none,
    Object? firstRow = $none,
    Object? lastRow = $none,
    Object? companyNo = $none,
    Object? categoryNo = $none,
    Object? extraMessage = $none,
    Object? firstName = $none,
    Object? secondName = $none,
    Object? thirdName = $none,
    Object? lastName = $none,
    Object? email = $none,
    Object? cardAddress = $none,
    Object? cardType = $none,
    Object? cardNo = $none,
    Object? cardStatus = $none,
    Object? fromDate = $none,
    Object? toDate = $none,
    Object? cardLimit = $none,
    Object? cardExpiry = $none,
    Object? targetNo = $none,
    Object? deviceSerial = $none,
  }) => $apply(
    FieldCopyWithData({
      if (langNo != $none) #langNo: langNo,
      if (mobileVersion != $none) #mobileVersion: mobileVersion,
      if (nationality != $none) #nationality: nationality,
      if (idNo != $none) #idNo: idNo,
      if (address != $none) #address: address,
      if (socialStatus != $none) #socialStatus: socialStatus,
      if (cardImgFront != $none) #cardImgFront: cardImgFront,
      if (cardImgBack != $none) #cardImgBack: cardImgBack,
      if (custPass != $none) #custPass: custPass,
      if (custMobile != $none) #custMobile: custMobile,
      if (custName != $none) #custName: custName,
      if (notify != $none) #notify: notify,
      if (custEmail != $none) #custEmail: custEmail,
      if (custIMEI != $none) #custIMEI: custIMEI,
      if (custBrith != $none) #custBrith: custBrith,
      if (kycType != $none) #kycType: kycType,
      if (kycValue != $none) #kycValue: kycValue,
      if (langId != $none) #langId: langId,
      if (operatorId != $none) #operatorId: operatorId,
      if (operatorType != $none) #operatorType: operatorType,
      if (subscriberNo != $none) #subscriberNo: subscriberNo,
      if (customerPayeeId != $none) #customerPayeeId: customerPayeeId,
      if (extmsg != $none) #extmsg: extmsg,
      if (transAmount != $none) #transAmount: transAmount,
      if (pin != $none) #pin: pin,
      if (newPin != $none) #newPin: newPin,
      if (otpType != $none) #otpType: otpType,
      if (otp != $none) #otp: otp,
      if (codeName != $none) #codeName: codeName,
      if (ipc != $none) #ipc: ipc,
      if (prn != $none) #prn: prn,
      if (destinationMobile != $none) #destinationMobile: destinationMobile,
      if (newPass != $none) #newPass: newPass,
      if (authType != $none) #authType: authType,
      if (transactionId != $none) #transactionId: transactionId,
      if (serviceCode != $none) #serviceCode: serviceCode,
      if (subcat != $none) #subcat: subcat,
      if (transType != $none) #transType: transType,
      if (rate != $none) #rate: rate,
      if (notes != $none) #notes: notes,
      if (personalNumber != $none) #personalNumber: personalNumber,
      if (govCode != $none) #govCode: govCode,
      if (devName != $none) #devName: devName,
      if (devType != $none) #devType: devType,
      if (devVersion != $none) #devVersion: devVersion,
      if (merCode != $none) #merCode: merCode,
      if (refNo != $none) #refNo: refNo,
      if (pNote != $none) #pNote: pNote,
      if (offerId != $none) #offerId: offerId,
      if (smNotes != $none) #smNotes: smNotes,
      if (cityNo != $none) #cityNo: cityNo,
      if (netNo != $none) #netNo: netNo,
      if (remNo != $none) #remNo: remNo,
      if (feeAmt != $none) #feeAmt: feeAmt,
      if (remPurpose != $none) #remPurpose: remPurpose,
      if (activeType != $none) #activeType: activeType,
      if (opType != $none) #opType: opType,
      if (cvv != $none) #cvv: cvv,
      if (firstRec != $none) #firstRec: firstRec,
      if (lastRec != $none) #lastRec: lastRec,
      if (firstRow != $none) #firstRow: firstRow,
      if (lastRow != $none) #lastRow: lastRow,
      if (companyNo != $none) #companyNo: companyNo,
      if (categoryNo != $none) #categoryNo: categoryNo,
      if (extraMessage != $none) #extraMessage: extraMessage,
      if (firstName != $none) #firstName: firstName,
      if (secondName != $none) #secondName: secondName,
      if (thirdName != $none) #thirdName: thirdName,
      if (lastName != $none) #lastName: lastName,
      if (email != $none) #email: email,
      if (cardAddress != $none) #cardAddress: cardAddress,
      if (cardType != $none) #cardType: cardType,
      if (cardNo != $none) #cardNo: cardNo,
      if (cardStatus != $none) #cardStatus: cardStatus,
      if (fromDate != $none) #fromDate: fromDate,
      if (toDate != $none) #toDate: toDate,
      if (cardLimit != $none) #cardLimit: cardLimit,
      if (cardExpiry != $none) #cardExpiry: cardExpiry,
      if (targetNo != $none) #targetNo: targetNo,
      if (deviceSerial != $none) #deviceSerial: deviceSerial,
    }),
  );
  @override
  PostRequestModel $make(CopyWithData data) => PostRequestModel(
    langNo: data.get(#langNo, or: $value.langNo),
    mobileVersion: data.get(#mobileVersion, or: $value.mobileVersion),
    nationality: data.get(#nationality, or: $value.nationality),
    idNo: data.get(#idNo, or: $value.idNo),
    address: data.get(#address, or: $value.address),
    socialStatus: data.get(#socialStatus, or: $value.socialStatus),
    cardImgFront: data.get(#cardImgFront, or: $value.cardImgFront),
    cardImgBack: data.get(#cardImgBack, or: $value.cardImgBack),
    custPass: data.get(#custPass, or: $value.custPass),
    custMobile: data.get(#custMobile, or: $value.custMobile),
    custName: data.get(#custName, or: $value.custName),
    notify: data.get(#notify, or: $value.notify),
    custEmail: data.get(#custEmail, or: $value.custEmail),
    custIMEI: data.get(#custIMEI, or: $value.custIMEI),
    custBrith: data.get(#custBrith, or: $value.custBrith),
    kycType: data.get(#kycType, or: $value.kycType),
    kycValue: data.get(#kycValue, or: $value.kycValue),
    langId: data.get(#langId, or: $value.langId),
    operatorId: data.get(#operatorId, or: $value.operatorId),
    operatorType: data.get(#operatorType, or: $value.operatorType),
    subscriberNo: data.get(#subscriberNo, or: $value.subscriberNo),
    customerPayeeId: data.get(#customerPayeeId, or: $value.customerPayeeId),
    extmsg: data.get(#extmsg, or: $value.extmsg),
    transAmount: data.get(#transAmount, or: $value.transAmount),
    pin: data.get(#pin, or: $value.pin),
    newPin: data.get(#newPin, or: $value.newPin),
    otpType: data.get(#otpType, or: $value.otpType),
    otp: data.get(#otp, or: $value.otp),
    codeName: data.get(#codeName, or: $value.codeName),
    ipc: data.get(#ipc, or: $value.ipc),
    prn: data.get(#prn, or: $value.prn),
    destinationMobile: data.get(
      #destinationMobile,
      or: $value.destinationMobile,
    ),
    newPass: data.get(#newPass, or: $value.newPass),
    authType: data.get(#authType, or: $value.authType),
    transactionId: data.get(#transactionId, or: $value.transactionId),
    serviceCode: data.get(#serviceCode, or: $value.serviceCode),
    subcat: data.get(#subcat, or: $value.subcat),
    transType: data.get(#transType, or: $value.transType),
    rate: data.get(#rate, or: $value.rate),
    notes: data.get(#notes, or: $value.notes),
    personalNumber: data.get(#personalNumber, or: $value.personalNumber),
    govCode: data.get(#govCode, or: $value.govCode),
    devName: data.get(#devName, or: $value.devName),
    devType: data.get(#devType, or: $value.devType),
    devVersion: data.get(#devVersion, or: $value.devVersion),
    merCode: data.get(#merCode, or: $value.merCode),
    refNo: data.get(#refNo, or: $value.refNo),
    pNote: data.get(#pNote, or: $value.pNote),
    offerId: data.get(#offerId, or: $value.offerId),
    smNotes: data.get(#smNotes, or: $value.smNotes),
    cityNo: data.get(#cityNo, or: $value.cityNo),
    netNo: data.get(#netNo, or: $value.netNo),
    remNo: data.get(#remNo, or: $value.remNo),
    feeAmt: data.get(#feeAmt, or: $value.feeAmt),
    remPurpose: data.get(#remPurpose, or: $value.remPurpose),
    activeType: data.get(#activeType, or: $value.activeType),
    opType: data.get(#opType, or: $value.opType),
    cvv: data.get(#cvv, or: $value.cvv),
    firstRec: data.get(#firstRec, or: $value.firstRec),
    lastRec: data.get(#lastRec, or: $value.lastRec),
    firstRow: data.get(#firstRow, or: $value.firstRow),
    lastRow: data.get(#lastRow, or: $value.lastRow),
    companyNo: data.get(#companyNo, or: $value.companyNo),
    categoryNo: data.get(#categoryNo, or: $value.categoryNo),
    extraMessage: data.get(#extraMessage, or: $value.extraMessage),
    firstName: data.get(#firstName, or: $value.firstName),
    secondName: data.get(#secondName, or: $value.secondName),
    thirdName: data.get(#thirdName, or: $value.thirdName),
    lastName: data.get(#lastName, or: $value.lastName),
    email: data.get(#email, or: $value.email),
    cardAddress: data.get(#cardAddress, or: $value.cardAddress),
    cardType: data.get(#cardType, or: $value.cardType),
    cardNo: data.get(#cardNo, or: $value.cardNo),
    cardStatus: data.get(#cardStatus, or: $value.cardStatus),
    fromDate: data.get(#fromDate, or: $value.fromDate),
    toDate: data.get(#toDate, or: $value.toDate),
    cardLimit: data.get(#cardLimit, or: $value.cardLimit),
    cardExpiry: data.get(#cardExpiry, or: $value.cardExpiry),
    targetNo: data.get(#targetNo, or: $value.targetNo),
    deviceSerial: data.get(#deviceSerial, or: $value.deviceSerial),
  );

  @override
  PostRequestModelCopyWith<$R2, PostRequestModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PostRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

