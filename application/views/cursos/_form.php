<?php echo form_open($action); ?>

<!-- Está todo con inputs de texto, hay que cambiar algunos campos que no tienen sentido con este tipo de inputs -->
<div class="field">
  <label for="anyo_inicio">Año de inicio:</label>
  <input type="text" name="anyo_inicio" value="<?= $curso->anyo_inicio ?>" />
</div>
<div class="field">
    <label for="num_semanas">Número de semanas</label>
    <input type="text" name="num_semanas" value="<?= $curso->num_semanas ?>" />
</div>
<div class="field">
  <label for="num_semanas_teoria">Número de semanas de teoría:</label>
  <input type="text" name="num_semanas_teoria" value="<?= $curso->num_semanas_teoria ?>" />
</div>
<div class="field">
    <label for="horas_por_credito">Horas por crédito:</label>
    <input type="text" name="horas_por_credito" value="<?= $curso->horas_por_credito ?>" />
</div>
<div class="field">
    <label for="slot_mínimo">Duración mínima de una clase:</label>
    <input type="text" name="slot_minimo" value="<?= $curso->slot_minimo ?>" />
</div>
<div class="field">
    <label for="hora_inicial">Hora inicial de clases:</label>
    <input type="text" name="hora_inicial" value="<?= $curso->hora_inicial ?>" />
</div>
<div class="field">
    <label for="hora_final">Hora final de clases:</label>
    <input type="text" name="hora_final" value="<?= $curso->hora_final ?>" />
</div>
<div class="actions">
   <input type="submit" id="submit_titulacion" name="button_action" value="Enviar" /> | <?= anchor('titulaciones/index', 'Cancelar', 'id="canceltitulacion"'); ?>
   
</div>


<?php echo form_close(); ?>