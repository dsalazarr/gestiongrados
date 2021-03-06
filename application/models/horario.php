<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('Horarios', 'default');

/**
 * Horario
 * 
 * Esta clase representa un horario completo asociado a un grupo de un curso de
 * una titulación concreta de un año académico concreto.
 * 
 * Este modelo es una composición de líneas de horario, que será donde se guarde la información
 * del horario de una asignatura concreta.
 * 
 * @author Daniel Ignacio Salazar Recio <danielsalazarrecio@gmail.com>
 *
 */
class Horario extends Doctrine_Record{
    
    public function setTableDefinition(){
        $this->setTableName('horarios');
        $this->hasColumn('id', 'integer', 4, array('type' => 'integer', 'length' => 4, 'fixed' => false, 'unsigned' => false, 'primary' => true, 'autoincrement' => true, ));
        $this->hasColumn('id_curso', 'integer', 4, array('type' => 'integer', 'length' => 4, 'fixed' => false, 'unsigned' => false));
        $this->hasColumn('id_titulacion', 'integer', 4, array('type' => 'integer', 'length' => 4, 'fixed' => false, 'unsigned' => false));
        $this->hasColumn('num_curso_titulacion', 'integer', 4, array('type' => 'integer', 'length' => 4, 'fixed' => false, 'unsigned' => false));
        $this->hasColumn('semestre', 'enum', null, array( 'values' => array('primero', 'segundo'), 'unsigned' => false));
        $this->hasColumn('num_grupo_titulacion', 'integer', 4, array('type' => 'integer', 'length' => 4, 'fixed' => false, 'unsigned' => false));
        $this->hasColumn('num_semana', 'integer', 4, array('type' => 'integer'));
   }
    
    public function setUp(){
        parent::setUp();
        $this->hasMany('LineaHorario as lineashorario', array('local' => 'id', 'foreign' => 'id_horario'));
        $this->hasOne('Curso as curso', array('local' => 'id_curso', 'foreign' => 'id'));
        $this->hasOne('Titulacion as titulacion', array('local' => 'id_titulacion', 'foreign' => 'id'));
        $this->hasOne('Horario as horariotipo', array('local' => 'id_teoria', 'foreign' => 'id_tipo', 'refClass' => 'horarioReference'));
        $this->hasMany('Horario as horarioteoria', array('local' => 'id_tipo', 'foreign' => 'id_teoria', 'refClass' => 'horarioReference'));
    }
}
