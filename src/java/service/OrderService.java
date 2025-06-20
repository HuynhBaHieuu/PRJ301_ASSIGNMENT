/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import java.util.List;
import model.Order;
import orderDAO.IOrderDAO;
import orderDAO.OrderDAO;

/**
 *
 * @author Admin
 */
public class OrderService implements IOrderService {

    private IOrderDAO orderDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
    }

    @Override
    public Order getOrderById(int id) {
        return orderDAO.getOrderById(id);
    }

    @Override
    public void addOrder(Order orderObj) throws SQLException {
        int orderId = orderDAO.createOrder(orderObj); // ✅ LẤY orderId từ DB
        orderObj.setId(orderId); // ✅ GÁN lại cho đối tượng Order
    }

    @Override
    public List<Order> getAllOrders() {
        return orderDAO.selectAllOrders();
    }

    @Override
    public boolean updateStatusOrder(int id) throws SQLException {
        return orderDAO.deleteOrder(id);
    }

    @Override
    public boolean modifyOrder(Order orderObj) throws SQLException {
        return orderDAO.updateOrder(orderObj);
    }

    @Override
    public void addOrderDetail(int orderId, int productId, int quantity, Double price) {
        orderDAO.addOrderDetail(orderId, productId, quantity, price);
    }

}
