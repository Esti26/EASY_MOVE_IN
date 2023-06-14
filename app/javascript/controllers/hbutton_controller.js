import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  hire(event) {
    event.preventDefault();
    const button = event.target;

    // Make the AJAX request to update the bid and move
    fetch(button.getAttribute("href"), { method: "PATCH" })
      .then((response) => response.text())
      .then((html) => {
        // Update the UI with Turbo Streams
        const turboStreamElement = document.createElement("div");
        turboStreamElement.innerHTML = html;
        turboStreamElement.querySelectorAll("turbo-frame[turbo-frame-action='replace']").forEach((frame) => {
          const id = frame.getAttribute("id");
          const content = frame.innerHTML;
          const target = document.getElementById(id);
          if (target) {
            target.innerHTML = content;
          }
        });
      })
      .catch((error) => {
        console.error("An error occurred while updating bid and move.", error);
      });
  }
}
