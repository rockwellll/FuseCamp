import {Controller} from 'stimulus';

export default class extends Controller {
    static targets = ['radio', 'input'];
    static values = {
        color: String
    };

    connect() {
        this.element.classList.add(`bg-${this.colorValue}-100`);
        super.connect();

        this.radioTargets.find(radio => radio.value === this.colorValue).checked = true;
    }

    reset() {
        this.element.classList.replace(`bg-${this.colorValue}-100`, `bg-white-100`);
        this.clearInput();

        this.radioTargets.forEach(radio => {
           radio.checkd =false ;

           if(radio.value === "white") {
               radio.click();
           }
        });
    }

    pick(e) {
        this.element.classList.replace(`bg-${this.colorValue}-100`, `bg-${e.target.value}-100`);
        this.colorValue = e.target.value;
    }

    clearInput() {
        this.inputTarget.value = "";
    }
}