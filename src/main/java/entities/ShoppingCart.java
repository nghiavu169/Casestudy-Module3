package entities;

import dao.WatchDAO;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    private WatchDAO watchDAO = new WatchDAO();
    List<ItemsLine> list = new ArrayList<>();

    public ShoppingCart(List<ItemsLine> list) {
        this.list = list;
    }

    public ShoppingCart() {

    }

    public List<ItemsLine> getList() {
        return list;
    }

    public void setList(List<ItemsLine> list) {
        this.list = list;
    }

    public ItemsLine getItemsById(int id){
        for (ItemsLine itemsLine : list) {
            if (itemsLine.getWatch().id == id)
                return itemsLine;
        }
        ItemsLine itemsLine = new ItemsLine();
        itemsLine.setQuantity(0);
        itemsLine.setWatch(this.watchDAO.findWatchByID(id));
        itemsLine.setPrice(this.watchDAO.findWatchByID(id).getPrice());
        list.add(itemsLine);
        return itemsLine;
    }
    public double getTotalPrice(){
        double sumPrice = 0;
        for (ItemsLine itemsLine : list)
            sumPrice += itemsLine.cost();
        return sumPrice;
    }
    public int getNumbersOfItemsInCart(){
        int total = 0;
        for (ItemsLine itemsLine : list){
            total += itemsLine.getQuantity();
        }
        return total;
    }
}
