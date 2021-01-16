package beans;

import java.io.Serializable;

public class Product implements Serializable, Comparable<Product>  {
    String id;
    String name;
    String img;
    double price;
    String description;
    String detail;
    int quantity;
    String idCategory;
    String state;


    public Product() {

    }

    public Product(String id, String name, String img, double price, String description, String detail, int quantity, String nameCategory, String state) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.price = price;
        this.description = description;
        this.detail = detail;
        this.quantity = quantity;
        this.idCategory = nameCategory;
        this.state = state;
    }

    public String getId() {
        return id;
    }

    public String setId(String id) {
        return this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public int compareTo(Product o) {
        int i=0;
        if(this.id.equals(o.id))
            i=0;
        else
            i=-1;
        return i;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", detail='" + detail + '\'' +
                ", quantity=" + quantity +
                ", idCategory='" + idCategory + '\'' +
                ", state='" + state + '\'' +
                '}' + "\n";
    }
}
