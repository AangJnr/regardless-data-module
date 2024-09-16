class Country {
  late String name;
  late String currencySymbol;
  late String currencyCode;
  Country.fromJson({required String countryCode}) {
    final json = (countryDB[countryCode] ?? countryDB['US']);
    name = json?["country_name"] ?? '';
    currencyCode = json?["currency_code"] ?? '';
    currencySymbol =
        json?["special_currency_symbol"] ?? json?["currency_symbol"] ?? '';
  }
}

const countryDB = {
  "DZ": {
    "country_name": "Algeria",
    "currency_code": "DZD",
    "currency_symbol": "د.ج",
    "special_currency_symbol": "دج"
  },
  "AO": {
    "country_name": "Angola",
    "currency_code": "AOA",
    "currency_symbol": "Kz",
    "special_currency_symbol": null
  },
  "BJ": {
    "country_name": "Benin",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "BW": {
    "country_name": "Botswana",
    "currency_code": "BWP",
    "currency_symbol": "P",
    "special_currency_symbol": null
  },
  "BF": {
    "country_name": "Burkina Faso",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "BI": {
    "country_name": "Burundi",
    "currency_code": "BIF",
    "currency_symbol": "FBu",
    "special_currency_symbol": null
  },
  "CV": {
    "country_name": "Cabo Verde",
    "currency_code": "CVE",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "CM": {
    "country_name": "Cameroon",
    "currency_code": "XAF",
    "currency_symbol": "FCFA",
    "special_currency_symbol": null
  },
  "CF": {
    "country_name": "Central African Republic",
    "currency_code": "XAF",
    "currency_symbol": "FCFA",
    "special_currency_symbol": null
  },
  "TD": {
    "country_name": "Chad",
    "currency_code": "XAF",
    "currency_symbol": "FCFA",
    "special_currency_symbol": null
  },
  "KM": {
    "country_name": "Comoros",
    "currency_code": "KMF",
    "currency_symbol": "CF",
    "special_currency_symbol": null
  },
  "CG": {
    "country_name": "Congo",
    "currency_code": "XAF",
    "currency_symbol": "FCFA",
    "special_currency_symbol": null
  },
  "CD": {
    "country_name": "Democratic Republic of the Congo",
    "currency_code": "CDF",
    "currency_symbol": "FC",
    "special_currency_symbol": null
  },
  "CI": {
    "country_name": "Côte d'Ivoire",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "DJ": {
    "country_name": "Djibouti",
    "currency_code": "DJF",
    "currency_symbol": "Fdj",
    "special_currency_symbol": null
  },
  "EG": {
    "country_name": "Egypt",
    "currency_code": "EGP",
    "currency_symbol": "£",
    "special_currency_symbol": "ج.م"
  },
  "GQ": {
    "country_name": "Equatorial Guinea",
    "currency_code": "XAF",
    "currency_symbol": "FCFA",
    "special_currency_symbol": null
  },
  "ER": {
    "country_name": "Eritrea",
    "currency_code": "ERN",
    "currency_symbol": "Nfk",
    "special_currency_symbol": null
  },
  "SZ": {
    "country_name": "Eswatini",
    "currency_code": "SZL",
    "currency_symbol": "E",
    "special_currency_symbol": null
  },
  "ET": {
    "country_name": "Ethiopia",
    "currency_code": "ETB",
    "currency_symbol": "Br",
    "special_currency_symbol": null
  },
  "GA": {
    "country_name": "Gabon",
    "currency_code": "XAF",
    "currency_symbol": "FCFA",
    "special_currency_symbol": null
  },
  "GM": {
    "country_name": "Gambia",
    "currency_code": "GMD",
    "currency_symbol": "D",
    "special_currency_symbol": null
  },
  "GH": {
    "country_name": "Ghana",
    "currency_code": "GHS",
    "currency_symbol": "GHS",
    "special_currency_symbol": null
  },
  "GN": {
    "country_name": "Guinea",
    "currency_code": "GNF",
    "currency_symbol": "FG",
    "special_currency_symbol": null
  },
  "GW": {
    "country_name": "Guinea-Bissau",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "KE": {
    "country_name": "Kenya",
    "currency_code": "KES",
    "currency_symbol": "KSh",
    "special_currency_symbol": null
  },
  "LS": {
    "country_name": "Lesotho",
    "currency_code": "LSL",
    "currency_symbol": "L",
    "special_currency_symbol": null
  },
  "LR": {
    "country_name": "Liberia",
    "currency_code": "LRD",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "LY": {
    "country_name": "Libya",
    "currency_code": "LYD",
    "currency_symbol": "LD",
    "special_currency_symbol": "ل.د"
  },
  "MG": {
    "country_name": "Madagascar",
    "currency_code": "MGA",
    "currency_symbol": "Ar",
    "special_currency_symbol": null
  },
  "MW": {
    "country_name": "Malawi",
    "currency_code": "MWK",
    "currency_symbol": "MK",
    "special_currency_symbol": null
  },
  "ML": {
    "country_name": "Mali",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "MR": {
    "country_name": "Mauritania",
    "currency_code": "MRU",
    "currency_symbol": "UM",
    "special_currency_symbol": "أ.م"
  },
  "MU": {
    "country_name": "Mauritius",
    "currency_code": "MUR",
    "currency_symbol": "₨",
    "special_currency_symbol": null
  },
  "MA": {
    "country_name": "Morocco",
    "currency_code": "MAD",
    "currency_symbol": "د.م.",
    "special_currency_symbol": "DH"
  },
  "MZ": {
    "country_name": "Mozambique",
    "currency_code": "MZN",
    "currency_symbol": "MT",
    "special_currency_symbol": null
  },
  "NA": {
    "country_name": "Namibia",
    "currency_code": "NAD",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "NE": {
    "country_name": "Niger",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "NG": {
    "country_name": "Nigeria",
    "currency_code": "NGN",
    "currency_symbol": "₦",
    "special_currency_symbol": null
  },
  "RW": {
    "country_name": "Rwanda",
    "currency_code": "RWF",
    "currency_symbol": "RF",
    "special_currency_symbol": null
  },
  "ST": {
    "country_name": "São Tomé and Príncipe",
    "currency_code": "STN",
    "currency_symbol": "Db",
    "special_currency_symbol": null
  },
  "SN": {
    "country_name": "Senegal",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "SC": {
    "country_name": "Seychelles",
    "currency_code": "SCR",
    "currency_symbol": "₨",
    "special_currency_symbol": null
  },
  "SL": {
    "country_name": "Sierra Leone",
    "currency_code": "SLL",
    "currency_symbol": "Le",
    "special_currency_symbol": null
  },
  "SO": {
    "country_name": "Somalia",
    "currency_code": "SOS",
    "currency_symbol": "Sh",
    "special_currency_symbol": null
  },
  "ZA": {
    "country_name": "South Africa",
    "currency_code": "ZAR",
    "currency_symbol": "R",
    "special_currency_symbol": null
  },
  "SS": {
    "country_name": "South Sudan",
    "currency_code": "SSP",
    "currency_symbol": "£",
    "special_currency_symbol": null
  },
  "SD": {
    "country_name": "Sudan",
    "currency_code": "SDG",
    "currency_symbol": "£",
    "special_currency_symbol": "ج.س."
  },
  "TZ": {
    "country_name": "Tanzania",
    "currency_code": "TZS",
    "currency_symbol": "Sh",
    "special_currency_symbol": null
  },
  "TG": {
    "country_name": "Togo",
    "currency_code": "XOF",
    "currency_symbol": "CFA",
    "special_currency_symbol": null
  },
  "TN": {
    "country_name": "Tunisia",
    "currency_code": "TND",
    "currency_symbol": "د.ت",
    "special_currency_symbol": null
  },
  "UG": {
    "country_name": "Uganda",
    "currency_code": "UGX",
    "currency_symbol": "USh",
    "special_currency_symbol": null
  },
  "ZM": {
    "country_name": "Zambia",
    "currency_code": "ZMW",
    "currency_symbol": "ZK",
    "special_currency_symbol": null
  },
  "ZW": {
    "country_name": "Zimbabwe",
    "currency_code": "ZWL",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "US": {
    "country_name": "United States",
    "currency_code": "USD",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "CA": {
    "country_name": "Canada",
    "currency_code": "CAD",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "GB": {
    "country_name": "United Kingdom",
    "currency_code": "GBP",
    "currency_symbol": "£",
    "special_currency_symbol": null
  },
  "JP": {
    "country_name": "Japan",
    "currency_code": "JPY",
    "currency_symbol": "¥",
    "special_currency_symbol": "￥"
  },
  "IN": {
    "country_name": "India",
    "currency_code": "INR",
    "currency_symbol": "₹",
    "special_currency_symbol": "रू"
  },
  "DE": {
    "country_name": "Germany",
    "currency_code": "EUR",
    "currency_symbol": "€",
    "special_currency_symbol": null
  },
  "CN": {
    "country_name": "China",
    "currency_code": "CNY",
    "currency_symbol": "¥",
    "special_currency_symbol": "元"
  },
  "FR": {
    "country_name": "France",
    "currency_code": "EUR",
    "currency_symbol": "€",
    "special_currency_symbol": null
  },
  "RU": {
    "country_name": "Russia",
    "currency_code": "RUB",
    "currency_symbol": "₽",
    "special_currency_symbol": "руб"
  },
  "BR": {
    "country_name": "Brazil",
    "currency_code": "BRL",
    "currency_symbol": "R\$",
    "special_currency_symbol": null
  },
  "AU": {
    "country_name": "Australia",
    "currency_code": "AUD",
    "currency_symbol": "\$",
    "special_currency_symbol": null
  },
  "KR": {
    "country_name": "South Korea",
    "currency_code": "KRW",
    "currency_symbol": "₩",
    "special_currency_symbol": "￦"
  },
  "MX": {
    "country_name": "Mexico",
    "currency_code": "MXN",
    "currency_symbol": "\$",
    "special_currency_symbol": "Mex\$"
  },
  "SA": {
    "country_name": "Saudi Arabia",
    "currency_code": "SAR",
    "currency_symbol": "﷼",
    "special_currency_symbol": null
  },
  "IL": {
    "country_name": "Israel",
    "currency_code": "ILS",
    "currency_symbol": "₪",
    "special_currency_symbol": null
  }
};
