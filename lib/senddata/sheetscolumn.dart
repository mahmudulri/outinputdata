class SheetsColumn {
  static final String vpnname = "name";
  static final String country = "country";
  static final String ipaddress = "IP Address";
  static final String date = "date";
  static final String number = "ip no";

  static List<String> getColumns() =>
      [vpnname, country, ipaddress, date, number];
}
