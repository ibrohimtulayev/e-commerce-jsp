package uz.pdp.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.LinkedHashMap;
import java.util.Map;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basket {
    Map<Product,Integer>basketProduct = new LinkedHashMap<>();

}
