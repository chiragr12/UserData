User Data:-

Report:-

1 Stagewise productvity:-

stage (product), Quantity, locator (tc_out)

2 Technician wise productvity:-

whole tc_order table using sales_rep wise 
sales_rep,tc_order_id,out_Qty,out_product,out_locator


========================================================================================================
package org.adempiere.webui.dashboard;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.adempiere.webui.component.Label;
import org.adempiere.webui.theme.ITheme;
import org.adempiere.webui.util.ServerPushTemplate;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.EventQueue;
import org.zkoss.zk.ui.event.EventQueues;
import org.zkoss.zul.Div;

public class DPCultureDistribution extends DashboardPanel implements EventListener<Event> {

    private static final long serialVersionUID = 1L;

    private List<String> categories = new ArrayList<>();
    private Map<String, Integer> categoryQuantities = new HashMap<>();

    public DPCultureDistribution() {
        super();
        this.setSclass("activities-box");
        initOptions();
        this.appendChild(createActivitiesPanel());
    }

    private Div createActivitiesPanel() {
        Div div = new Div();
        div.setSclass(ITheme.WARE_HOUSE_DATA_WIDGET);

        // Create a parent div for the labels
        Div labelsDiv = new Div();
        labelsDiv.setSclass(ITheme.DASHBOARD_WIDGET_Text_COUNT_CONT);
        div.appendChild(labelsDiv);

        // Create a parent div for the quantities
        Div quantitiesDiv = new Div();
        quantitiesDiv.setSclass(ITheme.DASHBOARD_WIDGET_Text_COUNT_CONT);
        div.appendChild(quantitiesDiv);

        // Add labels and quantities dynamically
        for (String category : categories) {
            Label categoryLabel = new Label();
            categoryLabel.setSclass(ITheme.DASHBOARD_WIDGET_LABELS);
            categoryLabel.setValue(category);
            labelsDiv.appendChild(categoryLabel);

            Label countLabel = new Label();
            countLabel.setSclass(ITheme.DASHBOARD_WIDGET_COUNT);
            countLabel.setValue(" " + categoryQuantities.getOrDefault(category, 0));
            quantitiesDiv.appendChild(countLabel);
        }

        return div;
    }

    private void initOptions() {
        Properties ctx = Env.getCtx();
        int clientId = Env.getAD_Client_ID(ctx);
        PreparedStatement pstmt = null;
        ResultSet RS = null;
        try {
            String sql = "SELECT Category, SUM(TotalQuantity) AS TotalQuantity FROM (\n"
                    + "    SELECT\n"
                    + "        CASE\n"
                    + "            WHEN pr.name LIKE 'BI%' OR pr.name LIKE 'N%' THEN 'Initiation'\n"
                    + "            WHEN pr.name LIKE 'BM%' OR pr.name LIKE 'M%' THEN 'Multiplication'\n"
                    + "            WHEN pr.name LIKE 'BE%' OR pr.name LIKE 'E%' THEN 'Elongation'\n"
                    + "            WHEN pr.name LIKE 'BR%' OR pr.name LIKE 'R%' THEN 'Rooting'\n"
                    + "            WHEN pr.name LIKE 'BH%' OR pr.name LIKE 'H%' THEN 'Harding'\n"
                    + "            ELSE 'Other'\n"
                    + "        END AS Category,\n"
                    + "        o.quantity AS TotalQuantity\n"
                    + "    FROM adempiere.tc_out o\n"
                    + "    JOIN adempiere.m_product pr ON pr.m_product_id = o.m_product_id\n"
                    + ") AS Subquery\n"
                    + "WHERE Category <> 'Other' GROUP BY Category ORDER BY Category;";
            pstmt = DB.prepareStatement(sql, null);
            RS = pstmt.executeQuery();
            while (RS.next()) {
                String category = RS.getString("Category");
                int totalQuantity = RS.getInt("TotalQuantity");
                categories.add(category);
                categoryQuantities.put(category, totalQuantity);
            }
            DB.close(RS, pstmt);
            RS = null;
            pstmt = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void refresh(ServerPushTemplate template) {
        initOptions();
        template.executeAsync(this);
    }

    @Override
    public void updateUI() {
        // No need to update UI here, as the UI is dynamically created in createActivitiesPanel()
    }

    @Override
    public void onEvent(Event event) throws Exception {
        // No event handling needed in this context
    }
}
===============================================================================================

