<?php

class Kategori extends CI_Controller
{
  public function kategori_1()
  {
    $data['kategori_1'] = $this->model_kategori->data_kategori_1()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("kategori_1", $data);
    $this->load->view("templates/footer");
  }

  public function kategori_2()
  {
    $data['kategori_2'] = $this->model_kategori->data_kategori_2()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("kategori_2", $data);
    $this->load->view("templates/footer");
  }

  public function kategori_3()
  {
    $data['kategori_3'] = $this->model_kategori->data_kategori_3()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("kategori_3", $data);
    $this->load->view("templates/footer");
  }

  public function kategori_4()
  {
    $data['kategori_4'] = $this->model_kategori->data_kategori_4()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("kategori_4", $data);
    $this->load->view("templates/footer");
  }

  public function kategori_5()
  {
    $data['kategori_5'] = $this->model_kategori->data_kategori_5()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("kategori_5", $data);
    $this->load->view("templates/footer");
  }
}
