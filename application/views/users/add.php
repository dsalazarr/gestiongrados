<?= form_open($action) ?>
<? if(!Current_User::logged_in()): ?>
<div class="field">
    <label for="titulacion">Titulación:</label>
    <?= form_dropdown('id_titulacion', $titulaciones) ?>
</div>
<? endif; ?>
<div class="field">
    <label for="nombre">Nombre:</label>
    <?= form_input('nombre', set_value('nombre', $user->nombre)) ?>
</div>
<div class="field">
    <label for="apellidos">Apellidos:</label>
    <?= form_input('apellidos', set_value('apellidos', $user->apellidos)) ?>
</div>
<div class="field">
    <label for="DNI">DNI:</label>
    <?= form_input('DNI', set_value('DNI', $user->DNI)) ?>
</div>
<div class="field">
    <label for="email">Email (@uca.es):</label>
    <?= form_input('email', set_value('email', $user->email)) ?>
</div>
<? $current_user = Current_User::user() ?>
<? if(Current_User::logged_in(0) and $user->level != 3 and $user->id != 1): ?>
<div class="field">
    <label for="level">Administrador:</label>
    <?= form_radio('level', '0', set_radio('level', '0', $user->level == 0)) ?><br/>
</div>
<div class="field">
    <label for="level">Planificador:</label>
    <?= form_radio('level', '1', set_radio('level', '1', $user->level == 1)) ?><br/>
</div><div class="field">
    <label for="level">Profesor:</label>
    <?= form_radio('level', '2', set_radio('level', '2', $user->level == 2)) ?><br/>
<? endif; ?>

<? if(Current_User::logged_in()): ?>
<div class="field">
    <label for="password">Password</label>
        <?= form_password('password', ''); ?>
    
</div>
<div class="field">
    <label for="password_confirmation">Confirmar password</label>
    <?= form_password('password_confirmation', '') ?>
</div>
<? endif; ?>
<div class="actions">
    <?= form_submit('submit', 'Enviar') ?>
</div>
<?= form_close() ?>
