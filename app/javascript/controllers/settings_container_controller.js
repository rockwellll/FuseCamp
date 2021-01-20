import { Controller } from "stimulus";

export default class extends Controller{
    static targets= ["container", "trigger", 'editTrigger']

    connect() {
        this.ensureContainerIsHidden();
        super.connect();
    }

    ensureContainerIsHidden() {
        this.element.classList.remove("expanded");
    }

    showContainer() {
        this.element.classList.add("expanded");
    }

    hideContainer() {
        this.element.classList.remove("expanded");
    }
    showMenu() {
        this.element.reset();
    }

    hideContainerBeforeSubmitting() {
        this.hideContainer();
    }
}