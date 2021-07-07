package model;

public class Order {
    private int id;
    private int idPost;
    private int ngaybatdau;
    private int ngayketthuc;
    private String username;
    private String status;

    public Order(int id, int idPost, int ngaybatdau, int ngayketthuc, String username, String status) {
        this.id = id;
        this.idPost = idPost;
        this.ngaybatdau = ngaybatdau;
        this.ngayketthuc = ngayketthuc;
        this.username = username;
        this.status  = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public int getNgaybatdau() {
        return ngaybatdau;
    }

    public void setNgaybatdau(int ngaybatdau) {
        this.ngaybatdau = ngaybatdau;
    }

    public int getNgayketthuc() {
        return ngayketthuc;
    }

    public void setNgayketthuc(int ngayketthuc) {
        this.ngayketthuc = ngayketthuc;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
