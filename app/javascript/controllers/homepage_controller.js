import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {
  static targets = ["circle1", "column", "button"];

  connect() {
    console.log("Connected");
  }
  changeColor() {
    this.circle1Target.style.backgroundColor = '#DEAC3D'
    this.columnTarget.style.backgroundColor = '#ddd1bd';
  }
  changeColorBack () {
    this.circle1Target.style.backgroundColor = '#e46023';
    this.columnTarget.style.backgroundColor = '#000';
  }
}
