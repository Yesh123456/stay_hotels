import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["mainImage"];

  change(event) {
    this.mainImageTarget.src = event.currentTarget.src;
  }
}
