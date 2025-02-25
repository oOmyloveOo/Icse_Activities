document.addEventListener("DOMContentLoaded", async function() {
  try {
      const response = await fetch('library.xml');
      const data = await response.text();
      const parser = new DOMParser();
      const xmlDoc = parser.parseFromString(data, "text/xml");
      const books = xmlDoc.getElementsByTagName('book');
      const booksData = Array.from(books).map(book => ({
          title: book.querySelector('title').textContent,
          author: book.querySelector('author').textContent,
          year: book.querySelector('year').textContent,
          isbn: book.querySelector('isbn').textContent
      }));
      renderBooksTable(booksData);
  } catch (error) {
      console.error('Error fetching XML:', error);
  }
});

function renderBooksTable(booksData) {
  const tbody = document.querySelector('#booksTable tbody');
  tbody.innerHTML = '';
  booksData.forEach(book => {
      const row = document.createElement('tr');
      row.innerHTML = `
          <td>${book.title}</td>
          <td>${book.author}</td>
          <td>${book.year}</td>
          <td>${book.isbn}</td>
      `;
      tbody.appendChild(row);
  });
}


