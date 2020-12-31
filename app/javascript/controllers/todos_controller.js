import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["form", "description", "information"]

    showForm(e) {
        this.formTarget.classList.toggle("hidden");
    }

    showDescriptionContainer() {
        this.descriptionTarget.classList.remove("hidden");
        this.informationTarget.classList.add("hidden");
    }

    hideForm() {
        this.formTarget.classList.add("hidden");
    }
}