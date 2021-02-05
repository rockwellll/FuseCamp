import { Controller } from "stimulus";

export default class extends Controller{
    static targets = ["container"];
    static values= {
        content: String
    };

    connect() {
        if(this.contentValue) {
            this.show();
        } else {
            this.element.classList.remove('show__notification')
        }
        super.connect();
    }

    show() {
        this.element.classList.add('show__notification')
    }

    hide() {
        this.element.classList.remove('show__notification');
    }
}