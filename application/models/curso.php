<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('Cursos', 'default');

/**
 * Titulacion
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property string $codigo
 * @property string $nombre
 * @property integer $creditos
 *
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     Daniel Ignacio Salazar Recio <danielsalazarrecio@gmail.com>
 */
class Curso extends Doctrine_Record
{
  public function setTableDefinition()
  {
    $this->setTableName('cursos');
    $this->hasColumn('id', 'integer', 4, array(
                           'type' => 'integer',
                           'length' => 4,
                           'fixed' => false,
                           'unsigned' => false,
                           'primary' => true,
                           'autoincrement' => true,
                           ));
    $this->hasColumn('anyo_inicio', 'string', 4, array(
                          'type' => 'string',
                          'length' => 4,
                          'fixed' => false,
                          'unsigned' => false,
                          'primary' => false,
                          'notnull' => true,
                          'autoincrement' => false,
                          ));
    $this->hasColumn('num_semanas', 'integer', 4, array(
                             'type' => 'integer',
                             'length' => 4,
                             'fixed' => false,
                             'unsigned' => false,
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             ));
    $this->hasColumn('num_semanas_teoria', 'integer', 4, array(
                             'type' => 'integer',
                             'length' => 4,
                             'fixed' => false,
                             'unsigned' => false,
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             ));
    $this->hasColumn('num_semanas', 'integer', 4, array(
                             'type' => 'integer',
                             'length' => 4,
                             'fixed' => false,
                             'unsigned' => false,
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             ));
    $this->hasColumn('horas_por_credito', 'integer', 4, array(
                             'type' => 'integer',
                             'length' => 4,
                             'fixed' => false,
                             'unsigned' => false,
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             ));
    //Esto habría que cambiarlo, no me gusta en integer                             
    $this->hasColumn('slot_minimo', 'time', null, array(
                             'type' => 'time',
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             'default' => '01:00',
                             ));
    $this->hasColumn('hora_inicial', 'time', null, array(
                             'type' => 'time',
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             'default' => '9:00',
                             ));
    $this->hasColumn('hora_final', 'time', null, array(
                             'type' => 'time',
                             'primary' => false,
                             'notnull' => true,
                             'autoincrement' => false,
                             'default' => '22:00',
                             ));
                                 
    
  }

  
  public function setUp()
  {
    parent::setUp();
    $this->hasMany('CargaGlobal as cargasglobales', array('local' => 'id', 'foreign' => 'curso_id', 'onDelete' => 'CASCADE'));
  }
}