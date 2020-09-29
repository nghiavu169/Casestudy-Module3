package entities;

import dao.WatchDAO;

import java.util.List;

public class ShoppingCart {
    List<ItemsLine> list;
    ItemsLine getItemsById(int id){
        for (ItemsLine itemsLine : list) {
            if (itemsLine.id == id) return itemsLine;
        }
        Watch watch = WatchDAO.findWatchByID(id);
        ItemsLine itemsLine = new ItemsLine(watch, watch.price);
        list.add(itemsLine);
        return itemsLine;
    }
    double getTotalPrice(){
        double sumPrice = 0;
        for (ItemsLine itemsLine : list) sumPrice += Double.parseDouble(itemsLine.price);
        return sumPrice;
    }
}
