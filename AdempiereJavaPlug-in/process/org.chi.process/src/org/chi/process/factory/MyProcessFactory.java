package org.chi.process.factory;

import org.adempiere.base.IProcessFactory;
import org.chi.process.MyProcess;
import org.compiere.process.ProcessCall;

public class MyProcessFactory implements IProcessFactory{

	@Override
	public ProcessCall newProcessInstance(String className) {
		// TODO Auto-generated method stub
		
		if(className.equals("org.chi.process.MyProcess"))
		return new MyProcess();
		
		return null;
	}

}
