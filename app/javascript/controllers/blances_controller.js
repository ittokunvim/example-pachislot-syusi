import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blances"
export default class extends Controller {
  static targets = ["result"];

  connect() {
    const result = this.resultTarget;
    const resultTextLength = result.textContent.replaceAll(/\+/g, "").length;
    const resultText = result.textContent.replaceAll(/,|円/g, "");
    const resultNum = Number(resultText);

    if (resultNum === 0) {
      this.resultTarget.classList.add("zero");
    } else if (resultNum > 0) {
      result.textContent = result.textContent.padStart(resultTextLength + 1, "+");
      this.resultTarget.classList.add("plus");
    } else {
      this.resultTarget.classList.add("minus");
    }
  }
}
