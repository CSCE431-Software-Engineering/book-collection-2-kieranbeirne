document.addEventListener('DOMContentLoaded', function() {
    var deleteButton = document.getElementById('delete_book_button');
    if (deleteButton) {
      deleteButton.addEventListener('click', function(event) {
        if (!confirm('Are you sure you want to delete this book?')) {
          event.preventDefault();
        }
      });
    }
  });
