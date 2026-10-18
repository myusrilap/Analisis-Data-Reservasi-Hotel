-- 1. Tingkat Pembatalan Reservasi Berdasarkan Tahun
SELECT
    hotel,
    arrival_date_year,
    (COUNT(CASE WHEN is_canceled = 1 THEN 1 END) * 100.00 / COUNT(*)) AS cancellation_rate
FROM dwh.data_cleaned
GROUP BY
    hotel,
    arrival_date_year
ORDER BY
    hotel,
    arrival_date_year;

-- 2. Rata-rata Lead Time untuk Setiap Total Special Request
WITH AvgLeadTime AS (
    SELECT AVG(lead_time) AS overall_avg_lead_time
    FROM dwh.data_cleaned
),
average_lead_time_above_average AS (
    SELECT
        total_of_special_requests,
        AVG(lead_time) AS average_lead_time
    FROM dwh.data_cleaned
    JOIN AvgLeadTime alt ON lead_time > alt.overall_avg_lead_time
    GROUP BY total_of_special_requests
)
SELECT
    total_of_special_requests,
    average_lead_time
FROM average_lead_time_above_average
WHERE average_lead_time > (SELECT AVG(average_lead_time) FROM average_lead_time_above_average)
ORDER BY total_of_special_requests;

-- 3. Tanggal Reservasi dengan Pendapatan Tertinggi
SELECT
    reservation_status_date,
    SUM(adr) AS total_revenue
FROM dwh.data_cleaned
WHERE reservation_status = 'Check-Out' 
  AND total_of_special_requests > 2
GROUP BY reservation_status_date
ORDER BY total_revenue DESC
LIMIT 1;

-- 4. Pengelompokkan Data Lead Time dan Rata-rata ADR
WITH LeadTimeGroups AS (
    SELECT
        CASE
            WHEN lead_time < 0 THEN 'Negative Lead Time'
            WHEN lead_time BETWEEN 0 AND 30 THEN '0-30 Days'
            WHEN lead_time BETWEEN 31 AND 60 THEN '31-60 Days'
            WHEN lead_time BETWEEN 61 AND 90 THEN '61-90 Days'
            ELSE '91+ Days'
        END AS lead_time_range,
        adr
    FROM dwh.data_cleaned
)
SELECT
    lead_time_range,
    AVG(adr) AS average_adr
FROM LeadTimeGroups
GROUP BY lead_time_range;
