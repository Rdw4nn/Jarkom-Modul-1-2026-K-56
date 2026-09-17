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


# S0AL 17 | HTTP C2

Pada soal ini dilakukan analisis terhadap file capture `wired_http_c2.pcap` menggunakan Wireshark untuk mengidentifikasi aktivitas HTTP yang dilakukan oleh attacker dalam mengunduh payload berbahaya ke sistem Alice.
Informasi yang dicari meliputi:

- Nama domain (Host) tempat malware diunduh
- IP address server penyerang
- Nama file executable malware yang diunduh
- Kode status HTTP yang dikembalikan

Hasil analisis kemudian divalidasi menggunakan socket server melalui `nc [IP_GROUP] 3404`.

Berikut LAngkahnya :
1. Open `wired_http_c2.pcap` menggunakan Wireshark.
2. Karena soal meminta analisis lalu lintas HTTP, input `http` pada **Display Filter**.
3. Untuk mencari file executable malware yang diunduh, gunakan Display Filter:
   `http.request.uri contains ".exe"`

4. Dari hasil filter, ditemukan packet dengan request:
   `GET /navi_agent.exe HTTP/1.1`

5. Buka bagian **Hypertext Transfer Protocol** pada packet tersebut. Dari bagian tersebut dapat ditemukan:
   `Host: wired-update.net`

   Sehingga nama domain tempat malware diunduh adalah:

   `wired-update.net`

6. Dari packet tersebut juga dapat diketahui alamat IP server penyerang. Pada bagian **Internet Protocol Version 4** terlihat:
   `Src: 10.7.1.50`

   `Dst: 203.0.113.42`

   Karena request dikirim dari Alice menuju server, maka IP server penyerang adalah:

   `203.0.113.42`

7. Dari request HTTP juga ditemukan nama file executable yang diunduh:

   `navi_agent.exe`

8. Selanjutnya periksa packet response setelah request `GET /navi_agent.exe HTTP/1.1`.

   Pada packet tersebut terdapat:

   `HTTP/1.1 200 OK`

   Sehingga kode status HTTP yang dikembalikan adalah:

   `200 OK`

9. Setelah mendapatkan seluruh informasi yang diperlukan, buka terminal dan jalankan:

   `nc [IP_GROUP] 3404`

   Gunakan `IP_GROUP` yang telah disediakan di mastersheet karena kelompok yang digunakan adalah **Group C**.

10. Jawab seluruh pertanyaan dari socket server menggunakan informasi yang telah diperoleh dari hasil analisis Wireshark.

11. Setelah semua jawaban benar, akan muncul flag:

    `flag : Congratulations! Here is your flag: KOMJAR26{...}`


# S0AL 18 | SMB Transfer

Pada soal ini dilakukan analisis terhadap file capture `wired_smb_transfer.pcapng` menggunakan Wireshark untuk mengidentifikasi aktivitas transfer file malware melalui protokol SMB.

Informasi yang dicari meliputi:

- Nama protokol jaringan yang dieksploitasi
- IP address pengirim
- IP address penerima
- Folder tujuan penyimpanan malware pada sistem korban
- Nama file executable malware yang ditransfer

Hasil analisis kemudian divalidasi menggunakan socket server melalui `nc [IP_GROUP] 3405`.

Berikut LAngkahnya :

1. Open `wired_smb_transfer.pcapng` menggunakan Wireshark.

2. Karena soal meminta analisis lalu lintas SMB, input `smb2` pada **Display Filter**.

3. Dari hasil filter, terlihat komunikasi menggunakan protokol **SMB2**.

4. Untuk melihat proses transfer file, perhatikan packet yang memiliki informasi seperti:

   `Create Request`

   `Write Request`

   `Close Request`

5. Pada packet **Create Request** ditemukan:

   `Create Request, File: System32\wired_trojan_payload.exe`

   Dari informasi tersebut dapat diketahui folder tujuan penyimpanan malware adalah:

   `System32`

6. Pada packet tersebut juga dapat dilihat alamat IP:

   `Src: 10.7.3.100`

   `Dst: 10.7.1.50`

   Namun, untuk menentukan pengirim dan penerima file, perhatikan alur transfer pada packet **Write Request**. File ditransfer dari sistem attacker menuju sistem korban.

7. Dari alur komunikasi SMB pada capture, diperoleh:

   - IP Pengirim: `10.7.1.50`
   - IP Penerima: `10.7.3.100`

8. Nama file executable malware yang ditransfer adalah:

   `wired_trojan_payload.exe`

9. Pada proses **Tree Connect** juga terlihat akses ke administrative share:

   `\\10.7.1.50\ADMIN$`

   Kemudian file ditulis pada lokasi:

   `System32\wired_trojan_payload.exe`

10. Setelah mendapatkan seluruh informasi yang diperlukan, buka terminal dan jalankan:

    `nc [IP_GROUP] 3405`

    Gunakan `IP_GROUP` yang telah disediakan di mastersheet karena kelompok yang digunakan adalah **Group C**.

11. Jawab seluruh pertanyaan dari socket server menggunakan informasi yang telah diperoleh dari hasil analisis Wireshark.

12. Setelah semua jawaban benar, akan muncul flag:

    `flag : Congratulations! Here is your flag: KOMJAR26{...}`

    
