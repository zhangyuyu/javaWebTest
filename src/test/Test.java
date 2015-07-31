/**
 * Created by zhangyu on 2015/7/24.
 */
package test;

import dao.AddressDao;
import entity.Address;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        AddressDao addrDao =  new AddressDao();
        Address address = new Address();
        address.setName("zhamyu");
        address.setZip("smart");
        address.setId(1);
        addrDao.update(address);
//        List<Address> list = addrDao.findAll();
//        for (Address a:list){
//            System.out.println(a.getId());
//            System.out.println(a.getName());
//            System.out.println(a.getZip());
//        }
    }
}
