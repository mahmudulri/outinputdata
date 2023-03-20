import 'package:gsheets/gsheets.dart';
import 'package:ouripdata/senddata/sheetscolumn.dart';

class SheetsFlutter {
  static String _sheetId = "1XCZdEO1L0vQjejaw1TW4oHroi6fGfQpLk4y7XAukcv8";
  static const _sheetCredentials = r'''
{
  "type": "service_account",
  "project_id": "userapi-381210",
  "private_key_id": "06eba5f391eb6f264ed8bbdea8e3aa1f3f5e3829",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsCEj6BGnwoch1\n9Rk9vDZJMdquxQUeGtDqjG5Fzlg9/SDpMQ5FaeW8bSlf2SA3aj6oKfG6fr5NFnmk\nUnr08AJgM88tBAX2nevvUTSyQX/v9INddKRsEqN/SQD5JtZuOHMX0Y3UPPEiwdDY\nHQ1av2QJ0+EETzsxuZ8OQr13scghJS9TN/HYgesRtBj0NdREvNQHqVTdAtmh3LGb\n52/zRvd2fsoU3KcwuGIL5Z/xBAW+OBuptLWynVcwgCKgb6m1OTVKQUNxiUgxt5bq\n3VcRZ1GZWbwRn+jLOOWnDRMTiaTlOQfffYQNXWTJRPCHVE3TY53VHbwJQ3hXCgsK\no3Ak+l/bAgMBAAECggEAAsqM9JGHGS0Reuh5JQlIEDP2NQkOpjMP2gkL7lIEwyy3\nkKZdHD81nQhgYs+7uBUfOHdFwXLg/5CHyg9p3fjZm69Q2I13ffgzUHS5gtLmkoFz\nHYcQ9o1EMy0qDjYqcIC1+AL3EXnTp8QL8WsMlmut4dhFjwkCEDJ6JC8Xso4jOHZt\nHRbR04t7ZFIkLM2p/4bk4V2hBaMUSojcw0x80HWOF6ohzWTHVDtnQKPnuUXXrCaf\nHNBtn15iUaMJEd9L0+nnWOzt/mkRcklM6wskfhCyKHzfsiOruKm1AbIYYu2zD947\n/Qgufz7z+lGz6Zn7tD3RgvmlypiSZaQP9BMl0Rb+kQKBgQDxUmrH3REYnEaQKL3R\nFJMVb6RShJkXLAZErL9VYCn3KiuWz+OEt5qhXcD0huI0RXJ24nrsR1qOzSsSVvw2\n5CNpEnP8cpy99+wOap9a3EVgJ2GF2x8qhUwimXDKj2z13ELQ+gx6SSfL3Jc16jgs\nXp04e2cAL+CZmOlzPUSUuqec7QKBgQC2fvjCsSJurJege2rRoJ7QBqSdZ/UXnnzf\n0IVT93+TqnxBqxKkE1eoRgUfp7VpoPy2aKPvBnbcSQFFrQjJhG4XSyfmX0pOrLHi\nTIvHl+A+hZ+SGM1WBvw/6Bvcu8kQkEYErOdw8j7FuBxrVTr0I/9F3JCCpua5S2sp\n011wTbge5wKBgBj9wwctsq6MyJX3UikL62uF40uUZdJLgd6s0SfDTLVHDbqRjutY\npE/fyLLKITTumDsNm1NK1GsDfllo3rfEipJAEfjr2aWmvjCEBDrBowGhMm1NUv3x\nTgArSc4AanVPuS+xJYeoedGX56Tyu5yEs918kh8n1iex+UMw7iBE8ETFAoGAAnbi\nexaTRXVVMtiXz67gliSQ0oNV3vTH8OnK8yBTe7YAqY5a2RZdx6ryZMQKAhwnbXsq\nQ48Nydm+h6dXiAkex3e/WTAOO9O/LzQjaxWU9KMvTXTCSRgdDevffHKYu32HRIbl\nNTRAPsFGuPhUrHlT+CiLVwhT80qebtko2Nxj0R8CgYA/jdx1Ep+CF9pWAAyAE5aV\n4IOh4LqT5cfbHNdRvjebETtL4zDeTuLR2nt6iFDmhiix2mFjActqC3tDeYJP68KN\nAQTZjqsK+N+gUP8J43b9av4dk39g3LXIRsrp6ZwEVgcURfo3UPH6WmRcihhYjvWm\n+d8+WzXwDfYWH4s1Y8wasg==\n-----END PRIVATE KEY-----\n",
  "client_email": "userworkdata@userapi-381210.iam.gserviceaccount.com",
  "client_id": "117936711968901988307",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/userworkdata%40userapi-381210.iam.gserviceaccount.com"
}
''';
  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_sheetCredentials);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);

      _userSheet = await _getWorkSheet(spreadsheet, title: "Userwork");
      final firstRow = SheetsColumn.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}
