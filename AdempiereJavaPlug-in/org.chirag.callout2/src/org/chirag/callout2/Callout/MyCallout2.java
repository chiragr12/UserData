package org.chirag.callout2.Callout;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

public class MyCallout2 extends CalloutEngine{
	
	CLogger log = CLogger.getCLogger(MyCallout2.class);
	
	public String getNextItemNbr (Properties ctx, int WindowNo,
			GridTab mTab, GridField mField, Object value)
	{
		Integer momId = (Integer)mTab.getValue("c_mom_ID");
		String sql = "SELECT MAX(item_nbr) "
		+ "FROM C_Mom_DiscussionLine "
		+ "WHERE C_Mom_ID=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		org.chirag.callout2.Callout.MyCallout2.getNextItemNbr
		try {
			
			pstmt = DB.prepareStatement(sql, null);
			pstmt.setInt(1, momId);
			rs = pstmt.executeQuery();
			Integer maxItemNbr = 0;
			if (rs.next())
			{
			maxItemNbr = rs.getInt(1);
			Env.setContext(ctx, WindowNo, "item_nbr", maxItemNbr+1);
			mTab.setValue("item_nbr", maxItemNbr+1);
			}
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
			
		}catch(SQLException e) {
			log.log(Level.SEVERE,sql,e);
			return e.getLocalizedMessage();
		}finally {
			DB.close(rs,pstmt);
			rs = null;
			pstmt = null;
		}
		
		return "";
				
	}	
}
	
//	CLogger log = CLogger.getCLogger(MyCallout2.class);

//	@Override
//	public String start(Properties ctx, String method, int WindowNo, GridTab mTab, GridField mField, Object value,
//			Object oldValue) {
//		// TODO Auto-generated method stub
//		
//		
//		Integer momId = (Integer)mTab.getValue("c_mom_ID");
//		String sql = "SELECT MAX(item_nbr) "
//		+ "FROM C_Mom_DiscussionLine "
//		+ "WHERE C_Mom_ID=?";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
////		org.chirag.callout2.Callout.MyCallout2.start
//		try {
//			
//			pstmt = DB.prepareStatement(sql, null);
//			pstmt.setInt(1, momId);
//			rs = pstmt.executeQuery();
//			Integer maxItemNbr = 0;
//			if (rs.next())
//			{
//			maxItemNbr = rs.getInt(1);
//			Env.setContext(ctx, WindowNo, "item_nbr", maxItemNbr+1);
//			mTab.setValue("item_nbr", maxItemNbr+1);
//			}
//			DB.close(rs, pstmt);
//			rs = null;
//			pstmt = null;
//			
//		}catch(SQLException e) {
//			log.log(Level.SEVERE,sql,e);
//			return e.getLocalizedMessage();
//		}finally {
//			DB.close(rs,pstmt);
//			rs = null;
//			pstmt = null;
//		}
//		
//		return "";
		
//	}

	
//}

//CLogger log = CLogger.getCLogger(MyCallout2.class);
//
//	@Override
//	public String start(Properties ctx, int WindowNo, GridTab mTab, GridField mField,
//			Object value, Object oldValue) {
//		// TODO Auto-generated method stub
//		
//		Integer momId = (Integer)mTab.getValue("c_mom_ID");
//		String sql = "SELECT MAX(item_nbr) "
//		+ "FROM C_Mom_DiscussionLine "
//		+ "WHERE C_Mom_ID=?";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
////		org.chirag.callout2.Callout.MyCallout2.start
//		try {
//			
//			pstmt = DB.prepareStatement(sql, null);
//			pstmt.setInt(1, momId);
//			rs = pstmt.executeQuery();
//			Integer maxItemNbr = 0;
//			if (rs.next())
//			{
//			maxItemNbr = rs.getInt(1);
//			Env.setContext(ctx, WindowNo, "item_nbr", maxItemNbr+1);
//			mTab.setValue("item_nbr", maxItemNbr+1);
//			}
//			DB.close(rs, pstmt);
//			rs = null;
//			pstmt = null;
//			
//		}catch(SQLException e) {
//			log.log(Level.SEVERE,sql,e);
//			return e.getLocalizedMessage();
//		}finally {
//			DB.close(rs,pstmt);
//			rs = null;
//			pstmt = null;
//		}
//		
//		return "";
//	}
