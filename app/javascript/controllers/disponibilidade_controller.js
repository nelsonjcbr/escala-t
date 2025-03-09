// app/javascript/controllers/disponibilidade_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  
  verificarDisponibilidade(event) {
    const usuarioId = event.target.value;
    const escalacmptId = this.element.dataset.escalacmptId; // Acessa o ID do escalacmpt
    
    console.log('user: %d, escalacmpt: %d', usuarioId, escalacmptId);
    if (usuarioId) {
      fetch(`/escalacmpts/${escalacmptId}/atualizar_formulario?user_id=${usuarioId}`, {
        headers: {
          Accept: "text/vnd.turbo-stream.html",
        },
      })
      .then(response => {
        if (!response.ok) {
          throw new Error("Erro na requisição");
        }
        return response.text();
      })
      .then(html => {
        document.getElementById("escala").innerHTML = html;
      })
      .catch(error => {
        console.error("Erro ao buscar dados:", error);
        document.getElementById("escala").innerHTML = "<p>Erro ao carregar os dados. Tente novamente.</p>";
      });
    } else {
      document.getElementById("escala").innerHTML = "<p>Selecione um usuário para ver os detalhes.</p>";
    }
  }
}