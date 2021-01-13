import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy() {
    alert('hhhh');
    this.sourceTarget.select()
    document.execCommand("copy")
  }
}
