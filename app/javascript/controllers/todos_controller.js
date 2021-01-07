import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["form", "description", "information"]

    showForm(e) {
        this.formTarget.classList.toggle("hidden");
    }

    disconnect() {
        console.log('disconnected');
        this.hideForm();
        super.connect();
    }

    showDescriptionContainer() {
        this.descriptionTarget.classList.remove("hidden");
        this.informationTarget.classList.add("hidden");
    }

    hideForm() {
        this.formTarget.classList.add("hidden");
    }
}