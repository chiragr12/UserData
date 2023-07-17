/******************************************************************************
 * Product: iDempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2012 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
/** Generated Model - DO NOT CHANGE */
package org.chi.model;

import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.*;

/** Generated Model for ROK_Battle_Plan_Line
 *  @author iDempiere (generated) 
 *  @version Release 10 - $Id$ */
@org.adempiere.base.Model(table="ROK_Battle_Plan_Line")
public class X_ROK_Battle_Plan_Line extends PO implements I_ROK_Battle_Plan_Line, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20230630L;

    /** Standard Constructor */
    public X_ROK_Battle_Plan_Line (Properties ctx, int ROK_Battle_Plan_Line_ID, String trxName)
    {
      super (ctx, ROK_Battle_Plan_Line_ID, trxName);
      /** if (ROK_Battle_Plan_Line_ID == 0)
        {
        } */
    }

    /** Standard Constructor */
    public X_ROK_Battle_Plan_Line (Properties ctx, int ROK_Battle_Plan_Line_ID, String trxName, String ... virtualColumns)
    {
      super (ctx, ROK_Battle_Plan_Line_ID, trxName, virtualColumns);
      /** if (ROK_Battle_Plan_Line_ID == 0)
        {
        } */
    }

    /** Load Constructor */
    public X_ROK_Battle_Plan_Line (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 7 - System - Client - Org 
      */
    protected int get_AccessLevel()
    {
      return accessLevel.intValue();
    }

    /** Load Meta Data */
    protected POInfo initPO (Properties ctx)
    {
      POInfo poi = POInfo.getPOInfo (ctx, Table_ID, get_TrxName());
      return poi;
    }

    public String toString()
    {
      StringBuilder sb = new StringBuilder ("X_ROK_Battle_Plan_Line[")
        .append(get_ID()).append("]");
      return sb.toString();
    }
}