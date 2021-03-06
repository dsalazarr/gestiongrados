<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('Asignaturas', 'default');
/**
 * Asignaturas
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id_asignatura
 * @property string $codigo
 * @property string $nombre
 * @property integer $creditos
 * @property string $materia
 * @property string $departamento
 * @property integer $horas_presen
 * @property integer $horas_no_presen
 *
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class Asignatura extends Doctrine_Record
{
  public function setTableDefinition()
  {
    $this->setTableName('asignaturas');
    $this->hasColumn('id', 'integer', 4, array(
					       'type' => 'integer',
					       'length' => 4,
					       'fixed' => false,
					       'unsigned' => false,
					       'primary' => true,
					       'autoincrement' => true,
					       ));
    $this->hasColumn('codigo', 'string', 3, array(
						  'type' => 'string',
						  'length' => 3,
						  'fixed' => false,
						  'unsigned' => false,
						  'primary' => false,
						  'notnull' => true,
						  'autoincrement' => false,
						  'notblank' => true,
						  'unique' => true,
						  'regexp' => '/[0-9]{3}/'
						  ));
    $this->hasColumn('nombre', 'string', 200, array(
						    'type' => 'string',
						    'length' => 200,
						    'minlength' => 5,
						    'fixed' => false,
						    'unsigned' => false,
						    'primary' => false,
						    'notnull' => true,
						    'autoincrement' => false,
						    ));
    $this->hasColumn('abreviatura', 'string', 5, array(
						    'type' => 'string',
						    'length' => 5,
						    'minlength' => 1,
						    'fixed' => false,
						    'unsigned' => false,
						    'primary' => false,
						    'notnull' => true,
						    'autoincrement' => false,
						    ));
    $this->hasColumn('creditos', 'integer', 4, array(
						     'type' => 'integer',
						     'length' => 4,
						     'fixed' => false,
						     'unsigned' => false,
						     'primary' => false,
						     'notnull' => true,
						     'autoincrement' => false,
						     'notblank' => true
						     ));
    $this->hasColumn('materia', 'string', 100, array(
						     'type' => 'string',
						     'length' => 100,
						     'fixed' => false,
						     'unsigned' => false,
						     'primary' => false,
						     'notnull' => true,
						     'autoincrement' => false,
						     'notblank' => true
						     ));
    $this->hasColumn('departamento', 'string', 200, array(
							  'type' => 'string',
							  'length' => 200,
							  'fixed' => false,
							  'unsigned' => false,
							  'primary' => false,
							  'notnull' => true,
							  'autoincrement' => false,
							  'notblank' => true
							  ));
  //Añadir validación propia para que el curso esté dentro del número de cursos de la titulación.
    $this->hasColumn('curso', 'integer', 4, array(
                              'type' => 'integer',
                              'length' => 4,
                              'fixed' => false,
                              'unsigned' => true,
                              'primary' => false,
                              'notnull' => true,
                              'autoincrement' => false,
                              ));
                              
    /* Semestre debería ser un enum */                              
    $this->hasColumn('semestre', 'enum', null, array( 'values' => array('primero', 'segundo'),
                                'unsigned' => false
                              ));
    
    $this->hasColumn('titulacion_id', 'integer', 4, array(
							  'type' => 'integer',
							  'length' => 4,
							  'fixed' => false,
							  'unsigned' => false));
  }

  public function setUp()
  {
    parent::setUp();
    $this->hasOne('Titulacion', array('local' => 'titulacion_id', 'foreign' => 'id'));
    $this->hasMany('PlanDocente as PlanesDocentes', array('local' => 'id', 'foreign' => 'id_asignatura'));
    $this->hasMany('LineaHorario as lineashorario', array('local' => 'id', 'foreign' => 'id_asignatura'));
  }
}
