// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"
import { Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"
import ApplicationController from './application_controller'
import 'tw-elements'


// Register each controller with Stimulus
// import controllers from "./**/*_controller.js"
// controllers.forEach((controller) => {
//   application.register(controller.name, controller.module.default)
// })

application.register("application-controller", ApplicationController)

