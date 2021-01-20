import { Controller } from "stimulus";

export default class extends Controller{
    static targets = ['form', 'trigger'];

    connect() {
        this.ensureFormHasCorrectClass();
        this.ensureTriggerHasCorrectClass();
        this.hideForm();
        super.connect();
    }

    ensureTriggerHasCorrectClass() {
        this.triggerTarget.classList.add('toggle__boost')
    }

    ensureFormHasCorrectClass() {
        this.formTarget.classList.add('new__boost');
    }

    showForm() {
        this.element.classList.add('expanded__boost');
    }

    hideForm() {
        this.element.classList.remove('expanded__boost');
    }
}