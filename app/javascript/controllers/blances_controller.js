import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blances"
export default class extends Controller {
  static targets = ["result"];

  connect() {
    const result = this.resultTarget;
    const resultNum = Number(result.textContent);
    if (resultNum === 0) {
      this.resultTarget.classList.add("zero");
    } else if (resultNum > 0) {
      result.textContent = `+${resultNum}`;
      this.resultTarget.classList.add("plus");
    } else {
      this.resultTarget.classList.add("minus");
    }
  }
}
