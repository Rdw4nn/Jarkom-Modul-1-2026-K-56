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

7. nanti gambar
