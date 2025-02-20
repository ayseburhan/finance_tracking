# Finans Takip

**Finans Takip Uygulaması**, döviz, altın ve kripto paraların güncel kurlarını takip eden,   detaylı veriler sunan bir Flutter uygulamasıdır.
---

## İçerik

- [Özellikler](#özellikler)
- [Kullanılan Teknolojiler ve Sürümler](#kullanılan-teknolojiler-ve-sürümler)
- [Kurulum ve Çalıştırma Talimatları](#kurulum-ve-çalıştırma-talimatları)
- [API Entegrasyonları](#api-entegrasyonları)
- [Proje Yapısı](#proje-yapısı)
- [Notlar](#notlar)

---

## Özellikler

- **Döviz Takibi:** USD bazlı tüm döviz kurlarını dinamik olarak çekip gösterir.
- **Altın Kurları:** GoldAPI kullanılarak XAU/USD fiyatı çekilir ve TRY cinsine dönüştürülerek gösterilir.
- **Kripto Para Piyasası:** CoinGecko demo API kullanılarak kripto paraların fiyatları, yüzde değişimleri ve görselleri listelenir.
- **Tema Desteği:** Koyu ve açık tema arasında geçiş yapma.
- **Refresh Indicator:** Veriler, pull-to-refresh yöntemi ile yenilenir.

---

## Kullanılan Teknolojiler ve Sürümler

- **Flutter:** 3.29.0 (Stable)  
- **Dart:** 3.x  
- **Paketler:**
  - `http: ^0.13.5`
  - `intl: ^0.19.0` 


---

## Kurulum ve Çalıştırma Talimatları

### Ön Koşullar

1. **Flutter SDK Kurulumu:**  
   [Flutter SDK'nın resmi web sitesinden](https://flutter.dev/docs/get-started/install) işletim sisteminize uygun Flutter SDK kurulumunu gerçekleştirin.

2. **IDE:**  
   VS Code, Android Studio  gibi bir IDE kullanabilirsiniz. Gerekli Flutter ve Dart eklentilerinin yüklü olduğundan emin olun.

### Adım Adım Kurulum

1. **Projeyi İndirin veya Klonlayın:**  
   ```bash
   git clone <repository-url>
   cd doviz
2. **Bağımlılıkları Yükleyin: Terminal veya IDE komut satırında:**  
   ```bash
   flutter pub get
3.  **Proje Yapılandırması ve API Anahtarları:**

    -   **GoldAPI:**\
        **lib/screens/gold_page.dart** dosyasında GoldAPI çağrısında API
        anahtarınızı ekleyin (örneğin, \'x-access-token\':
        \'goldapi-7mepxzsm79n1rp6-io\').

    -   **CoinGecko API:**\
        Demo URL kullanılmıştır; ayrıca API anahtarına ihtiyaç duyulmaz.

    -   **ExchangeRate API :**\
        Uygulama, USD bazlı döviz kurlarını çekmek için ExchangeRate API servisini kullanır. Ücretsiz plan kapsamında API key gereklidir. Çekilen veriler, uygulamada USD kurlarının TRY cinsine dönüştürülmesi için kullanılır.

    
    
     https://app.exchangerate-api.com/v6/YOUR_API_KEY/latest/USD


4.  **Uygulamayı Çalıştırın:** 
    Terminalde:

    
        flutter run

veya IDE üzerinden \"Run\" butonuna tıklayın.

5.  **Platformlar:**\
    Uygulama, Android, iOS, Web ve Desktop platformlarını destekler.
    İlgili platformları yapılandırdığınızdan emin olun.

**API Entegrasyonları**

**Döviz Kurları**

-   **Servis:** ExchangeRate-API 

-   **Endpoint Örneği:**
    https://v6.exchangerate-api.com/v6/YOUR_API_KEY/latest/USD

-   **Açıklama:**\
    USD bazlı döviz kurlarını çeker. Uygulama, USD kurlarını TRY cinsine
    dönüştürme işlemi gerçekleştirir.

**Altın Kurları**

-   **Servis:** GoldAPI

-   **Endpoint Örneği:**

    https://www.goldapi.io/api/XAU/USD

-   **Açıklama:**\
    XAU/USD fiyatı çekilir ve gerekirse TRY cinsine dönüşüm uygulanır.

**Kripto Paralar**

-   **Servis:** CoinGecko (Demo API)

-   **Endpoint Örneği:**

https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&x_cg_demo_api_key=CG-oZJT7sAe9fZkvLTNx73vM3wa

-   **Açıklama:**\
    Kripto para verileri, USD cinsinden çekilir ve ListView\'de gösterilir.

**Proje Yapısı**

bash

    /lib
        /models
            - market_data.dart 
        /screens
            - main_page.dart 
            - home_page.dart 
            - converter_page.dart 
            - settings_page.dart 
            - gold_page.dart
            - crypto_page.dart
            - data_tab.dart
        /widgets
            - market_card.dart 
    -main.dart


**Notlar**
-   **Tema:**\
    Koyu ve açık tema arasında geçiş yapılabilmektedir.

-   **Versiyonlar:**\
    Proje, Flutter 3.29 ve Dart 3.x ile uyumlu şekilde geliştirilmiştir.

-   **API Kısıtlamaları:**\
    Kullanılan API\'ler ücretsiz planlarda sınırlı veri sunabilir.
    

**Kurulum ve Çalıştırma Talimatları**

1.  **Projeyi İndirin veya Klonlayın:**


        git clone \<repository-url\>

cd doviz

2.  **Bağımlılıkları Yükleyin:**



        flutter pub get

3.  **API Anahtarlarını ve URL\'leri Güncelleyin:**

    -   GoldAPI için **lib/screens/gold_page.dart** dosyasında API anahtarınızı ayarlayın.

    -   Diğer API\'ler için gerekli URL parametrelerini kontrol edin.

4.  **Uygulamayı Çalıştırın:**
    

        flutter run
