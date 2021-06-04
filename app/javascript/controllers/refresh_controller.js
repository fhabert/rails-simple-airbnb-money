import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "nbflats" ]
  connect() {
      this.update();
  }
  update() {
    fetch('/', {
        headers: { accept: "application/json" }})
        .then(response => response.json())
        .then((data) => {
            this.nbflatsTarget.innerText = `Here are your ${data.flats.length} flats`;
    });
  }
}