package org.raiabhij.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NonNull;

/**
 * Created by raiabhij on 8/19/2017.
 */
@AllArgsConstructor
public class ItemQuantity {
    @NonNull @Getter private final String itemCode;
    @NonNull @Getter private final Double predefinedRate;
    @NonNull @Getter private final Double actualRate;
    @NonNull @Getter private final  double quantity;
}
