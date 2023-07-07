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
    const newHead = document.getElementById("new-head");
    const editHead = document.getElementById("modal-edit-heads");
    const newMember = document.getElementById("new-member");
    const editMember = document.getElementById("edit-member");
    editHead.innerHTML = "";
    newHead.innerHTML ="";
    newMember.innerHTML="";
    editMember.innerHTML="";

    // Remove the src attribute from the modal
    editHead.removeAttribute("src");
    newHead.removeAttribute("src");
    newMember.removeAttribute("src");
    editMember.removeAttribute("src");

    // Remove complete attribute
    editHead.removeAttribute("complete");
    newHead.removeAttribute("complete");
    newMember.removeAttribute("complete");
    editMember.removeAttribute("complete");
  }
}
