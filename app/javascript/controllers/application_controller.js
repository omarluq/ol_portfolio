import { Controller } from "@hotwired/stimulus"
import StimulusReflex from 'stimulus_reflex';

export default class extends Controller {
    
    connect() {
        StimulusReflex.register(this)
    }

    // example before reflex general hook
    // beforeReflex() {
    //     console.log('before reflex');
    // }

    stopProp(e) {
        e.preventDefault()
        e.stopPropagation()
    }
}