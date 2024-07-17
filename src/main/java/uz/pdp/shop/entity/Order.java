package uz.pdp.shop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.*;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToMany
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private List<Product> products= new ArrayList<>();

    @Column(columnDefinition = "TIMESTAMP")
    private LocalDateTime time;
    private Integer userId;
    private Integer totalSum;
}
