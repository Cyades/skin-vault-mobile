# ( -_•)︻デ═一 Skin Vault Mobile 
**Nama:**   Malvin Scafi<br>
**NPM:**    2306152430<br>
**Kelas:**  PBP F<br>

Hasil proyek dapat dilihat pada [link berikut](pcd).

### Tugas Sebelumnya
| [Tugas 7](#7️⃣-tugas-7) |
| - |

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


