package org.raiabhij.dto;

import lombok.Data;

/**
 * Created by raiabhij on 8/19/2017.
 */
@Data
public class ItemQuantity {
    private String itemCode;
    private double quantity;

    public ItemQuantity(String itemCode, double quantity) {
        this.itemCode = itemCode;
        this.quantity = quantity;
    }
}
