/* Longest track in milliseconds in the database */
SELECT Name as "Track Name",
       min(Milliseconds) as "Length"
     FROM tracks;

/* Invoices with more than 10 dollars in total amount */
SELECT InvoiceId as "Invoice ID",
       Total as "Total"
     FROM invoices
     WHERE Total > 10
     ORDER BY InvoiceId ASC;

/* Invoices with more than 3 tracks in the details */
SELECT invoices.InvoiceId as "Invoice ID",
       count(invoice_items.TrackId) as "Tracks count"
     FROM invoices
     JOIN
     invoice_items ON invoices.InvoiceId = invoice_items.InvoiceId
     GROUP BY invoices.InvoiceId
     HAVING count(invoice_items.TrackId) > 3
     ORDER BY count(invoice_items.TrackId) ASC;
     
/* Total number of sales per employee. */
SELECT	employees.FirstName as "First Name",
	employees.LastName as "Last Name",
	count(InvoiceId) as "Sales Count"
  FROM invoices
       JOIN
       customers ON invoices.CustomerId = customers.CustomerId
       JOIN
       employees ON customers.SupportRepId = employees.EmployeeId
  GROUP BY employees.EmployeeId;

/* Total number of customers served by employee */
SELECT employees.FirstName as "First Name",
       employees.LastName as "Last Name",
       count(customers.CustomerId) as "Number of served customers"
  FROM customers
       JOIN
       employees ON customers.SupportRepId = employees.EmployeeId
  GROUP BY employees.EmployeeId;

/* Artists with albums with more than 3 songs */
SELECT DISTINCT artists.Name as "Artist Name",
       		albums.Title as "Album Title",
		count(tracks.TrackId) as "Count of songs"
       FROM artists
       	    JOIN
	    albums ON albums.ArtistId = artists.ArtistId
	    JOIN
	    tracks ON tracks.AlbumId = albums.AlbumId
       GROUP BY artists.Name
       HAVING count(tracks.TrackId) > 3
       ORDER BY count(tracks.TrackId) ASC;

/* Longest track per album */
SELECT albums.Title as "Album Title",
       tracks.Name as "Track Name",
       max(tracks.Milliseconds) as "Track Length"
  FROM albums
       JOIN
       tracks ON tracks.AlbumId = albums.AlbumId
       GROUP BY albums.Title;

       
