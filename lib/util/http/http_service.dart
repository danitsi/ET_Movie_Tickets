
import 'http_attrib_options.dart';

abstract class HttpService {
  Future<String?> send(HttpAttribOptions httpAttribOptions);
}
