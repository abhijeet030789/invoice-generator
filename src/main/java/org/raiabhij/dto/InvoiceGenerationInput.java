package org.raiabhij.dto;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by raiabhij on 8/19/2017.
 */
@Data
public class InvoiceGenerationInput {
    private String partyGstNo;
    private String firmGstNo;
    private List<String[]> itemList;

    public List<ItemQuantity> getItemQuantities(){
        List<ItemQuantity> list = new ArrayList<>();
        for(String[] s : this.itemList){
            list.add(new ItemQuantity(s[0], Double.valueOf(s[1])));
        }
        return list;
    }
    //{"partyGstNo":"1","itemList":[["A","2"],["A","8"]]}
}
