import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["statusLink", "card"];

  toggleStatus(event) {
    event.preventDefault();
    const link = event.target;
    const status = link.getAttribute("data-value");

    this.statusLinkTargets.forEach((statusLink) => {
      statusLink.classList.remove("active");
    });
    link.classList.add("active");

    this.cardTargets.forEach((card) => {
      const cardStatus = card.getAttribute("data-status");

      if (status === "all" || status === cardStatus) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  }
}
