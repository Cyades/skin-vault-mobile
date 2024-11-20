# ( -_•)︻デ═一 Skin Vault Mobile 
**Nama:**   Malvin Scafi<br>
**NPM:**    2306152430<br>
**Kelas:**  PBP F<br>

Hasil proyek dapat dilihat pada [link berikut](pcd).

### Tugas Sebelumnya
| [Tugas 7](#tugas-7) | [Tugas 8](#tugas-8) | [Tugas 9](#tugas-9) |
| - | - | - |

## Tugas 9

### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena model berfungsi sebagai kerangka yang mendefinisikan struktur data yang dikirim atau diterima. Dengan model, validasi data dapat dilakukan untuk memastikan bahwa data yang diterima sesuai dengan format dan tipe yang diharapkan, sehingga mencegah terjadinya bug atau kesalahan akibat data yang tidak valid. Selain itu, penggunaan model juga meningkatkan keamanan dengan mencegah masuknya data berbahaya, sekaligus menjaga konsistensi struktur data sehingga lebih mudah untuk diproses. Jika model tidak dibuat, meskipun tidak selalu langsung menyebabkan error, data yang tidak valid atau salah format dapat mengakibatkan perilaku aplikasi yang tidak sesuai dengan harapan, seperti kegagalan pemrosesan permintaan. Oleh karena itu, model menjadi komponen penting untuk memastikan keandalan dan keamanan sistem dalam pengelolaan data JSON.

### 2. Jelaskan fungsi dari library `http` yang sudah kamu implementasikan pada tugas ini
Library `http` merupakan *dependency*/*requirement* dari package `pbp_django_auth` yang digunakan dalam tugas ini. Library ini berfungsi untuk memungkinkan aplikasi melakukan permintaan (request) dan menerima respons (response) melalui protokol HTTP. Dengan library ini, aplikasi dapat memanfaatkan berbagai metode HTTP, seperti GET, POST, DELETE, dan lainnya, untuk mengambil (fetching) atau mengirimkan data. Dalam tugas ini, library `http` digunakan untuk menjalin komunikasi dengan server Django, termasuk mengambil data produk, melakukan autentikasi pengguna, serta mengirimkan data produk baru ke server.

### 3. Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa *instance* `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah kelas yang berfungsi sebagai perantara untuk mengelola sesi HTTP dengan menggunakan *cookies*. Kelas ini memungkinkan aplikasi Flutter untuk menyimpan dan mengelola *cookies* secara otomatis, sehingga pengguna tetap terautentikasi selama sesi berlangsung tanpa perlu mengirim ulang kredensial pada setiap permintaan ke server. Fungsinya mencakup mengirim permintaan (request) dengan metode HTTP seperti GET atau POST sambil menjaga agar *cookies* terkait tetap disertakan dalam setiap permintaan.

Instance `CookieRequest` perlu dibagikan ke semua komponen dalam aplikasi Flutter karena *cookies* biasanya digunakan untuk mengelola sesi pengguna yang berkelanjutan. Dengan membagikan instance ini, semua bagian aplikasi dapat mengakses *cookies* yang sama, menjaga konsistensi status autentikasi dan data sesi di seluruh komponen. Tanpa pendekatan ini, setiap komponen mungkin akan bekerja dengan sesi yang terpisah, yang bisa menyebabkan masalah seperti kehilangan data sesi atau pengguna harus masuk kembali berulang kali. Hal ini memastikan pengalaman pengguna yang lebih mulus dan efisien.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Ketika pengguna melakukan input, seperti pada form *Add Product*, aplikasi Flutter biasanya terlebih dahulu melakukan validasi sederhana untuk memastikan data sesuai dengan kriteria yang diinginkan. Setelah validasi berhasil, Flutter akan mengirimkan data tersebut ke server Django dalam format JSON melalui permintaan HTTP. Server Django kemudian menerima permintaan tersebut dan melanjutkan proses di sisi *back-end*, seperti melakukan validasi tambahan, menjalankan operasi CRUD pada database, memastikan autentikasi pengguna, atau memproses data lainnya sesuai kebutuhan. Setelah selesai, Django mengirimkan *response* berupa pesan JSON kembali ke Flutter. Flutter akan menerima *response* tersebut, memproses atau parsing data yang diterima, dan menampilkan informasi yang relevan kepada pengguna di antarmuka aplikasi.

### 5. Jelaskan mekanisme autentikasi dari *login*, *register*, hingga *logout*. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
#### *A. Register*
Pada proses registrasi, pengguna memasukkan informasi akun seperti username dan password di Flutter melalui tampilan `register.dart`. Setelah pengguna mengklik submit, Flutter melakukan validasi input untuk memastikan bahwa tidak ada data yang kosong dan bahwa password dan konfirmasi password cocok. Jika validasi gagal, Flutter menampilkan pesan kesalahan. Jika berhasil, Flutter mengirim request POST ke server Django untuk membuat akun baru. Django kemudian melakukan parsing JSON dari request tersebut dan memeriksa apakah username sudah terdaftar. Jika username sudah ada, Django mengembalikan respons error (status 400) dengan pesan kesalahan, yang kemudian ditampilkan di Flutter. Jika berhasil membuat akun baru, Django mengirimkan respons sukses (status 200) dengan pesan konfirmasi, dan Flutter menampilkan pesan tersebut kepada pengguna.
#### *B. Login*
Setelah registrasi, pengguna dapat melakukan login. Pengguna memasukkan username dan password di layar `login.dart` pada Flutter. Flutter kemudian memvalidasi input untuk memastikan tidak ada yang kosong. Setelah validasi, request POST dikirim ke server Django untuk memeriksa kredensial yang diberikan. Django melakukan parsing terhadap request dan memverifikasi apakah username dan password cocok dengan data yang ada di database. Jika kredensial tidak valid, Django mengembalikan respons error (status 400) dengan pesan kesalahan, yang kemudian ditampilkan di Flutter. Jika login berhasil, Django mengirimkan respons sukses (status 200) beserta session cookie yang menandakan bahwa pengguna telah terautentikasi. Dengan session cookie ini, aplikasi Flutter dapat menampilkan menu utama kepada pengguna.
#### *C. Logout*
Untuk logout, ketika pengguna menekan tombol logout di aplikasi Flutter, Flutter mengirimkan permintaan ke endpoint Django untuk menghapus session cookie yang ada. Django memproses permintaan ini dengan menghapus session cookie yang menyimpan status autentikasi pengguna. Setelah itu, Flutter menghapus session cookie dari perangkat dan mengarahkan pengguna kembali ke halaman login, sehingga pengguna tidak lagi terautentikasi.


### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Saya membuat aplikasi baru bernama `authentication` di proyek Django saya yang mencakup tiga tampilan utama, yaitu `login`, `logout`, dan `registrasi`. Selain itu, saya juga melakukan beberapa penyesuaian pada file `settings.py`, seperti menambahkan middleware `corsheaders` dan mengonfigurasi variabel CORS agar memungkinkan komunikasi antara server Django dan aplikasi Flutter.
2. Di sisi aplikasi Flutter, saya menambahkan dua paket, yaitu `provider` dan `pbp_django_auth`. Paket `provider` digunakan untuk berbagi informasi antar widget, sementara `pbp_django_auth` digunakan untuk proses autentikasi dengan server Django. Saya mengimpor paket provider di file `main.dart` dan menggunakan `pbp_django_auth` pada komponen-komponen Flutter yang memerlukan komunikasi dengan server Django.
3. Untuk memungkinkan semua widget di aplikasi Flutter melakukan request ke server Django, saya membuat instance `Provider` baru yang menyediakan objek `CookieRequest`. Objek ini memastikan bahwa setiap request membawa session cookie yang diperlukan untuk autentikasi.
4. Saya membuat dua file baru di folder `/screens`, yaitu `login.dart` dan `register.dart`, yang berisi form untuk `login` dan `registrasi` dengan validasi dasar. Kedua form ini mengirimkan data ke endpoint yang telah disediakan di server Django untuk proses autentikasi, dan jika berhasil, pengguna akan masuk ke dalam aplikasi.
5. Untuk memfasilitasi pertukaran data antara aplikasi Flutter dan server Django, saya membuat model baru dalam file `skin_entry.dart`. Model ini digunakan untuk encoding dan decoding data dalam format JSON yang diterima atau dikirim ke server Django.
6. Selanjutnya, saya membuat file baru bernama `list_skinentry.dart` di folder `/screens`, yang digunakan untuk menampilkan daftar produk. Data produk diambil melalui request ke endpoint yang sudah disiapkan di server Django, dengan filtering di sisi server untuk hanya menampilkan produk yang ditambahkan oleh pengguna yang sedang `login`.
7. Saya juga menghubungkan form *Add Product* yang ada pada file `skinentry_form.dart` dengan server Django. Form ini sekarang dapat mengirimkan data produk melalui request POST yang akan disimpan di database Django. Untuk mendukung hal ini, saya menambahkan endpoint baru di server Django untuk menerima data JSON dari Flutter.
8. Fitur `logout` juga saya implementasikan pada halaman utama. Ketika tombol *logout* ditekan, aplikasi Flutter mengirim request ke endpoint `/logout` di server Django, yang kemudian menghapus session pengguna dan menyelesaikan proses `logout`.


## 📜 README Log History

<details>
<summary><b>Tugas 7 (06/11/2024)</b></summary>

## Tugas 7

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- ***Stateless widget***

    Stateless Widget adalah widget yang sifatnya statis atau tidak berubah (immutable) dan tidak memiliki state internal yang bisa berubah selama widget tersebut ada. Widget ini hanya akan di-rebuild jika ada perubahan pada konfigurasi widget, misalnya perubahan data dari parent widget. Stateless Widget cocok untuk UI statis seperti teks, ikon, atau layout sederhana, dan lebih ringan karena tidak perlu mengelola state.

- ***Stateless widget***

    Stateful Widget adalah widget yang bersifat dinamis dan dapat berubah (mutable), dengan state internal yang bisa diperbarui selama masa hidup widget. Widget ini dapat melakukan rebuild ketika state berubah menggunakan `setState()`, sehingga cocok untuk UI yang interaktif dan memerlukan pembaruan, seperti form, counter, atau animasi. Karena harus mengelola state, Stateful Widget membutuhkan lebih banyak resource dibandingkan Stateless Widget.

- Perbedaan Utama:

    - Pengelolaan State

        Stateless: Tidak memiliki state internal
        
        Stateful: Memiliki state yang dapat diubah


    - Performa

        Stateless: Lebih ringan dan efisien
        
        Stateful: Memerlukan resource lebih banyak


    - Rebuild

        Stateless: Hanya di-rebuild saat ada perubahan konfigurasi
        
        Stateful: Dapat di-rebuild kapanpun dengan setState()


    - Penggunaan

        Stateless: UI statis, tampilan sederhana
        
        Stateful: UI dinamis, interaktif, form input


    - Struktur Code

        Stateless: Hanya memerlukan satu class
        
        Stateful: Memerlukan dua class (widget dan state)

    Pemilihan antara Stateless dan Stateful Widget sebaiknya disesuaikan dengan kebutuhan aplikasi. Gunakan Stateless Widget ketika UI bersifat statis untuk performa yang lebih baik, dan gunakan Stateful Widget ketika membutuhkan pengelolaan state yang dinamis.



### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

- ***MaterialApp***

    - Widget root aplikasi Flutter yang menyediakan struktur dasar aplikasi Material Design
    - Mengatur tema, judul, dan halaman utama aplikasi

- ***Scaffold***

    - Menyediakan struktur dasar layout Material Design
    - Mengatur AppBar dan body halaman
    - Memungkinkan penggunaan SnackBar melalui ScaffoldMessenger

- ***AppBar***

    - Menampilkan bar navigasi atas aplikasi
    - Berisi judul "Skin Vault" dengan styling khusus

- ***Column & Row***

    - Column: Layout vertikal untuk menyusun widget dari atas ke bawah
    - Row: Layout horizontal untuk menyusun widget dari kiri ke kanan
    - Digunakan untuk mengatur tata letak info cards dan item cards

- ***Card***

    - Widget Material Design untuk menampilkan informasi dalam bentuk card
    - Digunakan dalam `InfoCard` untuk menampilkan NPM, Nama, dan Kelas

- ***GridView***

    - Menampilkan widget dalam bentuk grid
    - Mengatur layout menu item (Lihat Skin, Tambah Skin, Logout) dalam grid 3 kolom

- ***Container***

    - Widget dasar untuk styling dan padding
    - Digunakan untuk mengatur padding dan dekorasi dalam cards

- ***Material***

    - Memberikan efek visual Material Design pada item cards
    - Mengatur warna dan border radius

- ***InkWell***

    - Memberikan efek ripple saat item ditekan
    - Menangani interaksi tap pada item menu

- ***Text***

    - Menampilkan teks dengan berbagai styling
    - Digunakan untuk judul, konten cards, dan label menu

- ***Icon***

    - Menampilkan ikon Material Design
    - Digunakan dalam menu items (Icons.gps_fixed, Icons.add, Icons.logout)

- ***SizedBox***

    - Memberikan spasi kosong dengan ukuran tetap
    - Digunakan untuk spacing antar widget

- ***Padding***

    - Menambahkan padding di sekitar widget
    - Mengatur jarak antar elemen UI

- ***Center***

    - Menempatkan widget child di tengah
    - Digunakan untuk centering konten


- ***StatelessWidget & StatefulWidget***

    - StatelessWidget: Widget statis tanpa state internal (InfoCard, ItemCard)
    - StatefulWidget: Widget dengan state internal yang bisa berubah (MyHomePage)



### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` adalah method dalam StatefulWidget yang berfungsi untuk memberitahu Flutter framework bahwa telah terjadi perubahan pada internal state widget, yang kemudian memicu proses rebuild widget dan child-nya dengan nilai state yang baru, sehingga perubahan akan tercermin pada UI. Dalam kode yang diberikan, meskipun tidak ada penggunaan `setState()` secara eksplisit, terdapat beberapa variabel yang dideklarasikan sebagai final (`npm`, `name`, `className`, dan `items`) yang tidak dapat diubah langsung dengan `setState()`, namun konten dari List `items` masih bisa dimodifikasi karena yang final hanya wadahnya saja, bukan isinya - misalnya bisa menambah atau menghapus ItemHomepage dari list tersebut menggunakan `setState()`.


### 4. Jelaskan perbedaan antara const dengan final.
- Waktu Inisialisasi:

    - final: Nilai ditetapkan saat runtime (bisa diinisialisasi setelah deklarasi)
    - const: Nilai harus ditetapkan saat compile-time (harus diinisialisasi saat deklarasi)

- Tipe Nilai:

    - final: Bisa menerima nilai yang dihitung saat runtime
    - const: Hanya bisa menerima nilai yang diketahui saat compile-time

- Memory:

    - final: Setiap instance memiliki memory sendiri
    - const: Berbagi memory untuk nilai yang sama (singleton)

Contoh perbedaan dalam kode:
```dart
// FINAL
final waktu = DateTime.now(); // ✅ Valid - dihitung saat runtime
final List<String> list1 = ['a', 'b']; 
list1.add('c');  // ✅ Valid - isi list bisa diubah

// CONST
const waktu = DateTime.now(); // ❌ Error - tidak bisa dihitung saat compile
const List<String> list2 = ['a', 'b'];
list2.add('c');  // ❌ Error - isi list tidak bisa diubah

// Contoh di Widget
const MyWidget({Key? key}) // ✅ Valid - constructor const
final MyWidget({Key? key}) // ❌ Error - constructor tidak bisa final
```

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.


1. Awalnya, saya membuat proyek Flutter baru dengan perintah `flutter create skin_vault`. Kemudian, saya menata ulang struktur proyek dengan memindahkan konten file `main.dart` ke file terpisah, yaitu `menu.dart`. Langkah ini diambil untuk memisahkan logika dari berbagai komponen aplikasi agar lebih rapi dan mudah dipelihara.

2. Saya mengubah judul aplikasi di `main.dart` menjadi "Skin Vault" Di file `menu.dart`, saya menambahkan widget stateless baru bernama `MyHomepage` untuk mengelola widget-widget lain yang akan digunakan di tampilan beranda.

3. Saya membuat widget `InfoCard` untuk menampilkan informasi NPM, kelas, dan nama, dengan menggunakan widget `Card` dan `Text` dari Flutter. Selain itu, saya menambahkan widget `ItemCard` yang berfungsi sebagai tombol-tombol yang dapat ditekan. `ItemCard` menggunakan widget `InkWell` dengan ikon, teks yang relevan, serta properti `onTap` untuk menampilkan SnackBar saat tombol ditekan. Untuk mengatur isi setiap `ItemCard`, saya membuat kelas baru bernama `ItemHomepage` dengan tiga variabel: ikon, teks, dan warna. `ItemCard` menerima sebuah instance `ItemHomepage` agar isinya bisa disesuaikan.

4. Saya membuat tiga tombol untuk "Lihat Daftar Skin", "Tambah Skin", dan "logout" masing-masing dengan warna biru, hijau, dan merah. Widget ItemCard dan `InfoCard` kemudian ditambahkan ke `MyHomepage` dan disusun dengan menggunakan `Row`, `Column`, dan `GridView`. Posisi elemen-elemen ini diatur dengan `Padding` serta properti-properti yang sesuai.

5. Akhirnya, saya membuat repositori baru di GitHub dan melakukan add-commit-push.
</details>

<details>
<summary><b>Tugas 8 (12/11/2024)</b></summary>

## Tugas 8

### 1.  Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?

Di Flutter, `const` digunakan untuk membuat objek atau widget yang bersifat tetap (*immutable*) dan di-compile hanya sekali, sehingga meningkatkan efisiensi memori dan performa dengan mengurangi *rebuilds* dan penggunaan CPU. Sebaiknya gunakan `const` untuk elemen statis yang tidak berubah selama aplikasi berjalan, seperti teks atau ikon tetap, karena ini mencegah Flutter membuat instance baru setiap kali aplikasi di-rebuild. Namun, hindari `const` jika data dinamis atau state yang berubah diperlukan, seperti nilai yang bergantung pada input pengguna atau data dari API.

### 2. Jelaskan dan bandingkan penggunaan *Column* dan *Row* pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Di Flutter, widget `Column` dan `Row` digunakan untuk mengatur tata letak widget secara vertikal dan horizontal. `Column` menyusun widget secara vertikal dari atas ke bawah, sementara `Row` menyusun widget secara horizontal dari kiri ke kanan. Kedua widget ini menerima daftar children, dan memiliki properti seperti `mainAxisAlignment` dan `crossAxisAlignment` untuk mengatur posisi dan jarak antar elemen di dalamnya.

**Perbandingan**
- **Arah Tata Letak**: `Column` untuk tata letak vertikal, `Row` untuk tata letak horizontal.
- **Alignment & Spacing**: `mainAxisAlignment` mengatur penempatan sepanjang sumbu utama (`vertical` pada `Column` dan horizontal pada `Row`), sedangkan `crossAxisAlignment` mengatur penempatan pada sumbu sebaliknya.
- **Constraint**: `Column` sering memerlukan scrolling jika konten lebih tinggi dari layar, sementara `Row` memerlukan scrolling horizontal jika lebarnya melebihi layar.

**Contoh Implementasi**
- **Column** – Menyusun teks dan ikon secara vertikal:
    ```dart
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text('Hello'),
        Icon(Icons.star, color: Colors.blue),
        Text('Flutter'),
    ],
    )
    ```
- **Row** – Menyusun ikon dan teks secara horizontal:
    ```dart
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
        Icon(Icons.home, color: Colors.red),
        Text('Home'),
        Icon(Icons.settings, color: Colors.green),
    ],
    )
    ```
`Column` dan `Row` memudahkan pengaturan tata letak yang rapi dan fleksibel dengan penempatan elemen yang konsisten di Flutter.


### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Pada halaman form `SkinEntryFormPage`, terdapat tiga elemen input utama, yaitu:
- **TextFormField** untuk Skin - digunakan untuk memasukkan nama skin.
- **TextFormField** untuk Quality - digunakan untuk memasukkan kualitas skin.
- **TextFormField** untuk Skin Quantity - digunakan untuk memasukkan jumlah skin, dan di sini memerlukan input angka.

Selain ketiga elemen input ini, Flutter menyediakan berbagai elemen input lainnya yang tidak saya gunakan pada tugas ini, seperti:

- **DropdownButtonFormField**: Elemen ini memungkinkan pengguna memilih satu opsi dari beberapa pilihan yang tersedia, yang bisa lebih efektif untuk input terbatas, seperti kualitas atau jenis skin.
- **Checkbox**: Untuk input berupa pilihan yang bisa diaktifkan atau dinonaktifkan, seperti "setujui syarat dan ketentuan.
- **Switch**: Mirip dengan `Checkbox`, tetapi dengan tampilan yang berbeda, berguna untuk pilihan aktif/nonaktif.
- **Slider**: Untuk input nilai dalam rentang tertentu, misalnya untuk memilih jumlah dengan rentang tertentu atau menyesuaikan ukuran.
- **DatePicker dan TimePicker**: Untuk input tanggal dan waktu.

Dengan menggunakan elemen-elemen ini, aplikasi dapat memberikan pengalaman yang lebih intuitif kepada pengguna, terutama jika input yang diharapkan memiliki tipe data atau opsi yang spesifik.


### 4.  Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Di Flutter, menerapkan tema secara konsisten bisa dilakukan dengan menggunakan `ThemeData` di dalam `MaterialApp`, yang memungkinkan pengaturan tema utama untuk seluruh aplikasi. Berikut adalah langkah-langkah umumnya:

- **Buat `ThemeData` Kustom:**
    - Tentukan warna-warna dasar, seperti warna utama (`primaryColor`), warna aksen (`accentColor`), dan warna latar belakang (`backgroundColor`).
    - Elemen lainnya juga dapat diatur seperti `textTheme`, `buttonTheme`, dan `iconTheme`.

- **Integrasikan ke `MaterialApp`:**
    - Tambahkan `ThemeData` di dalam `theme` dan `darkTheme` (jika ada mode gelap) dari `MaterialApp`.
        ```dart
        ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.orange,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
        ),
        )
        ```

- **Gunakan `Theme.of(context)` Secara Konsisten:**
    - Alih-alih menentukan warna dan gaya secara langsung, panggil `Theme.of(context)` pada widget yang memerlukan gaya khusus agar otomatis mengikuti tema yang telah ditetapkan.
    - Misalnya: `color: Theme.of(context).primaryColor`.

- **Pertimbangkan Sistem Mode Terang & Gelap:**
    - Flutter mendukung mode terang dan gelap. Kamu bisa mengatur tema terang di `theme` dan tema gelap di `darkTheme`, dan biarkan aplikasi secara otomatis beralih sesuai preferensi pengguna.

Saya belum menggunakan tema pada tugas kali ini, tetapi ke depannya saya akan menerapkan tema pada proyek ini dengan menggunakan tema yang sama seperti yang saya gunakan pada proyek sebelumnya, yakni bertema ***"Counter Strike 2"***.


### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Untuk menangani navigasi dalam aplikasi Flutter dengan banyak halaman, bisa menggunakan beberapa metode. Berikut adalah beberapa cara umum yang bisa dipakai:

- **Navigator dengan Push dan Pop**

    Flutter menyediakan `Navigator` yang dapat digunakan untuk berpindah antar halaman (screen) dengan menggunakan `push` untuk menambahkan halaman baru ke stack dan `pop` untuk kembali ke halaman sebelumnya.
    ```dart
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HalamanBaru()),
    );

    // Untuk kembali ke halaman sebelumnya
    Navigator.pop(context);
    ```

- **Named Routes (Rute Bernama)**

    Navigasi dapat dikelola dengan lebih terstruktur menggunakan named routes. Ini berguna jika aplikasi memiliki banyak halaman dan ingin mendeklarasikan rute secara terpisah.

    Pertama, daftarkan rute di dalam `MaterialApp` atau `CupertinoApp`:
    ```dart
    void main() {
    runApp(MaterialApp(
        initialRoute: '/',
        routes: {
        '/': (context) => HalamanUtama(),
        '/halamanBaru': (context) => HalamanBaru(),
        },
    ));
    }
    ```
    Untuk menavigasi ke halaman lain, cukup gunakan nama rutenya:
    ```dart
    Navigator.pushNamed(context, '/halamanBaru');
    ```

- **Navigator 2.0 (Untuk Navigasi yang Lebih Kompleks)**

    Jika aplikasi memiliki navigasi yang lebih kompleks atau membutuhkan kontrol lebih besar atas stack navigasi (misalnya dalam aplikasi dengan banyak halaman dinamis), dapat digunakan **Navigator 2.0**. Navigator ini memberi lebih banyak kontrol, seperti mendukung deep linking, back stack yang lebih fleksibel, dan kemampuan untuk menavigasi berdasarkan status aplikasi.

    Contoh penggunaan **Navigator 2.0** dapat ditemukan pada dokumentasi Flutter terkait dengan **Router** dan **RouteInformationParser**.

- **Bottom Navigation atau Tab Bar**

    Jika aplikasi memiliki beberapa tab atau bagian utama yang bisa diakses dengan mudah, dapat digunakan **BottomNavigationBar** atau **TabBar** untuk mengelola navigasi antar halaman.
    ```dart
    class HalamanUtama extends StatefulWidget {
    @override
    _HalamanUtamaState createState() => _HalamanUtamaState();
    }

    class _HalamanUtamaState extends State<HalamanUtama> {
    int _currentIndex = 0;

    final List<Widget> _pages = [
        Halaman1(),
        Halaman2(),
        Halaman3(),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
            setState(() {
                _currentIndex = index;
            });
            },
            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
            ],
        ),
        );
    }
    }
    ```

- **Drawer untuk Navigasi Samping**

    Jika ingin menyediakan navigasi samping, dapat digunakan `Drawer`. Drawer akan muncul dari sisi kiri layar dengan menu navigasi yang bisa dipilih.
    ```dart
    Scaffold(
    appBar: AppBar(title: Text('Aplikasi Saya')),
    drawer: Drawer(
        child: ListView(
        children: <Widget>[
            ListTile(
            title: Text('Halaman 1'),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Halaman1()));
            },
            ),
            ListTile(
            title: Text('Halaman 2'),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Halaman2()));
            },
            ),
        ],
        ),
    ),
    body: HalamanUtama(),
    );
    ```
Metode-metode ini dapat dipilih berdasarkan skenario yang ada dalam aplikasi Flutter.
</details>




