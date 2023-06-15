import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {
  static targets = ["bidid"]
  connect() {

  }

  update(event) {
    event.preventDefault()
    event.stopImmediatePropagation();

     fetch("/update_bid_status", {
          method: "POST",
          body: JSON.stringify({ id: event.target.dataset.bid }),
          headers: { "Content-Type": "application/json" }
        }).then(r => r.text())
        .then(html => {
          this.element.innerHTML = html;
          location.reload();
        });
  }

}
