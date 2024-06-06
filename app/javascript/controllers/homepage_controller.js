import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="homepage"
export default class extends Controller {
  static targets = ["circle1", "column"];

  connect() {
    // Check if the current page is the homepage
    if (window.location.pathname === "/") {
      this.hideFooter();
    }
    if (window.location.pathname === "/") {
      this.hideNavbar();
    }
  }

  changeColor() {
    document.body.style.backgroundColor = '#ddd1bd';
    this.circle1Target.style.backgroundColor = '#DEAC3D';
    this.columnTarget.style.backgroundColor = '#ddd1bd';
  }

  changeColorBack() {
    this.circle1Target.style.backgroundColor = '#e46023';
    this.columnTarget.style.backgroundColor = '#000';
    document.body.style.backgroundColor = '#000';
  }

  hideFooter() {
    // Get the footer element
    const footer = document.querySelector("footer");
    if (footer) {
      // Hide the footer by setting its display property to none
      footer.style.display = "none";
    }
  }

  hideNavbar() {
    const navbar = document.querySelector(".navbar");
    if (navbar) {
      navbar.style.display = "none";
    }
  }
}
