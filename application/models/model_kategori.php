<?php

class Model_kategori extends CI_Model
{
  public function data_makanan()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "Makanan"));
  }

  public function data_minuman()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "Minuman"));
  }

  public function data_bahan_makanan()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "Bahan Makanan"));
  }

  public function data_pembersih()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "Pembersih"));
  }

  public function data_lain_lain()
  {
    return $this->db->get_where("tb_barang", array("kategori" => "Lain-lain"));
  }
}
