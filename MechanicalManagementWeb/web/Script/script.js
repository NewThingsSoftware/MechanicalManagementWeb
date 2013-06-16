function validaNumero(numero){
    if(isNaN(numero.value)){
        alert('Digite apenas numero');
        numero.value = '';
        numero.focus();
    }
}

function validaForm(form){
    for(i = 0; i < form.elements.length; i++){
        if(form.elements[i] == 1 || form.elements[i].value == '' ){
            alert('Preencha todos os campos');
            return false;
        }
    }
    return true;
}