<?php

class Model_kategori extends CI_Model
{
  public function data_kategori_1()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "kategori 1"));
  }

  public function data_kategori_2()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "kategori 2"));
  }

  public function data_kategori_3()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "kategori 3"));
  }

  public function data_kategori_4()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "kategori 4"));
  }

  public function data_kategori_5()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "kategori 5"));
  }
}
