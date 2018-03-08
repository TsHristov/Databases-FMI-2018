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
