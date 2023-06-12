
document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('form');
  const pages = document.getElementsByClassName('page');
  const prevBtns = document.querySelectorAll('[id^="prevBtn"]');
  const nextBtns = document.querySelectorAll('[id^="nextBtn"]');

  let currentPage = 0;

  function showPage(pageIndex) {
    for (let i = 0; i < pages.length; i++) {
      if (i === pageIndex) {
        pages[i].style.display = 'block';
      } else {
        pages[i].style.display = 'none';
      }
    }
  }

  function navigateToNextPage() {
    if (currentPage < pages.length - 1) {
      currentPage++;
      showPage(currentPage);
    }
  }

  function navigateToPrevPage() {
    if (currentPage > 0) {
      currentPage--;
      showPage(currentPage);
    }
  }

  for (let i = 0; i < nextBtns.length; i++) {
    nextBtns[i].addEventListener('click', navigateToNextPage);
  }

  for (let i = 0; i < prevBtns.length; i++) {
    prevBtns[i].addEventListener('click', navigateToPrevPage);
  }
});
