package org.chirag.testing.model;

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.util.CLogger;

public class MyModel extends X_c_chirag{
	
	CLogger log = CLogger.getCLogger(MyModel.class);
	
	

	private static final long serialVersionUID = 9061180343925426096L;

	public MyModel(Properties ctx, ResultSet rs, String trxName) {
		super(ctx, rs, trxName);
		// TODO Auto-generated constructor stub
	}
	
	public MyModel(Properties ctx, int c_chirag_ID, String trxName) {
		super(ctx, c_chirag_ID, trxName);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected boolean afterSave(boolean newRecord, boolean success) {
		// TODO Auto-generated method stub
		log.warning(".................................");
		log.warning("After save possible");
		log.warning("..................................");
		return super.afterSave(newRecord, success);
	}
	
	@Override
	protected boolean beforeSave(boolean newRecord) {
		// TODO Auto-generated method stub
		
		log.warning(".................................");
		log.warning("Before save not possible");
		log.warning("..................................");
		return super.beforeSave(newRecord);
	}
	

}
