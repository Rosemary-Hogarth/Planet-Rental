import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover-circle"
export default class extends Controller {
  static targets = ["circle"];

  enter () {
    this.circleTarget.classList.remove("circle-orange")
    this.circleTarget.classList.add("circle-yellow")
  }

  leave () {
    this.circleTarget.classList.remove("circle-yellow")
    this.circleTarget.classList.add("circle-orange")
  }
}
