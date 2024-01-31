import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blances"
export default class extends Controller {
  static targets = ["image"];

  delete() {
    this.imageTarget.remove();
  }
}
