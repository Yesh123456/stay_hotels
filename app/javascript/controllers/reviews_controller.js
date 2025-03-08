import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["review"];
  
  connect() {
    this.expanded = false;
  }

  toggle() {
    this.reviewTargets.forEach((review, index) => {
      if (index >= 2) {
        review.classList.toggle("hidden");
      }
    });

    this.expanded = !this.expanded;
    event.target.textContent = this.expanded ? "Show Less" : "Show More";
  }
}
