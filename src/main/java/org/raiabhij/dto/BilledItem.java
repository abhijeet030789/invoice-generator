package org.raiabhij.dto;

import lombok.Data;

/**
 * Created by raiabhij on 8/11/2017.
 */
@Data
public class BilledItem {
    private Integer slNo;
    private String name;
    private String hsnCode;
    private String unit;
    private Double quantity;
    private Double rate;
    private Double total;
    private Double discount;
    private Double taxableAmount;
    private Gst cgst = new Gst();
    private Gst sgst = new Gst();
    private Gst igst = new Gst();
    private Double amount;


    @Data
    public static class Gst{
        private Double rate = 0.0;
        private Double amount = 0.0;

        public Gst(Double rate, Double taxableAmount) {
            this.rate = rate;
            this.amount = (rate * taxableAmount)/100;
        }

        public Gst() {
        }
    }


}
