import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"
export default class extends Controller {
  static targets = ["card", "link", "name", "price"];

  enter() {
    this.cardTarget.classList.add("hovered");
    this.cardTarget.classList.remove("custom-card")

    this.linkTarget.classList.add("shown")
    this.linkTarget.classList.remove("hidden")

    this.nameTarget.classList.remove("planet-name-dark")
    this.nameTarget.classList.add("planet-name-bright")

    this.priceTarget.classList.remove("planet-price-dark")
    this.priceTarget.classList.add("planet-price-bright")
  }

  leave() {
    this.cardTarget.classList.remove("hovered");
    this.cardTarget.classList.add("custom-card")

    this.linkTarget.classList.add("hidden")
    this.linkTarget.classList.remove("shown")

    this.nameTarget.classList.remove("planet-name-bright")
    this.nameTarget.classList.add("planet-name-dark")

    this.priceTarget.classList.remove("planet-price-bright")
    this.priceTarget.classList.add("planet-price-dark")
  }
}
