# Unit Test
 
 Dalam aplikasi ini, saya menambahkan validator (validateTodoInput) yang berfungsi untuk mengecek apakah title kosong atau berisikan spasi pada saat menambah task yang dimasukkan pengguna.

 ## Logika Validasi
 - Jika input kosong atau hanya berisi spasi, fungsi akan mengembalikan pesan error: "Title can't be empty"
 - Jika input valid (tidak kosong) maka fungsi akan mengembalikan nilai null.

 Sehingga testnya sendiri dibagi menjadi 2, mengecek ketika input kosong dan tidak kosong.

 ## Cara menjalankan test
 Dalam direktori aplikasi, ketik "flutter test" atau "flutter test test/validator_test.dart" pada terminal.