package org.chi.process;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.logging.Level;

import org.adempiere.util.Callback;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.CLogger;

public class MyProcess extends SvrProcess{
	
	CLogger log = CLogger.getCLogger(MyProcess.class);
    private String aString;
    private boolean acheckbox;
    private Timestamp adatetime;

	@Override
	protected void prepare() {
		// TODO Auto-generated method stub
		
		log.warning("-----------------------------Prepare");
		
		ProcessInfoParameter[] paras = getParameter();
		
		for(ProcessInfoParameter para : paras) {
			String paraName = para.getParameterName();
			
			if(paraName.equalsIgnoreCase("astring")) {
				aString = para.getParameterAsString();
				
			}else if(paraName.equalsIgnoreCase("acheckbox")) {
				acheckbox = para.getParameterAsBoolean();
				
			}else if(paraName.equalsIgnoreCase("adatetime")) {
				adatetime = para.getParameterAsTimestamp();
				
			}else
				log.log(Level.SEVERE,"unknown parametar: " + paraName);
		}
		
	}

	@Override
	protected String doIt() throws Exception {
		// TODO Auto-generated method stub
		
		log.warning("------------------------------------------------------doIt ");
		
		addLog(aString);
		addLog(10000000, adatetime,BigDecimal.ONE, "our database is : "+ adatetime.toString());
		addLog(10000001, adatetime, BigDecimal.ONE, "our database is : "+ acheckbox,100, 100);
		
		final StringBuilder yesNo = new StringBuilder();
		processUI.ask("Yes or No?" , new Callback<Boolean>() {
			
			@Override
			public void onCallback(Boolean result) {
				// TODO Auto-generated method stub
				yesNo.append(result);
				System.out.println("yesNo value is : "+result);
				System.out.println("yesNo.length() : " + yesNo.length());

//				while(yesNo.length() == 0)
//					;

				
			}
		});
		System.out.println("valus is : "+yesNo.toString());
		
		while(yesNo.length() == 0)
			addLog(yesNo.toString());
			;
		
		final StringBuilder string = new StringBuilder();
		final StringBuilder stringProvider = new StringBuilder();
		processUI.askForInput("please enter a string ", new Callback<String>() {

			@Override
			public void onCallback(String result) {
				// TODO Auto-generated method stub
				stringProvider.append(true);
				string.append(result);
				System.out.println(string.toString());
				addLog(string.toString());

			}			
		});
	
//		addLog(yesNo.toString());

//		while(string.length() == 0)
//			addLog(string.toString());
//			;

		return null;
	}

}
