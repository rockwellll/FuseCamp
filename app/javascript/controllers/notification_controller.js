import { Controller } from "stimulus";

export default class extends Controller{
    static targets = ["container"]

    hide() {
        this.containerTarget.classList.replace('notification__pop__in', 'notification__pop__out');
    }
}