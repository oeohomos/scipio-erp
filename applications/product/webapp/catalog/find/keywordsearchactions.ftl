<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#if productIds?has_content>
    <hr />
    <p><b>${uiLabelMap.ProductNote}:</b> ${uiLabelMap.ProductNoteKeywordSearch}</p>
    <hr />

    ${screens.render("component://product/widget/catalog/ProductScreens.xml#CreateVirtualWithVariantsFormInclude")}

    <@section title="${uiLabelMap.ProductRemoveResultsFrom} ${uiLabelMap.ProductCategory}">
        <form method="post" action="<@ofbizUrl>searchRemoveFromCategory</@ofbizUrl>" name="searchRemoveFromCategory">
          <input type="hidden" name="clearSearch" value="N" />
          <@field type="generic" label="${uiLabelMap.ProductCategory}">
              <@htmlTemplate.lookupField formName="searchRemoveFromCategory" name="SE_SEARCH_CATEGORY_ID" id="SE_SEARCH_CATEGORY_ID" fieldFormName="LookupProductCategory"/>
          </@field>
          <@field type="submit" text="${uiLabelMap.CommonRemove}" class="${styles.link_run_session!} ${styles.action_remove!}" />
        </form>
    </@section>

    <@section title="${uiLabelMap.ProductExpireResultsFrom} ${uiLabelMap.ProductCategory}">
        <form method="post" action="<@ofbizUrl>searchExpireFromCategory</@ofbizUrl>" name="searchExpireFromCategory">
          <input type="hidden" name="clearSearch" value="N" />
          <@field type="generic" label="${uiLabelMap.ProductCategory}">
              <@htmlTemplate.lookupField formName="searchExpireFromCategory" name="SE_SEARCH_CATEGORY_ID" id="SE_SEARCH_CATEGORY_ID" fieldFormName="LookupProductCategory"/>
          </@field>
          <@field type="generic" label="${uiLabelMap.CommonThru}">
              <@htmlTemplate.renderDateTimeField name="thruDate" event="" action="" className=""  title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="thruDate1" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
          </@field>
          <@field type="submit" text="${uiLabelMap.CommonExpire}" class="${styles.link_run_session!} ${styles.action_terminate!}" />
        </form>
    </@section>

    <@section title="${uiLabelMap.ProductAddResultsTo} ${uiLabelMap.ProductCategory}">
        <form method="post" action="<@ofbizUrl>searchAddToCategory</@ofbizUrl>" name="searchAddToCategory">
          <input type="hidden" name="clearSearch" value="N" />
          <@field type="generic" label="${uiLabelMap.ProductCategory}">
              <@htmlTemplate.lookupField formName="searchAddToCategory" name="SE_SEARCH_CATEGORY_ID" id="SE_SEARCH_CATEGORY_ID" fieldFormName="LookupProductCategory"/>
          </@field>
          <@field type="generic" label="${uiLabelMap.CommonFrom}">
              <@htmlTemplate.renderDateTimeField name="fromDate" event="" action="" className=""  title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="fromDate1" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
          </@field>
          <@field type="submit" text="${uiLabelMap.ProductAddToCategory}" class="${styles.link_run_session!} ${styles.action_add!}" />
        </form>
    </@section>

    <@section title="${uiLabelMap.ProductAddFeatureToResults}">
        <form method="post" action="<@ofbizUrl>searchAddFeature</@ofbizUrl>" name="searchAddFeature">
          <input type="hidden" name="clearSearch" value="N" />
          <@field type="input" label="${uiLabelMap.ProductFeatureId}" size="10" name="productFeatureId" value="" />
          <@field type="generic" label="${uiLabelMap.CommonFrom}">
              <@htmlTemplate.renderDateTimeField name="fromDate" event="" action="" className=""  title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="fromDate2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
          </@field>
          <@field type="generic" label="${uiLabelMap.CommonThru}">
              <@htmlTemplate.renderDateTimeField name="thruDate" event="" action="" className=""  title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="" size="25" maxlength="30" id="thruDate2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
          </@field>

          <@field type="input" label="${uiLabelMap.CommonAmount}" size="5" name="amount" value="" />
          <@field type="input" label="${uiLabelMap.CommonSequence}" size="5" name="sequenceNum" value="" />
          <#-- label for the following field used to be: ${uiLabelMap.ProductCategoryId} ??? -->
          <@field type="select" label="${uiLabelMap.ProductFeatureApplicationType}" name="productFeatureApplTypeId" size="1">
                <#list applicationTypes as applicationType>
                   <#assign displayDesc = applicationType.get("description", locale)?default("No Description")>
                   <#if 18 < displayDesc?length>
                       <#assign displayDesc = displayDesc[0..15] + "...">
                   </#if>
                   <option value="${applicationType.productFeatureApplTypeId}">${displayDesc}</option>
                </#list>
          </@field>
          
          <@field type="submit" text="${uiLabelMap.ProductAddFeature}" class="${styles.link_run_session!} ${styles.action_add!}" />
        </form>
    </@section>

    <@section title="${uiLabelMap.ProductRemoveFeatureFromResults}">
        <form method="post" action="<@ofbizUrl>searchRemoveFeature</@ofbizUrl>" name="searchRemoveFeature">
          <input type="hidden" name="clearSearch" value="N" />
          <@field type="input" label="${uiLabelMap.ProductFeatureId}" size="10" name="productFeatureId" value="" />
          
          <@field type="submit" text="${uiLabelMap.ProductRemoveFeature}" class="${styles.link_run_session!} ${styles.action_remove!}" />
        </form>
    </@section>

    <@section title="${uiLabelMap.ProductSearchParameters}">
        <form method="post" action="" name="searchShowParams">
          <input type="hidden" name="clearSearch" value="N" />
          <#assign searchParams = Static["org.ofbiz.product.product.ProductSearchSession"].makeSearchParametersString(session)>
          <@field type="input" label="${uiLabelMap.ProductPlainSearchParameters}" size="60" name="searchParameters" readonly=true value="${StringUtil.wrapString(searchParams)}" />
          <@field type="input" label="${uiLabelMap.ProductHtmlSearchParameters}" size="60" name="searchParameters" readonly=true value="${StringUtil.wrapString(searchParams)?html}" />
        </form>
    </@section>

    <@section title="${uiLabelMap.ProductSearchExportProductList}">
        <@field type="submit" submitType="link" href=makeOfbizUrl("searchExportProductList?clearSearch=N") class="${styles.link_nav!} ${styles.action_find!}" text="${uiLabelMap.ProductSearchExport}" />
    </@section>
</#if>
