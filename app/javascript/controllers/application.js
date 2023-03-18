import { Application } from "@hotwired/stimulus"
import StimulusReflex from 'stimulus_reflex'
import ApplicationController from "./application_controller"
import Consumer from '../channels/consumer'
import PasswordVisibility from 'stimulus-password-visibility'

const application = Application.start()
application.register('password-visibility', PasswordVisibility)

// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

StimulusReflex.initialize(application, {ApplicationController, Consumer, isolate: true, debug: true })

export { application }
