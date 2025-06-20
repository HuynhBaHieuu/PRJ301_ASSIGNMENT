package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items = new HashMap<>();

    public void add(Product product, int quantity) {
        int productId = product.getId();
        if (items.containsKey(productId)) {
            CartItem existing = items.get(productId);
            existing.setQuantity(existing.getQuantity() + quantity);
        } else {
            items.put(productId, new CartItem(product, quantity));
        }
    }

    public void update(int productId, int quantity) {
        if (items.containsKey(productId)) {
            items.get(productId).setQuantity(quantity);
        }
    }

    public void remove(int productId) {
        items.remove(productId);
    }

    public double getTotalCost() {
        return items.values().stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum();
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    public void clear() {
        items.clear();
    }
}
