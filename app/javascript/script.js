
document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('form');
  const pages = document.getElementsByClassName('page');
  const prevBtns = document.getElementById('prevBtn1');
  const nextBtns = document.getElementById('nextBtn1');

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

    nextBtns.addEventListener('click', navigateToNextPage);
    prevBtns.addEventListener('click', navigateToPrevPage);

});
