package dao;

import entities.Watch;

import java.nio.file.WatchKey;
import java.util.ArrayList;
import java.util.List;

public class FakeData {
    private static List<Watch> watchList;

    static {
//        watchList = new ArrayList<>();
//        watchList.add(new Watch(1,1,"Apple Watch Series 6","3000000",
//                "https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png",
//                "perfectly products"));
//        watchList.add(new Watch(2,2,"Apple Watch Series 5","3000000",
//                "https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png",
//                "perfectly products"));
//        watchList.add(new Watch(3,3,"Apple Watch Series 6","3000000",
//                "https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png",
//                "perfectly products"));
//        watchList.add(new Watch(1,1,"Huawei Series 6","3000000",
//                "https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png",
//                "perfectly products"));
//        watchList.add(new Watch(2,2,"Apple Watch Series 5","3000000",
//                "https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png",
//                "perfectly products"));
//        watchList.add(new Watch(3,3,"Rolex Series 6","3000000",
//                "https://bossluxury.vn/uploads/2-anhbaivietchitietweb/anh-dong-ho/hublot/hublot2/thumbs/380x0/spirit-of-big-bang-titanium-641-nx-0173-lr-42mm.png",
//                "perfectly products"));
    }
    public List<Watch> getAllWatchs(){
        return watchList;
    }
    public List<Watch> findByName(String name_product) {
        List<Watch> p = new ArrayList<>();
        for (Watch product: watchList){
            if (product.getName().contains(name_product))
                p.add(product);
        }
        return p;
    }
}
