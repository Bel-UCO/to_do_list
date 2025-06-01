# to_do_list

A new Flutter project.

# MVVM Overview
Model-View-ViewModel (MVVM) adalah arsitektur perangkat lunak yang memisahkan logika bisnis, logika antarmuka, dan data, sehingga kode menjadi lebih terorganisir, mudah diuji, dan dipelihara. Dalam konteks Flutter, implementasi MVVM membantu memisahkan UI dari logika aplikasi menggunakan pendekatan yang modular.

Komponen utama dalam MVVM:

Model
Model merepresentasikan data dan logika bisnis aplikasi. Ini biasanya berupa kelas-kelas data dan fungsi yang mengelola operasi data, seperti mengambil data dari database, API, atau penyimpanan lokal. Dalam assignment saya, terdapat task dan task_repository.

View
View adalah antarmuka pengguna yang menampilkan data kepada pengguna dan menerima input. Dalam Flutter, ini adalah widget seperti Scaffold, ListView, TextField, dan lainnya. View tidak mengandung logika bisnis. Dalam view, terdapat add_task dan task_list.

ViewModel
ViewModel menjembatani antara Model dan View. Ia mengelola state aplikasi dan menyediakan data yang telah diproses ke View. ViewModel juga menangani input dari View dan meneruskan perintah ke Model. Dalam Flutter, ViewModel dapat diimplementasikan dengan ChangeNotifier dan dipadukan dengan Provider untuk state management. Dalam viewModel terdapat task_view_model.

# Instruction
Memerlukan jdk versi 17 untuk dapat berjalan dengan baik. Selain itu dijalankan secara biasa dengan "flutter run" dan aplikasi siap digunakan. Aplikasi hanya bisa menambahkan dan menghapus task.

# Refleksi

Dalam proses pengembangan aplikasi to-do list menggunakan Flutter, saya mengalami berbagai tantangan teknis yang memberikan pembelajaran baru. Salah satu kendala utama yang saya temui adalah ketika secara tidak sengaja memasukkan file .hprof ke dalam Git repository. Meskipun file tersebut sudah saya hapus dari direktori proyek, ukurannya yang besar tetap tersimpan di riwayat Git, menyebabkan ukuran repository membengkak secara tidak wajar.

Untuk mengatasi masalah tersebut, saya mempelajari dan menggunakan BFG Repo-Cleaner, sebuah tool untuk menghapus file dari riwayat Git secara permanen. Saya juga menjalankan perintah git reflog expire, git gc, dan git push --force untuk membersihkan dan mengompres repository secara menyeluruh. Dari sini, saya belajar pentingnya berhati-hati saat melakukan commit, serta memahami bahwa menghapus file dari folder saja tidak cukup jika file sudah terlanjur masuk ke history Git.

Tantangan lainnya datang dari sisi konfigurasi environment saat menggunakan plugin path_provider. Saat menjalankan proyek, saya mengalami error yang ternyata disebabkan oleh versi JDK yang saya gunakan, yaitu JDK 21. Versi ini terlalu tinggi dan belum sepenuhnya kompatibel dengan beberapa plugin Flutter, termasuk path_provider, yang membutuhkan JDK 17. Setelah mengganti versi JDK dan mengatur ulang JAVA_HOME, barulah proyek bisa berjalan dengan lancar. Ini menjadi pelajaran penting bagi saya tentang kompatibilitas versi dalam pengembangan perangkat lunak.

Dari pengalaman ini, saya tidak hanya belajar cara mengembangkan aplikasi, tetapi juga bagaimana memecahkan masalah teknis, mengelola repository Git dengan baik, serta pentingnya memastikan tools dan dependensi yang digunakan berada pada versi yang tepat.