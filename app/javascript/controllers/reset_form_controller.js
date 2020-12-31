import { Controller } from "stimulus";

export default class extends Controller{
    showMenu() {
        this.element.reset();
    }
}