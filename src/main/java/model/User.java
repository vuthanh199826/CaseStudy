package model;

public class User {
    private String username;
    private String password;
    private String name;
    private String address;
    private int phone;
    private String role;

    public User(String username, String password, String name, String address, int phone, String role) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.role = role;
    }

    public User(String username, String password, String name, String address, int phone) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public User(String username, String password, int phone) {
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
