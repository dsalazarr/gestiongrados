<?php
//Connection Component Binding
Doctrine_Manager::getInstance() -> bindComponent('Eventos', 'default');

/**
 * Evento
 *
 *
 * @property integer $id
 *
 * @author     Daniel Ignacio Salazar Recio <danielsalazarrecio@gmail.com>
 */
class Evento extends Doctrine_Record {
        
    public $tipo_evento_values = array('examen', 'festivo', 'vacaciones', 'especial');
        
    public function setTableDefinition() {
        $this -> setTableName('eventos');
        $this -> hasColumn('id', 'integer', 4, array('type' => 'integer', 'length' => 4, 'fixed' => false, 'unsigned' => false, 'primary' => true, 'autoincrement' => true, ));
        $this -> hasColumn('tipo_evento', 'enum', null, array( 'values' => array('examen', 'festivo', 'vacaciones', 'especial')));
        $this -> hasColumn('rango', 'bool');
        $this -> hasColumn('fecha_inicial', 'date');
        $this -> hasColumn('fecha_final', 'date');
    }

    public function setUp() {
        $this -> hasOne('Curso as curso', array('local' => 'curso_id', 'foreign' => 'id'));
        parent::setUp();
    }

}

/* End of file evento.php */
/* Location: ./application/models/evento.php */