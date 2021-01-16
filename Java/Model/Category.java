package Model;

public class Category {
    String idCategory;
    String nameCategory;
    int quantity;

    public Category() {
    }

    public Category(String idCategory, String nameCategory, int quantity) {
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
        this.quantity = quantity;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
