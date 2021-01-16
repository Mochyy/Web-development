package Model;

public class Account {
    String tenDangNhap;
    String maTaiKhoan;
    String matkhau;
    String email;
    String trangThai;

    public Account() {
    }

    public Account(String tenDangNhap, String maDangNhap, String matkhau, String email, String trangThai) {
        this.tenDangNhap = tenDangNhap;
        this.maTaiKhoan = maDangNhap;
        this.matkhau = matkhau;
        this.email = email;
        this.trangThai = trangThai;
    }



    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public String getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public String getEmail() {
        return email;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public void setMaTaiKhoan(String maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}
