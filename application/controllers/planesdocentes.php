<?php

class PlanesDocentes extends CI_Controller{
  function __construct(){
    parent::__construct();
    $this->globales_table = Doctrine::getTable('PlanDocente');
    $this->asignaturas_table = Doctrine::getTable('Asignatura');
    $this->cursos_table = Doctrine::getTable('Curso');
    $this->layout = '';
    $this->alerts = '';
    $this->notices = '';
  }

  public function edit($id){
    $global = $this->globales_table->find($id);
    $action = '/planesdocentes/update/' . $id;
    $data['data'] = array('result' => $global, 'action' => $action);
    $data['nombre_asignatura'] = $this->asignaturas_table->find($global->asignatura_id)->nombre;
    $data['page_title'] = 'Editando carga global';
    $this->load->view('PlanDocente/edit', $data);
  }

   public function update($id){
    $global = $this->globales_table->find($id);
    $global->fromArray($this->input->post());
    if(!$global->isValid()){
        $this->alerts = $global->getErrorStackAsString();
        $this->edit($id);
    }else{
        $global->save();
        $this->notices = 'Carga actualizada correctamente';
        $this->session->set_flashdata('notices', $this->notices);
        redirect('titulaciones/show/' . $global->Asignatura->titulacion_id);
    }
  }

}

/* Fin del archivo planesdocentes.php */