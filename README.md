# Jarkom-Modul-1-2026-K-56

| No  | Nama                           | NRP        |
| --- | ------------------------------ | ---------- |
| 1   | Sahira Bilqis Rivadito         | 5027251037 |
| 2   | Muhammmad Ridwan               | 5027251113 |

HAI BOS BEKASI




# Protocol 7 - Brute Force Analysis

## 1. Deskripsi

Pada tugas ini dilakukan analisis terhadap file capture `wired_bruteforce.pcapng` menggunakan Wireshark untuk mengidentifikasi aktivitas brute-force terhadap form login web.

Informasi yang dicari meliputi:

- IP address attacker
- IP address target
- Port target yang diserang
- Username yang berhasil ditembus
- Password yang digunakan
- Web server software beserta versinya

Hasil analisis kemudian divalidasi menggunakan socket server melalui `nc`.

---

## 2. Tools yang Digunakan

- **Wireshark** - untuk menganalisis network packet capture
- **Netcat (nc)** - untuk melakukan validasi jawaban melalui socket server
- File capture: `wired_bruteforce.pcapng`

---

## 3. Analisis PCAP

### 3.1 Mencari HTTP POST Request

Karena serangan dilakukan terhadap form login web, langkah pertama adalah mencari HTTP POST request menggunakan filter:

```text
http.request.method == "POST"
