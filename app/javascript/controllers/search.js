import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const searchForm = this.element.querySelector(".search-form");
    const filterForm = this.element.querySelector(".filter-form");

    if (searchForm) {
      searchForm.addEventListener("submit", (event) => {
        event.preventDefault(); // Prevent the default form submission
        const query = searchForm.querySelector("#query").value;
        const filter = filterForm ? filterForm.querySelector("#search_query_filter").value : null;
        this.searchMoves(query, filter);
      });
    }

    if (filterForm) {
      filterForm.addEventListener("submit", (event) => {
        event.preventDefault(); // Prevent the default form submission
        const query = searchForm ? searchForm.querySelector("#query").value : null;
        const filter = filterForm.querySelector("#search_query_filter").value;
        this.searchMoves(query, filter);
      });
    }
  }

  searchMoves(query, filter) {
    const url = new URL("/company_index", window.location.origin);
    url.searchParams.set("query", query);
    url.searchParams.set("filter", filter);

    fetch(url)
      .then(response => response.text())
      .then(html => {
        const moveGrid = document.querySelector(".move-grid");
        moveGrid.innerHTML = html;
      })
      .catch(error => {
        console.error("Search request failed:", error);
      });
  }
}
