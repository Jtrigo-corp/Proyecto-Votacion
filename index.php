<!DOCTYPE html>
<html>

<head>
    <title>Proyecto Votación</title>
    <link rel="stylesheet" href="estilos.css">
    <script src="scripts.js"></script>
</head>

<body>
    <?php include 'obtener_datos_select.php'; ?>

    <form method="post" action="procesar_formulario.php" name="form" id="form" onsubmit="return validarFormulario()"
        novalidate>
        <fieldset>
            <?php if (isset($_GET['error'])): ?>
                <div class="error-message" style="color: red;"><?= htmlspecialchars($_GET['error']) ?></div>
            <?php endif; ?>
            <h3>FORMULARIO DE VOTACIÓN:</h3>
            <table>
                <tr>
                    <td><label for="nombre_apellido">Nombre y Apellido</label></td>
                    <td>
                        <input type="text" id="nombre_apellido" name="nombre_apellido" class="inputs" maxlength="25"
                            pattern=".{5,25}" required
                            value="<?= htmlspecialchars($_POST['nombre_apellido'] ?? '') ?>" />
                    </td>
                </tr>
                <tr>
                    <td><label for="alias">Alias</label></td>
                    <td>
                        <input type="text" id="alias" name="alias" class="inputs" required maxlength="15"
                            oninput="validarAlias(this)" value="<?= htmlspecialchars($_POST['alias'] ?? '') ?>" />
                    </td>
                </tr>
                <tr>
                    <td><label for="rut">RUT</label></td>
                    <td>
                        <input type="text" id="rut" name="rut" class="inputs" maxlength="15" required
                            value="<?= htmlspecialchars($_POST['rut'] ?? '') ?>" />
                    </td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td>
                        <input type="email" id="email" name="email" class="inputs" maxlength="50" required
                            value="<?= htmlspecialchars($_POST['email'] ?? '') ?>" />
                    </td>
                </tr>
                <tr>
                    <td><label for="region">Región</label></td>
                    <td>
                        <select id="region" name="region" class="inputs">
                            <option value="" disabled selected></option>
                            <?php foreach ($regiones as $region): ?>
                                <option value="<?= $region['id']; ?>" <?= (isset($_POST['region']) && $_POST['region'] == $region['id']) ? 'selected' : '' ?>>
                                <?= $region['nombre']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="comuna">Comuna</label></td>
                    <td>
                        <select id="comuna" name="comuna" class="inputs" disabled>
                            <option value="" disabled selected></option>
                            <?php foreach ($comunas as $comuna): ?>
                                <option value="<?= $comuna['id']; ?>" data-region="<?= $comuna['region_id']; ?>"
                                    <?= (isset($_POST['comuna']) && $_POST['comuna'] == $comuna['id']) ? 'selected' : '' ?>>
                                    <?= $comuna['nombre']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="candidatos">Candidato</label></td>
                    <td>
                        <select id="candidatos" name="candidatos" class="inputs">
                            <option value="" disabled selected></option>
                            <?php foreach ($candidatos as $candidato): ?>
                                <option value="<?= $candidato['id']; ?>" <?= (isset($_POST['candidatos']) && $_POST['candidatos'] == $candidato['id']) ? 'selected' : '' ?>>
                                    <?= $candidato['nombre']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>¿Cómo se enteró de Nosotros?</label></td>
                    <td id="checkbox-group">
                        <label><input type="checkbox" name="redes[]" value="Web" <?= (isset($_POST['redes']) && in_array('Web', $_POST['redes'])) ? 'checked' : '' ?>> Web</label>
                        <label><input type="checkbox" name="redes[]" value="TV" <?= (isset($_POST['redes']) && in_array('TV', $_POST['redes'])) ? 'checked' : '' ?>> TV</label>
                        <label><input type="checkbox" name="redes[]" value="Redes Sociales" <?= (isset($_POST['redes']) && in_array('Redes Sociales', $_POST['redes'])) ?
                         'checked' : '' ?>> Redes
                            Sociales</label>
                        <label><input type="checkbox" name="redes[]" value="Amigo" <?= (isset($_POST['redes']) && in_array('Amigo', $_POST['redes'])) ? 'checked' : '' ?>>
                         Amigo</label>
                    </td>
                </tr>
            </table>
            <input id="btn_votar" type="submit" value="Votar" name="btn" />

            <div id="errorContainer" style="color: red; display: none;">
                <?php
                if (isset($_SESSION['error'])) {
                    echo htmlspecialchars($_SESSION['error']);
                    unset($_SESSION['error']); // Limpiar la variable de sesión después de mostrar el mensaje
                }
                ?>
                <span id="errorNombre_apellido" class="error-message"></span><br>
                <span id="errorAlias" class="error-message"></span><br>
                <span id="errorRUT" class="error-message"></span><br>
                <span id="errorEmail" class="error-message"></span><br>
                <span id="errorRegion" class="error-message"></span><br>
                <span id="errorComuna" class="error-message"></span><br>
                <span id="errorCandidato" class="error-message"></span><br>
                <span id="errorMediosSociales" class="error-message"></span>
            </div>

        </fieldset>
    </form>

</body>

</html>