import { Controller } from "stimulus";

export default class extends Controller{
    static targets = ["menu", "todo"];
    static values = { id: String}

    showMenu() {
        this.menuTarget.classList.toggle('hidden');
    }
}