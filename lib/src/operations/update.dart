import 'package:wordpress_client/src/requests/request.dart';
import 'package:wordpress_client/src/responses/response_container.dart';
import 'package:wordpress_client/src/utilities/serializable_instance.dart';

import '../internal_requester.dart';

abstract class IUpdateOperation<T> {
  Future<ResponseContainer<T>> update<T extends ISerializable<T>>({T typeResolver, Request<T> request, InternalRequester requesterClient});
}
