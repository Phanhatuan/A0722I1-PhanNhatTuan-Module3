package com.example.baitap.service;

import com.example.baitap.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService{
    private static Map<Integer, Product> products;

    static{
        products = new HashMap<>();
        products.put(1, new Product(1,"Chicken","1000","Delicious", "VN"));
        products.put(2, new Product(2,"Beef","1000","Delicious", "USA"));
        products.put(3, new Product(3,"Pork","1000","Delicious", "UK"));
        products.put(4, new Product(4,"Chicken","1000","Delicious", "KOR"));
        products.put(5, new Product(5,"Chicken","1000","Delicious", "CAM"));

    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = findAll();
        List<Product> results = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().equals(name))
                results.add(product);
        }
        return results;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

}
