package entities;

public class ItemsLine {
    int id;
    Watch watch;
    int quantity;
    String price;

    public ItemsLine(Watch watch, String price) {
        this.watch = watch;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Watch getWatch() {
        return watch;
    }

    public void setWatch(Watch watch) {
        this.watch = watch;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    double cost(){
        return Double.parseDouble(price) * quantity;
    }
}
