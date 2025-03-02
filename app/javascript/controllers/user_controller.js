import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["periodoFields", "diaFields"]

  connect() {
    console.log("Estou no user.");
    //this.toggleFields(); // Executa a lógica ao carregar a página
  }

  toggleFields(event) {
    //const tipo = this.element.querySelector("#user_user_indisps_attributes_0_tipo").value
    const tipo = event.target.value;
    console.log(tipo);

    if (tipo === "P") {
      this.periodoFieldsTarget.style.display = "block";
      this.diaFieldsTarget.style.display = "none";
    } else if (tipo === "D") {
      this.periodoFieldsTarget.style.display = "none";
      this.diaFieldsTarget.style.display = "block";
    } else {
      this.periodoFieldsTarget.style.display = "none";
      this.diaFieldsTarget.style.display = "none";
    }    console.log("Estou no user.");
  }
  
  toggleFields_velho(event) {
    //const tipo = this.element.querySelector("#user_user_indisps_attributes_0_tipo").value
    const tipo = event.target.value;
    console.log(tipo);

    if (tipo === "P") {
      this.periodoFieldsTargets.forEach(field => field.style.display = "block")
      this.diaFieldsTargets.forEach(field => field.style.display = "none")
    } else if (tipo === "D") {
      this.periodoFieldsTargets.forEach(field => field.style.display = "none")
      this.diaFieldsTargets.forEach(field => field.style.display = "block")
    }
    console.log("Estou no user velho.");
  }
}