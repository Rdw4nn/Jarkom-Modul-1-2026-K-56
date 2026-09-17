# Jarkom-Modul-1-2026-K-56

| No  | Nama                           | NRP        |
| --- | ------------------------------ | ---------- |
| 1   | Sahira Bilqis Rivadito         | 5027251037 |
| 2   | Muhammmad Ridwan               | 5027251113 |

HAI BOS BEKASI




# S0AL 14 | PROtocol 7
  Pada soal ini dilakukan analisis terhadap file capture `wired_bruteforce.pcapng` menggunakan Wireshark untuk mengidentifikasi aktivitas brute-force terhadap form login web.

Informasi yang dicari meliputi:

- IP address attacker
- IP address + port target
- Username yang berhasil ditembus
- Password yang digunakan
- Web server software beserta versinya

Hasil analisis kemudian divalidasi menggunakan socket server melalui `nc [IP_GROUP C] 3401`.

Berikut LAngkahnya : 
1. Open `wired_bruteforce.pcapng` menggunakan Wireshark
2. Input `http.request.method == "POST"` in Display filter dan karena serangannya berupa brute-force terhadap form login web
3. kita fokus mencari user lain_admin, maka put `http contains "lain_admin"` di Display filter
4. Open **Hypertext Transfer Protocol**, dan cari apa yang di perlukan. Pada soal di perlukan seperti list yang di atas untuk deperlukan dalam Netcat
5. Open terminal, put `nc [IP_GROUP C] 3401` dan gunakan ip_group_c yang telah di sediakan di mastersheet (karna kita group c).
6. Jawab semua pertanyaan dengan semua informasi yang telah kamu dapatkan

7. nanti gambar + `flag : Congratulations! Here is your flag: KOMJAR26{W1r3d_Brut3_1bBmXXuaxjlV9hNvBrTk60Bcl} `


# S0AL 15 | USB HID

Pada soal ini dilakukan analisis terhadap file capture `wired_usb_hid.pcap` menggunakan Wireshark untuk mengidentifikasi perangkat USB keyboard berbahaya yang digunakan untuk mencuri keystroke.

Informasi yang dicari meliputi:

- Vendor ID perangkat USB
- Product ID perangkat USB
- Device Address perangkat USB
- Pesan rahasia yang berhasil dicuri dari keystroke

Hasil analisis kemudian divalidasi menggunakan socket server melalui `nc [IP_GROUP C] 3402`.

Berikut LAngkahnya :
1. Open `wired_usb_hid.pcap` menggunakan Wireshark.
2. Input `usb.device_address` pada **Display Filter** untuk mencari komunikasi perangkat USB.
3. Cari packet **GET DESCRIPTOR Response DEVICE**, kemudian buka bagian **DEVICE DESCRIPTOR**.
4. Pada bagian **DEVICE DESCRIPTOR**, cari informasi:
   - **idVendor** → Vendor ID
   - **idProduct** → Product ID
5. Untuk mencari alamat perangkat USB, gunakan Display Filter: `usb.device_address != 0`
6. Dari hasil filter tersebut, ditemukan **Device Address = 7**. Alamat ini digunakan untuk memfokuskan analisis terhadap komunikasi perangkat USB tersebut.
7. Untuk melihat data keystroke, fokus pada packet **URB_INTERRUPT in** dari perangkat dengan Device Address 7. Kemudian buka bagian **USB URB** dan cari **Leftover Capture Data**. 
8. Untuk melihat nya lebih mudah, klik kanan pada **Leftover Capture Data**, kemudian **Apply as column** atau ke menu file pojok kiri atas kemudian **Export Packet dissection** kemudian put ke AI suruh focus Decode Capture data nya ><
10. Setelah mendapatkan seluruh informasi yang diperlukan, buka terminal dan jalankan:

    `nc [IP_GROUP C] 3402`

    Gunakan `IP_GROUP_C` yang telah disediakan di mastersheet karena kelompok yang digunakan adalah **Group C**.

11. Jawab seluruh pertanyaan dari socket server menggunakan informasi yang telah diperoleh dari hasil analisis Wireshark.

    `flag : Congratulations! Here is your flag: KOMJAR26{...}`

12. gambar + flag boom!


# S0AL 16 | FTP Theft

Pada soal ini dilakukan analisis terhadap file capture `wired_ftp_theft.pcapng` menggunakan Wireshark untuk mengidentifikasi aktivitas FTP yang dilakukan oleh attacker dan file malware yang diunduh.

Informasi yang dicari meliputi:

- IP address server FTP penyerang
- Banner software FTP yang digunakan
- Kredensial login attacker
- Nama file malware yang diunduh
- Ukuran file malware dalam bytes

Hasil analisis kemudian divalidasi menggunakan socket server melalui `nc [IP_GROUP] 3403`.

Berikut LAngkahnya :
1. Open `wired_ftp_theft.pcapng` menggunakan Wireshark.
2. Karena soal meminta analisis lalu lintas FTP, input `ftp` pada **Display Filter**.
3. Pada packet yang muncul, cari response dengan kode `220` karena response tersebut merupakan banner yang dikirimkan oleh FTP server ketika terjadi koneksi. Untuk memfilter response tersebut, gunakan: `ftp.response.code == 220`
5. Dari hasil analisis ditemukan **banner** : `220 Welcome to Wired FTP Server (vsftpd 3.0.5)` Sehingga software FTP yang digunakan adalah **vsftpd 3.0.5**.
6. Dari packet tersebut juga dapat diketahui bahwa **IP server FTP** penyerang adalah: `198.51.100.7`
7. Selanjutnya cari **kredensial login attacker** dengan menggunakan Display Filter: `ftp.request.command == "USER" || ftp.request.command == "PASS"`
8. Dari hasil analisis ditemukan login attacker :
   `USER knights_agent`
   `PASS N4v1_s3cur3_2026`
   Sehingga kredensial yang digunakan adalah : `knights_agent:N4v1_s3cur3_2026`
9. Selanjutnya cari **file malware** yang diunduh menggunakan Display Filter : `ftp.request.command == "RETR"`
10. Cari packet yang memiliki request : `RETR knights_payload.exe`
11. Setelah menemukan packet tersebut, lihat response dari server. Pada capture terdapat: `Response: 213 524288` dan `Response: 150 Opening BINARY mode data connection for knights_payload.exe (524288 bytes).`. Dari response tersebut dapat diketahui bahwa ukuran file `knights_payload.exe` adalah: `524288 bytes`
13. Setelah mendapatkan seluruh informasi yang diperlukan, buka terminal dan jalankan: `nc [IP_GROUP] 3403`.  Gunakan `IP_GROUP` yang telah disediakan di mastersheet karena kelompok yang digunakan adalah **Group C**.
14. Jawab seluruh pertanyaan dari socket server menggunakan informasi yang telah diperoleh dari hasil analisis Wireshark.
15. Setelah semua jawaban benar, akan muncul flag:

    `flag : Congratulations! Here is your flag: KOMJAR26{...}`
