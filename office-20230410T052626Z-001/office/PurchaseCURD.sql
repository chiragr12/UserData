Create Purchase :-

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:_0="http://idempiere.org/ADInterface/1_0">
   <soapenv:Header/>
   <soapenv:Body>
      <_0:createData>
         <_0:ModelCRUDRequest>
            <_0:ModelCRUD>
               <_0:serviceType>ccreate</_0:serviceType>
               <_0:DataRow>
                  <_0:field column="C_BPartner_ID">
                     <_0:val>121</_0:val>
                  </_0:field>
                  <_0:field column="DocumentNo">
                     <_0:val>11110001</_0:val>
                  </_0:field>
                  <_0:field column="DocStatus">
                     <_0:val>DR</_0:val>
                  </_0:field>
               </_0:DataRow>
            </_0:ModelCRUD>
            <_0:ADLoginRequest>
               <_0:user>SuperUser</_0:user>
               <_0:pass>System</_0:pass>
               <_0:lang>112</_0:lang>
               <_0:ClientID>11</_0:ClientID>
               <_0:RoleID>102</_0:RoleID>
               <_0:OrgID>50007</_0:OrgID>
               <_0:WarehouseID>1000000</_0:WarehouseID>
               <_0:stage>0</_0:stage>
            </_0:ADLoginRequest>
         </_0:ModelCRUDRequest>
      </_0:createData>
   </soapenv:Body>
</soapenv:Envelope>

Output:-

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:createDataResponse xmlns:ns1="http://idempiere.org/ADInterface/1_0">
         <StandardResponse RecordID="1000154" xmlns="http://idempiere.org/ADInterface/1_0"/>
      </ns1:createDataResponse>
   </soap:Body>
</soap:Envelope>

=====================================================================================================================================================================
Read Data:-

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:_0="http://idempiere.org/ADInterface/1_0">
   <soapenv:Header/>
   <soapenv:Body>
      <_0:readData>
         <_0:ModelCRUDRequest>
            <_0:ModelCRUD>
               <_0:serviceType>cread</_0:serviceType>
               <_0:RecordID>1000154</_0:RecordID>
            </_0:ModelCRUD>
            <_0:ADLoginRequest>
               <_0:user>SuperUser</_0:user>
               <_0:pass>System</_0:pass>
               <_0:lang>112</_0:lang>
               <_0:ClientID>11</_0:ClientID>
               <_0:RoleID>102</_0:RoleID>
               <_0:OrgID>50007</_0:OrgID>
               <_0:WarehouseID>1000000</_0:WarehouseID>
               <_0:stage>0</_0:stage>
            </_0:ADLoginRequest>
         </_0:ModelCRUDRequest>
      </_0:readData>
   </soapenv:Body>
</soapenv:Envelope>

Output:-

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:readDataResponse xmlns:ns1="http://idempiere.org/ADInterface/1_0">
         <WindowTabData NumRows="1" TotalRows="1" StartRow="1" xmlns="http://idempiere.org/ADInterface/1_0">
            <DataSet>
               <DataRow>
                  <field column="DocumentNo">
                     <val>11110001</val>
                  </field>
                  <field column="DocStatus">
                     <val>DR</val>
                  </field>
                  <field column="M_Warehouse_ID">
                     <val>1000000</val>
                  </field>
                  <field column="Bill_BPartner_ID">
                     <val>121</val>
                  </field>
               </DataRow>
            </DataSet>
            <RowCount>1</RowCount>
            <Success>true</Success>
         </WindowTabData>
      </ns1:readDataResponse>
   </soap:Body>
</soap:Envelope>

====================================================================================================================================================================
Update Data:-

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:_0="http://idempiere.org/ADInterface/1_0">
   <soapenv:Header/>
   <soapenv:Body>
      <_0:updateData>
         <_0:ModelCRUDRequest>
            <_0:ModelCRUD>
               <_0:serviceType>cupdate</_0:serviceType>
               <_0:RecordID>1000154</_0:RecordID>
               <_0:DataRow>
                  <_0:field column="DocStatus">
                     <_0:val>CO</_0:val>
                  </_0:field>
               </_0:DataRow>
            </_0:ModelCRUD>
            <_0:ADLoginRequest>
               <_0:user>SuperUser</_0:user>
               <_0:pass>System</_0:pass>
               <_0:lang>112</_0:lang>
               <_0:ClientID>11</_0:ClientID>
               <_0:RoleID>102</_0:RoleID>
               <_0:OrgID>50007</_0:OrgID>
               <_0:WarehouseID>1000000</_0:WarehouseID>
               <_0:stage>0</_0:stage>
            </_0:ADLoginRequest>
         </_0:ModelCRUDRequest>
      </_0:updateData>
   </soapenv:Body>
</soapenv:Envelope>

Output:-

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:updateDataResponse xmlns:ns1="http://idempiere.org/ADInterface/1_0">
         <StandardResponse RecordID="1000154" xmlns="http://idempiere.org/ADInterface/1_0"/>
      </ns1:updateDataResponse>
   </soap:Body>
</soap:Envelope>

====================================================================================================================================================================
Read Data:-

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:_0="http://idempiere.org/ADInterface/1_0">
   <soapenv:Header/>
   <soapenv:Body>
      <_0:readData>
         <_0:ModelCRUDRequest>
            <_0:ModelCRUD>
               <_0:serviceType>cread</_0:serviceType>
               <_0:RecordID>1000154</_0:RecordID>
            </_0:ModelCRUD>
            <_0:ADLoginRequest>
               <_0:user>SuperUser</_0:user>
               <_0:pass>System</_0:pass>
               <_0:lang>112</_0:lang>
               <_0:ClientID>11</_0:ClientID>
               <_0:RoleID>102</_0:RoleID>
               <_0:OrgID>50007</_0:OrgID>
               <_0:WarehouseID>1000000</_0:WarehouseID>
               <_0:stage>0</_0:stage>
            </_0:ADLoginRequest>
         </_0:ModelCRUDRequest>
      </_0:readData>
   </soapenv:Body>
</soapenv:Envelope>

Output:-

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:readDataResponse xmlns:ns1="http://idempiere.org/ADInterface/1_0">
         <WindowTabData NumRows="1" TotalRows="1" StartRow="1" xmlns="http://idempiere.org/ADInterface/1_0">
            <DataSet>
               <DataRow>
                  <field column="DocumentNo">
                     <val>11110001</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="M_Warehouse_ID">
                     <val>1000000</val>
                  </field>
                  <field column="Bill_BPartner_ID">
                     <val>121</val>
                  </field>
               </DataRow>
            </DataSet>
            <RowCount>1</RowCount>
            <Success>true</Success>
         </WindowTabData>
      </ns1:readDataResponse>
   </soap:Body>
</soap:Envelope>

====================================================================================================================================================================
Query Data:-

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:_0="http://idempiere.org/ADInterface/1_0">
   <soapenv:Header/>
   <soapenv:Body>
      <_0:queryData>
         <_0:ModelCRUDRequest>
            <_0:ModelCRUD>
               <_0:serviceType>cquery</_0:serviceType>
            </_0:ModelCRUD>
            <_0:ADLoginRequest>
               <_0:user>SuperUser</_0:user>
               <_0:pass>System</_0:pass>
               <_0:lang>112</_0:lang>
               <_0:ClientID>11</_0:ClientID>
               <_0:RoleID>102</_0:RoleID>
               <_0:OrgID>50007</_0:OrgID>
               <_0:WarehouseID>1000000</_0:WarehouseID>
               <_0:stage>0</_0:stage>
            </_0:ADLoginRequest>
         </_0:ModelCRUDRequest>
      </_0:queryData>
   </soapenv:Body>
</soapenv:Envelope>

Output:-

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:queryDataResponse xmlns:ns1="http://idempiere.org/ADInterface/1_0">
         <WindowTabData NumRows="28" TotalRows="28" StartRow="0" xmlns="http://idempiere.org/ADInterface/1_0">
            <DataSet>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800000</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>114</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800002</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>121</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800004</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>114</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>8000</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>114</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800003</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>50003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800001</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>120</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800005</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>120</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800006</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>120</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800008</val>
                  </field>
                  <field column="DocStatus">
                     <val>CL</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800007</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800009</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800010</val>
                  </field>
                  <field column="DocStatus">
                     <val>CL</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800016</val>
                  </field>
                  <field column="DocStatus">
                     <val>CL</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800012</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800011</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800014</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800013</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800015</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000005</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800017</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800018</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800019</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800022</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800023</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800024</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800020</val>
                  </field>
                  <field column="DocStatus">
                     <val>DR</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800021</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800025</val>
                  </field>
                  <field column="DocStatus">
                     <val>DR</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000002</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="DocumentNo">
                     <val>800026</val>
                  </field>
                  <field column="DocStatus">
                     <val>CO</val>
                  </field>
                  <field column="C_BPartner_ID">
                     <val>1000003</val>
                  </field>
               </DataRow>
            </DataSet>
            <RowCount>28</RowCount>
            <Success>true</Success>
         </WindowTabData>
      </ns1:queryDataResponse>
   </soap:Body>
</soap:Envelope>

====================================================================================================================================================================
Get List:-

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:_0="http://idempiere.org/ADInterface/1_0">
   <soapenv:Header/>
   <soapenv:Body>
      <_0:getList>
         <_0:ModelGetListRequest>
            <_0:ModelGetList>
               <_0:serviceType>cget</_0:serviceType>
            </_0:ModelGetList>
            <_0:ADLoginRequest>
               <_0:user>SuperUser</_0:user>
               <_0:pass>System</_0:pass>
               <_0:lang>112</_0:lang>
               <_0:ClientID>11</_0:ClientID>
               <_0:RoleID>102</_0:RoleID>
               <_0:OrgID>50007</_0:OrgID>
               <_0:WarehouseID>1000000</_0:WarehouseID>
               <_0:stage>0</_0:stage>
            </_0:ADLoginRequest>
         </_0:ModelGetListRequest>
      </_0:getList>
   </soapenv:Body>
</soapenv:Envelope>

Output:-

<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   <soap:Body>
      <ns1:getListResponse xmlns:ns1="http://idempiere.org/ADInterface/1_0">
         <WindowTabData NumRows="28" TotalRows="28" StartRow="1" xmlns="http://idempiere.org/ADInterface/1_0">
            <DataSet>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>200002</val>
                  </field>
                  <field column="DocumentNo">
                     <val>8000</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2002-02-22 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>104</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800000</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2003-01-22 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>105</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800001</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2003-01-22 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>106</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800002</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2003-01-22 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000000</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800003</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-06 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000001</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800004</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-07 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000002</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800005</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-07 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000004</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800006</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-15 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000005</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800007</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-20 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000006</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800008</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-20 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000008</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800009</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-20 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000010</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800010</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-21 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000011</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800011</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-21 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000012</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800012</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-21 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000013</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800013</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-23 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000014</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800014</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-06-23 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000016</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800015</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-07-04 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000018</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800016</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-07-06 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000019</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800017</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-07-06 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000023</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800018</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-07-18 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000054</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800019</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-08-03 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000056</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800020</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-08-03 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000057</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800021</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-08-03 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000097</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800022</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-08-11 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000098</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800023</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-08-11 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000100</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800024</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-08-11 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000147</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800025</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-09-01 00:00:00</val>
                  </field>
               </DataRow>
               <DataRow>
                  <field column="C_Order_ID">
                     <val>1000150</val>
                  </field>
                  <field column="DocumentNo">
                     <val>800026</val>
                  </field>
                  <field column="DateOrdered">
                     <val>2023-09-01 00:00:00</val>
                  </field>
               </DataRow>
            </DataSet>
            <RowCount>28</RowCount>
            <Success>true</Success>
         </WindowTabData>
      </ns1:getListResponse>
   </soap:Body>
</soap:Envelope>

====================================================================================================================================================================