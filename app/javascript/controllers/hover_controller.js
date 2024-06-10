import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"

export default class extends Controller {
  static targets = ["card", "link", "name", "price", "img"];

  enter() {
    this.cardTarget.classList.add("hovered");
    this.linkTarget.classList.add("shown");
    this.nameTarget.classList.add("planet-name-bright");
    this.priceTarget.classList.add("planet-price-bright");
    this.imgTarget.classList.add("card-img-wrapper-hovered");
  }

  leave() {
    this.cardTarget.classList.remove("hovered");
    this.linkTarget.classList.remove("shown");
    this.nameTarget.classList.remove("planet-name-bright");
    this.priceTarget.classList.remove("planet-price-bright");
    this.imgTarget.classList.remove("card-img-wrapper-hovered");
  }
}
