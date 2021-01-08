import { Controller } from "stimulus";

export default class extends Controller {
    static targets=["specific", "specificSelected", "range", "rangeSelected", "unspecifiedSelected"];

    showSpecific() {
        this.hideRange();
        this.hideUnspecified();

        this.specificTarget.classList.remove('hidden');
        this.specificTarget.focus();
        this.specificSelectedTarget.classList.replace('border','border-4');
    }

    hideSpecific() {
        this.specificTarget.classList.add('hidden');
        this.specificSelectedTarget.classList.replace('border-4','border');
    }


    showUnspecified() {
        this.hideRange();
        this.hideSpecific();

        this.unspecifiedSelectedTarget.classList.replace('border','border-4');
    }

    hideUnspecified() {
        this.unspecifiedSelectedTarget.classList.replace('border-4','border');
    }

    showRange() {
        this.hideSpecific();
        this.hideUnspecified();

        this.rangeTarget.classList.remove('hidden');
        this.rangeSelectedTarget.classList.replace('border','border-4');
    }

    hideRange() {
        this.rangeTarget.classList.add('hidden');
        this.rangeSelectedTarget.classList.replace('border-4','border');
    }
}