import 'package:flutter_phoenix_academy/config/service/client_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClientService tests', () {
    late ClientService clientService;

    setUp(() {
      clientService = ClientService('https://jsonplaceholder.typicode.com');
    });

    test('GET request test', () async {
      final response = await clientService.get<String>(path: '/posts/1');
      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      print('GET Response: ${response.data}');
    });

    test('POST request test', () async {
      final requestBody = {'title': 'foo', 'body': 'bar', 'userId': 1};
      final response = await clientService.post<String>(
        path: '/posts',
        requestBody: requestBody,
      );
      expect(response.statusCode, 201); // Assuming it returns 201 Created
      expect(response.data, isNotNull);
      print('POST Response: ${response.data}');
    });

    test('PUT request test', () async {
      final requestBody = {'id': 1, 'title': 'foo', 'body': 'bar', 'userId': 1};
      final response = await clientService.put<String>(
        path: '/posts/1',
        requestBody: requestBody,
      );
      expect(response.statusCode, 200); // Assuming it returns 200 OK
      expect(response.data, isNotNull);
      print('PUT Response: ${response.data}');
    });

    test('DELETE request test', () async {
      final response = await clientService.delete<String>(path: '/posts/1');
      expect(response.statusCode, 200); // Assuming it returns 200 OK
      print('DELETE Response: ${response.data}');
    });
  });
}
