import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="uf"
export default class extends Controller {
  static targets = ["cidadeSelect"]

  change(event) {
    console.log('alterado!')
    let uf = event.target.selectedOptions[0].value
    let target = this.cidadeSelectTarget.id

    get (`/estabelecimentos/cidades?target=${target}&uf=${uf}`, { 
      responseKind: "turbo-stream" 
    }) 
  }
}
