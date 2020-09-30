package entities;

public class ItemsLine {
    Watch watch;
    int quantity;
    double price;

    public ItemsLine(Watch watch, double price, int quantity) {
        this.watch = watch;
        this.price = price;
        this.quantity = quantity;
    }

    public ItemsLine() {

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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    double cost(){
        return price * quantity;
    }
}
