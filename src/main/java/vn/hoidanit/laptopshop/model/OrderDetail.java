package vn.hoidanit.laptopshop.model;

import java.util.List;

import jakarta.annotation.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;
    private long price;

    // orderId
    // Join Order
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    // productId
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product products;

}
