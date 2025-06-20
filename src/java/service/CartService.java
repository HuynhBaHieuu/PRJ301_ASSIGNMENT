/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import model.Cart;
import model.Product;

/**
 *
 * @author Admin
 */
public class CartService implements ICartService {
    @Override
    public void addToCart(Cart cart, Product product, int quantity) {
        cart.add(product, quantity);
    }

    @Override
    public void updateCartItem(Cart cart, int productId, int quantity) {
        cart.update(productId, quantity);
    }

    @Override
    public void removeCartItem(Cart cart, int productId) {
        cart.remove(productId);
    }
}
    