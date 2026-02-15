import 'response_wrapper.dart';

/// Base response type for API calls (response object is the root JSON).
typedef BaseApiResponse<T extends BaseRespWrapper> = T;
