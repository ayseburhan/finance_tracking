import 'package:flutter/material.dart';
import '../models/market_data.dart';

// Para birimlerinin Türkçe adlarını tutan sözlük
final Map<String, String> currencyNames = {
  "AED": "Birleşik Arap Emirlikleri Dirhemi",
  "AFN": "Afganistan Afganisi",
  "ALL": "Arnavutluk Leki",
  "AMD": "Ermenistan Dramı",
  "ANG": "Hollanda Antilleri Gilderi",
  "AOA": "Angola Kwanzası",
  "ARS": "Arjantin Pesosu",
  "AUD": "Avustralya Doları",
  "AWG": "Aruba Florini",
  "AZN": "Azerbaycan Manatı",
  "BAM": "Bosna Hersek Convertible Markı",
  "BBD": "Barbados Doları",
  "BDT": "Bangladeş Takası",
  "BGN": "Bulgar Levası",
  "BHD": "Bahreyn Dinarı",
  "BIF": "Burundi Frangı",
  "BMD": "Bermuda Doları",
  "BND": "Brunei Doları",
  "BOB": "Bolivya Bolivianosu",
  "BRL": "Brezilya Reali",
  "BSD": "Bahama Doları",
  "BTN": "Butan Ngultrumu",
  "BWP": "Botsvana Pulası",
  "BYN": "Beyaz Rus Rublesi",
  "BZD": "Belize Doları",
  "CAD": "Kanada Doları",
  "CDF": "Kongo Frangı",
  "CHF": "İsviçre Frangı",
  "CLP": "Şili Pesosu",
  "CNY": "Çin Yuanı",
  "COP": "Kolombiya Pesosu",
  "CRC": "Kosta Rika Colonu",
  "CUP": "Küba Pesosu",
  "CVE": "Yeşil Burun Adaları Escudosu",
  "CZK": "Çek Cumhuriyeti Kronu",
  "DJF": "Cibuti Frangı",
  "DKK": "Danimarka Kronu",
  "DOP": "Dominik Pesosu",
  "DZD": "Cezayir Dinarı",
  "EGP": "Mısır Lirası",
  "ERN": "Eritre Nakfası",
  "ETB": "Etiyopya Birri",
  "EUR": "Euro",
  "FJD": "Fiji Doları",
  "FKP": "Falkland Adaları Sterlini",
  "GBP": "İngiliz Sterlini",
  "GEL": "Gürcü Lari",
  "GHS": "Gana Cedi",
  "GIP": "Cebelitarık Sterlini",
  "GMD": "Gambiya Dalasisi",
  "GNF": "Gine Frangı",
  "GTQ": "Guatemala Quetzalı",
  "GYD": "Guyana Doları",
  "HKD": "Hong Kong Doları",
  "HNL": "Honduras Lempirası",
  "HRK": "Hırvatistan Kunası",
  "HTG": "Haiti Gourdesi",
  "HUF": "Macar Forinti",
  "IDR": "Endonezya Rupiahı",
  "ILS": "İsrail Şekeli",
  "INR": "Hint Rupisi",
  "IQD": "Irak Dinarı",
  "IRR": "İran Riyali",
  "ISK": "İzlanda Kronu",
  "JMD": "Jamaika Doları",
  "JOD": "Ürdün Dinarı",
  "JPY": "Japon Yeni",
  "KES": "Kenya Şilini",
  "KGS": "Kırgızistan Somu",
  "KHR": "Kamboçya Rieli",
  "KMF": "Komorlar Frangı",
  "KRW": "Güney Kore Wonu",
  "KWD": "Kuveyt Dinarı",
  "KYD": "Cayman Adaları Doları",
  "KZT": "Kazakistan Tengesi",
  "LAK": "Laos Kipi",
  "LBP": "Lübnan Lirası",
  "LKR": "Sri Lanka Rupisi",
  "LRD": "Liberya Doları",
  "LSL": "Lesotho Loti",
  "LYD": "Libya Dinarı",
  "MAD": "Fas Dirhemi",
  "MDL": "Moldova Leyi",
  "MGA": "Madagaskar Ariarisi",
  "MKD": "Kuzey Makedonya Dinarı",
  "MMK": "Myanmar Kyatı",
  "MNT": "Moğol Tugrugu",
  "MOP": "Makao Patakası",
  "MRU": "Mauritius Ouguiyası",
  "MUR": "Mauritius Rupisi",
  "MVR": "Maldiv Rupisi",
  "MWK": "Malavi Kwachası",
  "MXN": "Meksika Pesosu",
  "MYR": "Malezya Ringgiti",
  "MZN": "Mozambik Metikali",
  "NAD": "Namibya Doları",
  "NGN": "Nijerya Nairası",
  "NIO": "Nikaragua Cordobası",
  "NOK": "Norveç Kronu",
  "NPR": "Nepal Rupisi",
  "NZD": "Yeni Zelanda Doları",
  "OMR": "Umman Riyali",
  "PAB": "Panama Balboası",
  "PEN": "Peru Solu",
  "PGK": "Papua Yeni Gine Kina",
  "PHP": "Filipin Pesosu",
  "PKR": "Pakistan Rupisi",
  "PLN": "Polonya Zlotisi",
  "PYG": "Paraguay Guaranisi",
  "QAR": "Katar Riyali",
  "RON": "Romanya Leyi",
  "RSD": "Sırp Dinarı",
  "RUB": "Rus Rublesi",
  "RWF": "Ruanda Frangı",
  "SAR": "Suudi Arabistan Riyali",
  "SBD": "Solomon Adaları Doları",
  "SCR": "Seyşeller Rupisi",
  "SDG": "Sudan Lirası",
  "SEK": "İsveç Kronu",
  "SGD": "Singapur Doları",
  "SHP": "Saint Helena Sterlini",
  "SLL": "Sierra Leone Leone",
  "SOS": "Somali Şilini",
  "SRD": "Surinam Doları",
  "SSP": "Güney Sudan Sterlini",
  "STN": "São Tomé ve Príncipe Dobrası",
  "SYP": "Suriye Lirası",
  "SZL": "Svaziland Lilangeni",
  "THB": "Tayland Bahtı",
  "TJS": "Tacikistan Somoni",
  "TMT": "Türkmenistan Manatı",
  "TND": "Tunus Dinarı",
  "TOP": "Tonga Paʻanga",
  "TRY": "Türk Lirası",
  "TTD": "Trinidad ve Tobago Doları",
  "TWD": "Yeni Tayvan Doları",
  "TZS": "Tanzanya Şilini",
  "UAH": "Ukrayna Grivnası",
  "UGX": "Uganda Şilini",
  "UYU": "Uruguay Pesosu",
  "UZS": "Özbekistan Somu",
  "VES": "Venezuela Bolívarı",
  "VND": "Vietnam Dongu",
  "VUV": "Vanuatu Vatusu",
  "WST": "Samoa Talası",
  "XAF": "Orta Afrika CFA Frangı",
  "XCD": "Doğu Karayip Doları",
  "XDR": "🌐",
  "XOF": "Batı Afrika CFA Frangı",
  "XPF": "CFP Frangı",
  "YER": "Yemen Riyali",
  "ZAR": "Güney Afrika Randı",
  "ZMW": "Zambiya Kwachası",
  "ZWL": "Zimbabve Doları",
  "USD": "Amerikan Doları"
};
final Map<String, String> currencyFlags = {
  "AED": "🇦🇪",
  "AFN": "🇦🇫",
  "ALL": "🇦🇱",
  "AMD": "🇦🇲",
  "ANG": "🇳🇱",
  "AOA": "🇦🇴",
  "ARS": "🇦🇷",
  "AUD": "🇦🇺",
  "AWG": "🇦🇼",
  "AZN": "🇦🇿",
  "BAM": "🇧🇦",
  "BBD": "🇧🇧",
  "BDT": "🇧🇩",
  "BGN": "🇧🇬",
  "BHD": "🇧🇭",
  "BIF": "🇧🇮",
  "BMD": "🇧🇲",
  "BND": "🇧🇳",
  "BOB": "🇧🇴",
  "BRL": "🇧🇷",
  "BSD": "🇧🇸",
  "BTN": "🇧🇹",
  "BWP": "🇧🇼",
  "BYN": "🇧🇾",
  "BZD": "🇧🇿",
  "CAD": "🇨🇦",
  "CDF": "🇨🇩",
  "CHF": "🇨🇭",
  "CLP": "🇨🇱",
  "CNY": "🇨🇳",
  "COP": "🇨🇴",
  "CRC": "🇨🇷",
  "CUP": "🇨🇺",
  "CVE": "🇨🇻",
  "CZK": "🇨🇿",
  "DJF": "🇩🇯",
  "DKK": "🇩🇰",
  "DOP": "🇩🇴",
  "DZD": "🇩🇿",
  "EGP": "🇪🇬",
  "ERN": "🇪🇷",
  "ETB": "🇪🇹",
  "EUR": "🇪🇺",
  "FJD": "🇫🇯",
  "FKP": "🇫🇰",
  "GBP": "🇬🇧",
  "GEL": "🇬🇪",
  "GHS": "🇬🇭",
  "GIP": "🇬🇮",
  "GMD": "🇬🇲",
  "GNF": "🇬🇳",
  "GTQ": "🇬🇹",
  "GYD": "🇬🇾",
  "HKD": "🇭🇰",
  "HNL": "🇭🇳",
  "HRK": "🇭🇷",
  "HTG": "🇭🇹",
  "HUF": "🇭🇺",
  "IDR": "🇮🇩",
  "ILS": "🇮🇱",
  "INR": "🇮🇳",
  "IQD": "🇮🇶",
  "IRR": "🇮🇷",
  "ISK": "🇮🇸",
  "JMD": "🇯🇲",
  "JOD": "🇯🇴",
  "JPY": "🇯🇵",
  "KES": "🇰🇪",
  "KGS": "🇰🇬",
  "KHR": "🇰🇭",
  "KMF": "🇰🇲",
  "KRW": "🇰🇷",
  "KWD": "🇰🇼",
  "KYD": "🇰🇾",
  "KZT": "🇰🇿",
  "LAK": "🇱🇦",
  "LBP": "🇱🇧",
  "LKR": "🇱🇰",
  "LRD": "🇱🇷",
  "LSL": "🇱🇸",
  "LYD": "🇱🇾",
  "MAD": "🇲🇦",
  "MDL": "🇲🇩",
  "MGA": "🇲🇬",
  "MKD": "🇲🇰",
  "MMK": "🇲🇲",
  "MNT": "🇲🇳",
  "MOP": "🇲🇴",
  "MRU": "🇲🇺",
  "MUR": "🇲🇺",
  "MVR": "🇲🇻",
  "MWK": "🇲🇼",
  "MXN": "🇲🇽",
  "MYR": "🇲🇾",
  "MZN": "🇲🇿",
  "NAD": "🇳🇦",
  "NGN": "🇳🇬",
  "NIO": "🇳🇮",
  "NOK": "🇳🇴",
  "NPR": "🇳🇵",
  "NZD": "🇳🇿",
  "OMR": "🇴🇲",
  "PAB": "🇵🇦",
  "PEN": "🇵🇪",
  "PGK": "🇵🇬",
  "PHP": "🇵🇭",
  "PKR": "🇵🇰",
  "PLN": "🇵🇱",
  "PYG": "🇵🇾",
  "QAR": "🇶🇦",
  "RON": "🇷🇴",
  "RSD": "🇷🇸",
  "RUB": "🇷🇺",
  "RWF": "🇷🇼",
  "SAR": "🇸🇦",
  "SBD": "🇸🇧",
  "SCR": "🇸🇨",
  "SDG": "🇸🇩",
  "SEK": "🇸🇪",
  "SGD": "🇸🇬",
  "SHP": "🇸🇭",
  "SLL": "🇸🇱",
  "SOS": "🇸🇴",
  "SRD": "🇸🇷",
  "SSP": "🇸🇸",
  "STN": "🇸🇹",
  "SYP": "🇸🇾",
  "SZL": "🇸🇿",
  "THB": "🇹🇭",
  "TJS": "🇹🇯",
  "TMT": "🇹🇲",
  "TND": "🇹🇳",
  "TOP": "🇹🇴",
  "TRY": "🇹🇷",
  "TTD": "🇹🇹",
  "TWD": "🇹🇼",
  "TZS": "🇹🇿",
  "UAH": "🇺🇦",
  "UGX": "🇺🇬",
  "UYU": "🇺🇾",
  "UZS": "🇺🇿",
  "VES": "🇻🇪",
  "VND": "🇻🇳",
  "VUV": "🇻🇺",
  "WST": "🇼🇸",
  "XAF": "🇨🇫",
  "XCD": "🇦🇬",
  "XDR": "🌐",
  "XOF": "🇧🇯",
  "XPF": "🇵🇫",
  "YER": "🇾🇪",
  "ZAR": "🇿🇦",
  "ZMW": "🇿🇲",
  "ZWL": "🇿🇼",
  "USD": "🇺🇸",
};


class MarketCard extends StatelessWidget {
  final MarketData data;

  const MarketCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final String turkishName = currencyNames[data.symbol] ?? "";
    final String flag = currencyFlags[data.symbol] ?? "";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      child: Card(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$flag ${data.symbol}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    if (turkishName.isNotEmpty)
                      Text(
                        turkishName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    const SizedBox(height: 4),
                    
                  ],
                ),
              ),
             
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "₺${data.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
