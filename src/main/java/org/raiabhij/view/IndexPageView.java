package org.raiabhij.view;

import io.dropwizard.views.View;
import lombok.Data;
import org.raiabhij.dto.Firm;
import org.raiabhij.dto.Item;
import org.raiabhij.dto.Party;

import java.util.List;

/**
 * Created by raiabhij on 8/11/2017.
 */
@Data
public class IndexPageView extends View {

    private final List<Item> itemList;
    private final List<Party> partyList;
    private final List<Firm> firmList;

    public IndexPageView(List<Item> itemList, List<Party> partyList, List<Firm> firmList) {
        super("/view/IndexPage.ftl");
        this.itemList = itemList;
        this.partyList = partyList;
        this.firmList = firmList;
    }
}
