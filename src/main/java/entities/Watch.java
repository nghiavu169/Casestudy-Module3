package entities;

public class Watch {
    int id, brand_id;
    String name, img, description;
    double price;

    public Watch(int id, int brand_id, String name, double price, String img, String description) {
        this.id = id;
        this.brand_id = brand_id;
        this.name = name;
        this.price = price;
        this.img = img;
        this.description = description;
    }

    public Watch() {

    }

    public Watch(String name, int brandID, double price, String image, String description) {
        this.brand_id = brandID;
        this.name = name;
        this.price = price;
        this.img = image;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
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
}
