import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello")
    const searchForm = this.element.querySelector(".search-form");
    const filterForm = this.element.querySelector(".filter-form");

    if (searchForm) {
      searchForm.addEventListener("keyup", (event) => {
        event.preventDefault(); // Prevent the default form submission
        const query = searchForm ? searchForm.value : null;
        const filter = filterForm.querySelector("#search_query_filter").value;
        console.log(filter, query);
        this.searchMoves(query, filter);
      });
    }

    if (filterForm) {
      filterForm.addEventListener("change", (event) => {
        event.preventDefault(); // Prevent the default form submission
        const query = searchForm ? searchForm.value : null;
        const filter = filterForm.querySelector("#search_query_filter").value;
        this.searchMoves(query, filter);
      });
    }
  }

  searchMoves(query, filter) {
    const url = new URL("/companies", window.location.origin);
    url.searchParams.set("query", query);
    url.searchParams.set("filter", filter);

    console.log(url.toString());
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then(html => {
        const moveGrid = document.querySelector(".move-grid");
        moveGrid.innerHTML = html;
      })
      .catch(error => {
        console.error("Search request failed:", error);
      });
  }

  sort() {
    console.log("hello")
  }
}
