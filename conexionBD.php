<?php

$conexion = mysqli_connect("localhost","root","","votaciones_db");

try {
    $pdo = new PDO("mysql:host=localhost;dbname=votaciones_db", "root", "");
    // Establecer el modo de error PDO a excepción
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
    exit();
}
?>
