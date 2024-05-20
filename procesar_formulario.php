<?php
session_start();
include "conexionBD.php";

// Función para validar el RUT
function validarRUT($rut)
{
    if (!preg_match('/^[0-9]+-[0-9kK]{1}$/', $rut)) {
        return false;
    }

    $rutParts = explode('-', $rut);
    $rutSinDigito = $rutParts[0];
    $digitoVerificador = strtoupper($rutParts[1]);

    $suma = 0;
    $multiplo = 2;

    for ($i = strlen($rutSinDigito) - 1; $i >= 0; $i--) {
        $suma += $rutSinDigito[$i] * $multiplo;
        $multiplo = $multiplo < 7 ? $multiplo + 1 : 2;
    }

    $dvEsperado = 11 - ($suma % 11);
    $dvEsperado = $dvEsperado == 11 ? '0' : ($dvEsperado == 10 ? 'K' : (string) $dvEsperado);

    return $dvEsperado === $digitoVerificador;
}

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Inicializar variables y manejar los posibles valores nulos
    $nombre_apellido = isset($_POST["nombre_apellido"]) ? $_POST["nombre_apellido"] : '';
    $alias = isset($_POST["alias"]) ? $_POST["alias"] : '';
    $rut = isset($_POST["rut"]) ? $_POST["rut"] : '';
    $email = isset($_POST["email"]) ? $_POST["email"] : '';
    $region_id = isset($_POST["region"]) ? $_POST["region"] : null;
    $comuna_id = isset($_POST["comuna"]) ? $_POST["comuna"] : null;
    $candidato_id = isset($_POST["candidatos"]) ? $_POST["candidatos"] : null;
    $medio_social = isset($_POST["redes"]) ? implode(", ", $_POST["redes"]) : '';

    // Validar el RUT
    if (!validarRUT($rut)) {
        header("Location: index.php?error=RUT inválido.");
        exit();
    }

    $sql = "SELECT * FROM votantes WHERE rut = :rut";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':rut', $rut);
    $stmt->execute();
    $existingVote = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($existingVote) {
        // Se envia un mensaje de error si se registra mas de un voto con el mismo rut
        $error = "Ya has votado antes.";
        header("Location: index.php?error=" . urlencode($error));
        exit();
    }



    // Obtener los nombres de región, comuna y candidato basados en los IDs
    $region = '';
    if ($region_id) {
        $sqlRegion = "SELECT nombre FROM regiones WHERE id = ?";
        $stmtRegion = $conexion->prepare($sqlRegion);
        $stmtRegion->bind_param("i", $region_id);
        $stmtRegion->execute();
        $resultRegion = $stmtRegion->get_result();
        $region = $resultRegion->fetch_assoc()['nombre'];
    }

    $comuna = '';
    if ($comuna_id) {
        $sqlComuna = "SELECT nombre FROM comunas WHERE id = ?";
        $stmtComuna = $conexion->prepare($sqlComuna);
        $stmtComuna->bind_param("i", $comuna_id);
        $stmtComuna->execute();
        $resultComuna = $stmtComuna->get_result();
        $comuna = $resultComuna->fetch_assoc()['nombre'];
    }

    $candidato = '';
    if ($candidato_id) {
        $sqlCandidato = "SELECT nombre FROM candidatos WHERE id = ?";
        $stmtCandidato = $conexion->prepare($sqlCandidato);
        $stmtCandidato->bind_param("i", $candidato_id);
        $stmtCandidato->execute();
        $resultCandidato = $stmtCandidato->get_result();
        $candidato = $resultCandidato->fetch_assoc()['nombre'];
    }

    // Validar que los datos obligatorios no estén vacíos
    if (empty($nombre_apellido) || empty($alias) || empty($rut) || empty($email) || empty($region) || empty($comuna) || empty($candidato)) {
        header("Location: index.php?error=Todos los campos son obligatorios.");
        exit();
    }

    // Consulta SQL para insertar los datos a la base de datos
    $sql = "INSERT INTO votantes (nombre_apellido, alias, rut, email, region, comuna, candidato, medio_social)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("ssssssss", $nombre_apellido, $alias, $rut, $email, $region, $comuna, $candidato, $medio_social);
    
    
    if ($stmt->execute() === TRUE) {
        // Redireccionar si los datos se guardan correctamente
        header("Location: index.php?success=Votación realizada con éxito.&nombre_apellido=" . urlencode($nombre_apellido) . "&rut=" . urlencode($rut) . "&candidato=" . urlencode($candidato));
        exit();
    } else {
        header("Location: index.php?error=Error al guardar los datos.");
        exit();
    }
}

$conexion->close();
?>