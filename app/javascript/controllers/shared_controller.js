import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shared"
export default class extends Controller {
  static targets = ["field"];

  delete() {
    this.fieldTarget.remove();
  }
}
