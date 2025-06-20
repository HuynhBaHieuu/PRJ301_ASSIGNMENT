/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import model.Order;

/**
 *
 * @author Admin
 */
public interface IOrderService {

    Order getOrderById(int id);

    void addOrder(Order orderObj) throws SQLException;

    List<Order> getAllOrders();

    boolean updateStatusOrder(int id) throws SQLException ;

    boolean modifyOrder(Order orderObj) throws SQLException ;
    
    void addOrderDetail(int orderId, int productId, int quantity, Double price);

}
