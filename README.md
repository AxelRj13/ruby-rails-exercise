# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* How to use rails console with active record (rails c)

- sebelum melakukan ini perlu generate model dulu dengan kolom-kolom yang akan dibuat di table. Contoh: `rails generate model Book title:string page:integer description:text`

- Model dan file migration nya akan terbuat otomatis

- Migrate table ke database dengan command `rake db:migrate`

- Setelah table berhasil digenerate, model akan otomatis tersambung dengan table

- Ketik `rails console` / `rails c` di terminal

    - `b = Books.new` -> buat instance dari suatu model
    - `b.title = '...'` -> set value dari kolom title
    - `b.page = 500` -> set value dari kolom page
    dst...
    - jika sudah selesai maka ketik `b.save` untuk commit transaction ke database

- Cara lain untuk membuat instance:
    - `b = Book.new(title: 'belajar reactjs', page: 200, description: 'buku tentang library js yang sedang  hype')`
    - `Book.create(title: 'PHP in action', page: 420, description:'PHP is still good for web development')`

- Cara untuk update active record:
    - Find / Select record yang akan diupdate terlebih dahulu dengan `book = Book.find(1)`
    - lalu update kolom yang diinginkan misal `book.title=...`
    - Jika sudah selesai maka lakukan `book.save` untuk commit transaction

    - cara lain yaitu dengan `book.update(title: 'asdasd', page: ...)`
    - jika pakai cara ini maka tidak perlu save lagi tapi sudah langsung ter-save otomatis

- Cara untuk delete active record:
    - Find / Select record yang akan diupdate terlebih dahulu dengan `book = Book.find(1)`
    - `book.destroy`

- Cara query:
    - `Book.where(page:200)` -> query untuk cari data yang page nya 200
    - `book = Book.where(page:200)` -> tampung ke dalam variable untuk nanti ditampilkan hasilnya
    - `book.first.title` -> mendapatkan data buku pertama, lalu mengambil kolom title nya
    - `book.last.title` -> mendapatkan data buku terakhir, lalu mengambil kolom title nya
    - `book[1].title` -> mendapatkan data buku di index 1, lalu mengambil kolom title nya
    - `book = Book.where(page:200).first` -> hanya ambil 1 data dengan page nya = 200