import { Controller } from "@hotwired/stimulus"

// Connects to
export default class extends Controller {
  connect() {

    var currentPage = 1;
    showPage(currentPage);

    document.getElementById('nextBtn1').addEventListener('click', function () {
      nextPage(1);
    });

    document.getElementById('prevBtn1').addEventListener('click', function () {
      nextPage(-1);
    });

  /*   document.getElementById('form').addEventListener('submit', function (e) {
      e.preventDefault();
      alert('Form submitted successfully!');
    }); */

    function showPage(pageNumber) {
      var pages = document.getElementsByClassName('page');
      for (var i = 0; i < pages.length; i++) {
        pages[i].style.display = 'none';
      }
      pages[pageNumber - 1].style.display = 'block';
    }

    function nextPage(n) {
      var pages = document.getElementsByClassName('page');
      if (currentPage + n >= 1 && currentPage + n <= pages.length) {
        currentPage += n;
        showPage(currentPage);
      }
    }

    const inputFields = document.querySelectorAll('.input-container input[type="date"], .input-container input[type="text"]');

    // inputFields.forEach(function (inputField) {
    //   inputField.addEventListener('focus', function () {
    //     const icon = inputField.previousElementSibling;
    //     icon.style.display = 'none';
    //   });

    //   inputField.addEventListener('blur', function () {
    //     const icon = inputField.previousElementSibling;
    //     if (inputField.value === '') {
    //       icon.style.display = 'block';
    //     }
    //   });
    // });

  }
}
