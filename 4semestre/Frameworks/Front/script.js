// Obtém o formulário
var form = $('form');

// Obtém os campos de entrada
var nome = $('#nome');
var telefone = $('#telefone');
var email = $('#email');

// Define a validação dos campos
function validarCampos() {
  if (nome.val().trim() === '') {
    alert('Por favor, preencha o campo Nome');
    nome.focus();
    return false;
  }

  if (telefone.val().trim() === '') {
    alert('Por favor, preencha o campo Telefone');
    telefone.focus();
    return false;
  }

  if (email.val().trim() === '') {
    alert('Por favor, preencha o campo Email');
    email.focus();
    return false;
  }

  return true;
}

// Define a ação de enviar o formulário
function enviarFormulario(event) {
    event.preventDefault();
  
    if (validarCampos()) {
      // Envie o formulário aqui
      form.submit();
      // Exibe um pop-up animado de sucesso
      Swal.fire({
        icon: 'success',
        title: 'Formulário enviado com sucesso!',
        showConfirmButton: false,
        timer: 5000,
        timerProgressBar: true,
        html: '<img src="sucesso.png" style="width: 100px; height: 100px;"><br><br><p style="color: #6D4C41; font-size: 18px;">Obrigado por entrar em contato!</p>',
        showCloseButton: true,
        closeButtonHtml: '<button>Fechar</button>',
        customClass: {
          container: 'swal2-overflow',
          popup: 'swal2-popup-animated',
          closeButton: 'swal2-styled',
          title: 'swal2-title-animated',
          htmlContainer: 'swal2-html-container-animated',
          confirmButton: 'swal2-confirm-styled'
        }
      });
    }
  }

// Define a ação de limpar o formulário
function limparFormulario() {
  form.trigger('reset');
}

// Define as ações dos botões
form.find('button[type="submit"]').on('click', enviarFormulario);
form.find('button[type="reset"]').on('click', limparFormulario);
