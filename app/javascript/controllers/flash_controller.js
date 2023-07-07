import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  dismiss() {
    this.element.remove();
  }

  close(e) {
    // Prevent default action
    e.preventDefault();
    // Remove from parent
    const modal = document.getElementById("modal-edit-heads");
    const newHead = document.getElementById("new-head")
    modal.innerHTML = "";
    newHead.innerHTML ="";

    // Remove the src attribute from the modal
    modal.removeAttribute("src");
    newHead.removeAttribute("src");

    // Remove complete attribute
    modal.removeAttribute("complete");
    newHead.removeAttribute("complete");
  }
}
