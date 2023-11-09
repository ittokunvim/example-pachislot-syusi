import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shared"
export default class extends Controller {
  static targets = ["notice"];

  delete() {
    this.noticeTarget.remove();
  }
}
