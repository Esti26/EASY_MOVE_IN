import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['button'];


  hire() {
    console.log("hello")

  }
}
