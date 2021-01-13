import { Controller } from "stimulus";

export default class extends Controller{
    static targets= ['settingsContainer', 'trigger']

    connect() {
        this.ensureContainerIsHidden();
        super.connect();
    }

    ensureContainerIsHidden() {
        this.settingsContainerTarget.classList.add('hidden');
    }

    toggleContainerVisibility() {
        this.settingsContainerTarget.classList.toggle('hidden');
    }
}