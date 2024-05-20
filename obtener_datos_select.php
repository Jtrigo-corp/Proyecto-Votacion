<?php
include "conexionBD.php";

// Función para obtener los valores de la tabla
function obtenerValores($conexion, $tabla) {
    $sql = "SELECT * FROM $tabla";
    $resultado = $conexion->query($sql);

    $valores = [];
    if ($resultado->num_rows > 0) {
        while ($fila = $resultado->fetch_assoc()) {
            $valores[] = $fila;
        }
    }

    return $valores;
}

// Obtener regiones, comunas y candidatos
$regiones = obtenerValores($conexion, "regiones");
$comunas = obtenerValores($conexion, "comunas");
$candidatos = obtenerValores($conexion, "candidatos");

$conexion->close();
?>
