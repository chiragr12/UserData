package org.adempiere.webui.dashboard;

import org.adempiere.webui.component.Checkbox;
import org.adempiere.webui.component.Textbox;
import org.adempiere.webui.component.Label;
import org.compiere.util.CLogger;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.Div;
import org.zkoss.zul.Vbox;
import org.zkoss.zul.Vlayout;



public class NEWPanel extends DashboardPanel implements EventListener<Event>{
	
	CLogger log = CLogger.getCLogger(NEWPanel.class);
	
	private static final long serialVersionUID = -3186592553690218400L;
	
	private Vlayout layout = new Vlayout();
	private Div contentArea = new Div();
	
	private Checkbox aCheckbox = new Checkbox();
	private Textbox aTextbox = new Textbox();

	public NEWPanel() {
		super();
		
		this.setHeight("200px");
		this.setClass("apanel-Box");
		
		initLayout();
		initComponent();
	}

	private void initComponent() {
		// TODO Auto-generated method stub
		
		aCheckbox.addEventListener(Events.ON_CLICK, this);
		aCheckbox.setTooltiptext("This is a checkbox");
		
		aTextbox.addEventListener(Events.ON_BLUR, this);
		aTextbox.addEventListener(Events.ON_OK, this);
		aTextbox.setHflex("1");
		
		Label aLabel = new Label("This is a Label");
		
		Vbox box = new Vbox();
		box.setHflex("1");
		box.setVflex("1");
		box.setStyle("margin:5px,5px;");
		box.appendChild(aCheckbox);
		box.appendChild(aTextbox);
		box.appendChild(aLabel);
		contentArea.appendChild(box);
		
		System.out.println("start");
		
	}

	private void initLayout() {
		// TODO Auto-generated method stub
		
		layout.setParent(this);
		layout.setClass("apanel-layout");
		layout.setSpacing("0px");
		layout.setStyle("height: 100%, width: 100%");
		
		contentArea.setParent(layout);
		contentArea.setVflex("1");
		contentArea.setHflex("1");
		contentArea.setStyle("margin:5px 5px;overflow: auto;");
		
		System.out.println("middle");
		
	}

	@Override
	public void onEvent(Event event) throws Exception {
		// TODO Auto-generated method stub
		
		Component comp = event.getTarget();
		String eventName = event.getName();
		
		System.out.println("end");
		
		if(eventName.equals(Events.ON_CLICK)) {
			log.warning("----------------------Click");
		}else if(eventName.equals(Events.ON_BLUR)) {
			log.warning("-----------------------Blur");
		}else if(eventName.equals(Events.ON_OK)) {
			log.warning("--------------------OK");
		}
		
	}

}
