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
package org.compiere.model;

import java.sql.ResultSet;
import java.util.Properties;

/** Generated Model for c_mom_participantsline
 *  @author iDempiere (generated) 
 *  @version Release 10 - $Id$ */
@org.adempiere.base.Model(table="c_mom_participantsline")
public class X_c_mom_participantsline extends PO implements I_c_mom_participantsline, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20230630L;

    /** Standard Constructor */
    public X_c_mom_participantsline (Properties ctx, int c_mom_participantsline_ID, String trxName)
    {
      super (ctx, c_mom_participantsline_ID, trxName);
      /** if (c_mom_participantsline_ID == 0)
        {
        } */
    }

    /** Standard Constructor */
    public X_c_mom_participantsline (Properties ctx, int c_mom_participantsline_ID, String trxName, String ... virtualColumns)
    {
      super (ctx, c_mom_participantsline_ID, trxName, virtualColumns);
      /** if (c_mom_participantsline_ID == 0)
        {
        } */
    }

    /** Load Constructor */
    public X_c_mom_participantsline (Properties ctx, ResultSet rs, String trxName)
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
      StringBuilder sb = new StringBuilder ("X_c_mom_participantsline[")
        .append(get_ID()).append("]");
      return sb.toString();
    }
}