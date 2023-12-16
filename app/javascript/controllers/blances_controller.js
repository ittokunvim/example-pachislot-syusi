import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blances"
export default class extends Controller {
  static targets = ["result"];

  connect() {
    const result = this.resultTarget;
    const resultText = result.textContent.replaceAll(/,|円/g, "");
    const resultNum = Number(resultText);

    if (resultNum === 0) {
      this.resultTarget.classList.add("zero");
    } else if (resultNum > 0) {
      result.textContent = `+${result.textContent}`;
      this.resultTarget.classList.add("plus");
    } else {
      this.resultTarget.classList.add("minus");
    }
  }
}
