./sqlite3.exe "chinook.db"

1.1
SELECT TrackId 
    FROM tracks
    WHERE Milliseconds < 1000000;

1.2 
SELECT InvoiceId as invoiceID, Total as Total
    FROM invoices 
    WHERE BillingCountry ="USA" OR BillingCountry ="Canada"
    ORDER BY InvoiceID DESC ;

1.3
SELECT albumId, count(*) as count
    FROM tracks
    GROUP BY albumId --Group by is needed to work
    HAVING count(*) >= 25 ;
1.4 

