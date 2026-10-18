#  Analisis Data Reservasi Hotel: Manajemen Pembatalan & Optimasi Pendapatan

##  Deskripsi Proyek
Proyek ini bertujuan untuk menyelesaikan tantangan operasional dalam industri perhotelan, khususnya tingginya tingkat pembatalan, variasi *lead time*, dan optimalisasi *Average Daily Rate* (ADR). Melalui pendekatan *end-to-end data analytics*, proyek ini mengevaluasi kinerja dua jenis hotel (City Hotel dan Resort Hotel) untuk memberikan rekomendasi strategis berbasis data yang dapat meningkatkan stabilitas pendapatan dan efisiensi manajemen reservasi.

Catatan: *Raw data* tidak dilampirkan dalam repositori ini karena batasan ukuran file, namun dataset merupakan data historis pemesanan hotel (Hotel Booking Demand) publik yang telah dibersihkan dan dapat direproduksi menggunakan *script* yang tersedia.

##  Teknologi & *Tools*
* **Bahasa Pemrograman:** Python, SQL
* **Library Python:** Pandas, Matplotlib, Seaborn, SciPy
* **Visualisasi Tambahan:** Tableau *(Tautan Dashboard tersedia di bawah)*
* **Data Processing:** Data Cleaning, Imputasi Data, Deteksi & Penanganan Outlier (Metode IQR)
* **Analisis & Statistik:** *Exploratory Data Analysis* (EDA), A/B Testing (Uji T-test, KS Test, Levene Test)
* **Lainnya:** Pemodelan Proses Bisnis (BPMN)

## 🗂️ Struktur Repositori
```text
├── data/
│   └── data_cleaned.csv         # Dataset hasil pembersihan (siap pakai)
├── notebooks/
│   └── EDA_and_AB_Testing.ipynb # Jupyter notebook (Data Prep, EDA, Statistik)
├── sql/
│   └── data_extraction.sql      # Kumpulan kueri SQL (CTE, Agregasi)
├── images/                      # Folder penyimpanan aset visualisasi
│   ├── rasio_pembatalan.png
│   ├── pola_pendapatan.png
│   └── pemesanan_last_minute.png
└── README.md
