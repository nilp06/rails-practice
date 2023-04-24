import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!";
    // alert("This is alert");
  }
  greet() {
    console.log("Hello, Stimulus!", this.element);
    alert("This is greet action.");
  }
}
