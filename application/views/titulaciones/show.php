<?php echo doctype(); ?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>INDEX ASIGNATURAS</title>
</head>
<body>
  <h1>Asignaturas de <?php echo $titulacion->nombre; ?></h1>
<table>
  <tr>
    <th>ID</th><th>NOMBRE</th><th>CRÉDITOS</th>
  </tr>
  <?php 
  foreach($asignaturas as $item): ?>
  <tr>
    <td><?= $item->codigo ?></td>
    <td><?= $item->nombre ?></td>
    <td><?= $item->creditos ?></td>
    <td><?= anchor('asignaturas/delete/'.$item->id_asignatura, 'Borrar', array('onClick'=>"return confirm('Estás seguro?')")); ?></td>
    <td><?= anchor('asignaturas/edit/'.$item->id_asignatura, 'Editar', ''); ?></td>
  </tr>
  <?php endforeach; ?>

  
</table>
<?= anchor('asignaturas/add_to/'.$titulacion->id_titulacion, 'Añadir una nueva asignatura')?>
</body>
</html>