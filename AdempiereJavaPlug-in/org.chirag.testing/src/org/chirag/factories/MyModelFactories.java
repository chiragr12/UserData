package org.chirag.factories;

import java.sql.ResultSet;

import org.adempiere.base.IModelFactory;
import org.chirag.testing.model.MyModel;
import org.compiere.model.PO;
import org.compiere.util.Env;

public class MyModelFactories implements IModelFactory{

	@Override
	public Class<?> getClass(String tableName) {
		// TODO Auto-generated method stub
		if(tableName.equalsIgnoreCase(MyModel.Table_Name))
			return MyModel.class;
		return null;
	}

	@Override
	public PO getPO(String tableName, int Record_ID, String trxName) {
		// TODO Auto-generated method stub
		
		if(tableName.equalsIgnoreCase(MyModel.Table_Name))
			return new MyModel(Env.getCtx(), Record_ID, trxName);
		
		return null;
	}

	@Override
	public PO getPO(String tableName, ResultSet rs, String trxName) {
		// TODO Auto-generated method stub
		if(tableName.equalsIgnoreCase(MyModel.Table_Name))
			return new MyModel(Env.getCtx(), rs, trxName);
		
		return null;
	}

}
