import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")

    let popover = new bootstrap.Popover(this.sourceTarget, {placement: 'bottom'})
    popover.show()
  }
}
