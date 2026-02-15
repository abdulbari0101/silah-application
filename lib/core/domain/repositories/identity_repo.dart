abstract class IdentityRepo {
  // serial number
  Future<String?> deviceId();

  // use cCode (non changable value)
  // used to store favorites , contacts , other non shared values
  Future<String?> userId();


  // generate IMI from (device-serial, device-token, timestamp) usi.
  Future<String> generateIMI();
}
