package model;

import java.sql.Date;

public class Product {

    private int id;
    private String name;
    private double price;
    private String description;
    private int stock;
    private Date importDate;
    private boolean status;
    private int categoryId;
    private String imageUrl;

    public Product() {
    }

    public Product(int id, String name, double price, String description, int stock, boolean status, int categoryId, String imageUrl) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.status = status;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
    }

    public Product(int id, String name, double price, String description, int stock, Date importDate, boolean status, int categoryId, String imageUrl) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.importDate = importDate;
        this.status = status;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
    }
    public Product(int id, String name, double price, String description, int stock) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public int getStock() {
        return stock;
    }

    public Date getImportDate() {
        return importDate;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", stock=" + stock + ", importDate=" + importDate + ", status=" + status + ", categoryId=" + categoryId + ", imageURL=" + imageUrl + '}';
    }

}
