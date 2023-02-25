package com.example.test.model;

import java.sql.Date;

public class mat_bang implements Comparable<mat_bang>{
    private String ma_mat_bang;
    private String trang_thai;
    private Integer dien_tich;
    private String tang;
    private String loai_bang_mat;
    private String mo_ta;
    private Integer gia;
    private Date ngay_bat_dau;
    private Date ngay_ket_thuc;

    public mat_bang(String ma_mat_bang, String trang_thai, Integer dien_tich, String tang, String loai_bang_mat, String mo_ta, Integer gia, Date ngay_bat_dau, Date ngay_ket_thuc) {
        this.ma_mat_bang = ma_mat_bang;
        this.trang_thai = trang_thai;
        this.dien_tich = dien_tich;
        this.tang = tang;
        this.loai_bang_mat = loai_bang_mat;
        this.mo_ta = mo_ta;
        this.gia = gia;
        this.ngay_bat_dau = ngay_bat_dau;
        this.ngay_ket_thuc = ngay_ket_thuc;
    }

    public String getMa_mat_bang() {
        return ma_mat_bang;
    }

    public void setMa_mat_bang(String ma_mat_bang) {
        this.ma_mat_bang = ma_mat_bang;
    }

    public String getTrang_thai() {
        return trang_thai;
    }

    public void setTrang_thai(String trang_thai) {
        this.trang_thai = trang_thai;
    }

    public Integer getDien_tich() {
        return dien_tich;
    }

    public void setDien_tich(Integer dien_tich) {
        this.dien_tich = dien_tich;
    }

    public String getTang() {
        return tang;
    }

    public void setTang(String tang) {
        this.tang = tang;
    }

    public String getLoai_bang_mat() {
        return loai_bang_mat;
    }

    public void setLoai_bang_mat(String loai_bang_mat) {
        this.loai_bang_mat = loai_bang_mat;
    }

    public String getMo_ta() {
        return mo_ta;
    }

    public void setMo_ta(String mo_ta) {
        this.mo_ta = mo_ta;
    }

    public Integer getGia() {
        return gia;
    }

    public void setGia(Integer gia) {
        this.gia = gia;
    }

    public Date getNgay_bat_dau() {
        return ngay_bat_dau;
    }

    public void setNgay_bat_dau(Date ngay_bat_dau) {
        this.ngay_bat_dau = ngay_bat_dau;
    }

    public Date getNgay_ket_thuc() {
        return ngay_ket_thuc;
    }

    public void setNgay_ket_thuc(Date ngay_ket_thuc) {
        this.ngay_ket_thuc = ngay_ket_thuc;
    }

    @Override
    public String toString() {
        return "mat_bang{" +
                "ma_mat_bang='" + ma_mat_bang + '\'' +
                ", trang_thai='" + trang_thai + '\'' +
                ", dien_tich=" + dien_tich +
                ", tang='" + tang + '\'' +
                ", loai_bang_mat='" + loai_bang_mat + '\'' +
                ", mo_ta='" + mo_ta + '\'' +
                ", gia=" + gia +
                ", ngay_bat_dau=" + ngay_bat_dau +
                ", ngay_ket_thuc=" + ngay_ket_thuc +
                '}';
    }

    @Override
    public int compareTo(mat_bang mat_bang) {
        return this.getDien_tich().compareTo(mat_bang.getDien_tich());
    }
}
