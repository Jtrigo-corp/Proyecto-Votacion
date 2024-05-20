document.addEventListener("DOMContentLoaded", function () {
    const regionSelect = document.getElementById("region");
    const comunaSelect = document.getElementById("comuna");

    if (regionSelect) {
        regionSelect.addEventListener("change", function () {
            const selectedRegion = this.value;
            const options = comunaSelect.querySelectorAll("option");

            options.forEach(option => {
                if (option.getAttribute("data-region") === selectedRegion || option.value === "") {
                    option.style.display = "block";
                } else {
                    option.style.display = "none";
                }
            });

            comunaSelect.value = ""; // Reiniciar la selección de comuna
            comunaSelect.disabled = selectedRegion === ""; // Deshabilitar el campo de selección de comuna si no se selecciona ninguna región
            if (selectedRegion !== "") {
                comunaSelect.removeAttribute("disabled"); // Habilitar el campo de selección de comuna
            }
        });
    }
});

function validarFormulario() {
    var isValid = true;
    var nombre_apellido = document.getElementById("nombre_apellido").value;
    var errorNombre_apellido = document.getElementById("errorNombre_apellido");
    var rut = document.getElementById("rut").value;
    var errorRUT = document.getElementById("errorRUT");
    var alias = document.getElementById("alias").value;
    var errorAlias = document.getElementById("errorAlias");
    var region = document.getElementById("region").value;
    var errorRegion = document.getElementById("errorRegion");
    var comuna = document.getElementById("comuna").value;
    var errorComuna = document.getElementById("errorComuna");
    var candidato = document.getElementById("candidatos").value;
    var errorCandidato = document.getElementById("errorCandidato");
    var email = document.getElementById("email").value;
    var errorEmail = document.getElementById("errorEmail");
    var redesSeleccionadas = document.querySelectorAll('input[name="redes[]"]:checked'); 
    var errorMediosSociales = document.getElementById("errorMediosSociales"); 

    // Limpiar mensajes de error previos
    errorNombre_apellido.style.display = "none";
    errorRUT.style.display = "none";
    errorAlias.style.display = "none";
    errorRegion.style.display = "none";
    errorComuna.style.display = "none";
    errorCandidato.style.display = "none";
    errorEmail.style.display = "none";
    errorMediosSociales.style.display = "none"; 

    if (nombre_apellido.trim() === "") {
        errorNombre_apellido.style.display = "inline";
        errorNombre_apellido.innerText = "El campo Nombre y Apellido no puede estar en blanco.";
        isValid = false;
    }

    if (!validarRUT(rut)) {
        errorRUT.style.display = "inline";
        errorRUT.innerText = "RUT inválido o campo incompleto.";
        isValid = false;
    }

    if (!/^(?=.*[a-zA-Z])(?=.*\d).{5,15}$/.test(alias)) {
        errorAlias.style.display = "inline";
        errorAlias.innerText = "El alias debe tener al menos 5 caracteres y contener letras y números.";
        isValid = false;
    }

    if (region === "") {
        errorRegion.style.display = "inline";
        errorRegion.innerText = "Debes seleccionar una región.";
        isValid = false;
    }

    if (comuna === "") {
        errorComuna.style.display = "inline";
        errorComuna.innerText = "Debes seleccionar una comuna.";
        isValid = false;
    }

    if (candidato === "") {
        errorCandidato.style.display = "inline";
        errorCandidato.innerText = "Debes seleccionar un candidato.";
        isValid = false;
    }

    if (email === "" || !/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email)) {
        errorEmail.style.display = "inline";
        errorEmail.innerText = "Correo electrónico inválido.";
        isValid = false;
    }

    // Validar que se hayan seleccionado al menos dos opciones en los checkboxes de "¿Cómo se enteró de Nosotros?"
    if (redesSeleccionadas.length < 2) {
        errorMediosSociales.style.display = "inline";
        errorMediosSociales.innerText = "Debe seleccionar al menos dos opciones de como nos conociste.";
        isValid = false;
    }
    
    // Mostrar mensajes de error en el contenedor errorContainer
    var errorContainer = document.getElementById("errorContainer");
    errorContainer.style.display = isValid ? "none" : "block";

    return isValid;
}



//Validacion de RUT formato chileno
function validarRUT(rut) {
    if (!/^[0-9]+-[0-9kK]{1}$/.test(rut)) {
        return false;
    }

    var rutSinDigito = rut.split('-')[0];
    var digitoVerificador = rut.split('-')[1].toUpperCase();

    var suma = 0;
    var multiplo = 2;

    for (var i = rutSinDigito.length - 1; i >= 0; i--) {
        suma += rutSinDigito.charAt(i) * multiplo;
        multiplo = multiplo < 7 ? multiplo + 1 : 2;
    }

    var dvEsperado = 11 - (suma % 11);
    dvEsperado = dvEsperado == 11 ? '0' : dvEsperado == 10 ? 'K' : dvEsperado.toString();

    return dvEsperado === digitoVerificador;
}