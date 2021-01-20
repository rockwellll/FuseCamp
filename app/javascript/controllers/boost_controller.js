import { Controller } from "stimulus";

export default class extends Controller{
    static targets = ['deleteIcon'];

    connect() {
        this.ensureDeleteIconHasCorrectClass();
        super.connect();
    }

    ensureDeleteIconHasCorrectClass() {
        this.deleteIconTarget.classList.add('hidden')
    }

    toggleDeleteIconVisibility() {
        this.deleteIconTarget.classList.toggle('hidden');
    }
}