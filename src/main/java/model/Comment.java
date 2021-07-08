package model;

public class Comment {
    private int id;
    private int idPost;
    private String username;
    private String detail;

    public Comment(int id, int idPost, String username, String detail) {
        this.id = id;
        this.idPost = idPost;
        this.username = username;
        this.detail = detail;
    }

    public Comment(int idPost, String username, String detail) {
        this.idPost = idPost;
        this.username = username;
        this.detail = detail;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", idPost=" + idPost +
                ", username='" + username + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}
