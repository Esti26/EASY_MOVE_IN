import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'
// Connects to data-controller="popup"
export default class extends Controller {
  static values = { id: String }
  open(e) {
    const show = document.getElementById(this.idValue)

    e.stopImmediatePropagation();
    console.log("this.idValue",this.idValue)
    Swal.fire({
      html: show.innerHTML,
      width: "80vw",
      heightAuto: false,
      showConfirmButton: false,
      // timer: 3000,
      // timerProgressBar: true,
      showCloseButton: true,

    })
  }
}
