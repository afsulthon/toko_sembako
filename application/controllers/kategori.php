<?php

class Kategori extends CI_Controller
{
  public function makanan()
  {
    $data['makanan'] = $this->model_kategori->data_makanan()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("makanan", $data);
    $this->load->view("templates/footer");
  }

  public function minuman()
  {
    $data['minuman'] = $this->model_kategori->data_minuman()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("minuman", $data);
    $this->load->view("templates/footer");
  }

  public function bahan_makanan()
  {
    $data['bahan_makanan'] = $this->model_kategori->data_bahan_makanan()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("bahan_makanan", $data);
    $this->load->view("templates/footer");
  }

  public function pembersih()
  {
    $data['pembersih'] = $this->model_kategori->data_pembersih()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("pembersih", $data);
    $this->load->view("templates/footer");
  }

  public function lain_lain()
  {
    $data['lain_lain'] = $this->model_kategori->data_lain_lain()->result();
    $this->load->view("templates/header");
    $this->load->view("templates/sidebar");
    $this->load->view("lain_lain", $data);
    $this->load->view("templates/footer");
  }
}
