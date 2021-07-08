package model;

public class Post {
    private int id;
    private String userName;
    private String title;
    private int price;
    private String address;
    private String img;
    private String describe;
    private boolean status;

    public Post(int id, String userName, String title, int price, String address, String img, String describe, boolean status) {
        this.id = id;
        this.userName = userName;
        this.title = title;
        this.price = price;
        this.address = address;
        this.img = img;
        this.describe = describe;
        this.status = status;
    }

    public Post(String userName, String title, int price, String address, String img, String describe, boolean status) {
        this.userName = userName;
        this.title = title;
        this.price = price;
        this.address = address;
        this.img = img;
        this.describe = describe;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", address='" + address + '\'' +
                ", img='" + img + '\'' +
                ", describe='" + describe + '\'' +
                ", status=" + status +
                '}';
    }
}
