import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["collapsible", "description", "information"]

    show() {
        this.collapsibleTarget.classList.toggle("hidden");
    }

    connect() {
        this.hide();
        super.connect();
    }

    hide() {
        this.collapsibleTarget.classList.add("hidden");
    }
}