<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/resource/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]ResourceUtils.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.resource;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.application.web.model.response.*;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.FilterFieldNotValidException;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.*;
import ${PUB_APP_GROUP}.realworldapi.domain.model.util.PageResult;
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.ResourceUtils;
import org.example.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.enterprise.context.ApplicationScoped;



@ApplicationScoped
@AllArgsConstructor
public class ${entity.className}ResourceUtils extends ResourceUtils{

    private static List<String> lsField = new ArrayList<String>();
	
	static {
		<#list entity.fieldListSortByOrdinalPosition as fld>
			<#if fld.create>
		lsField.add("${fld.fieldName?upper_case}");
    		</#if>
  	   	</#list>
	}

	<#assign var1><#compress><@factor.gv_imps c=true
		          preType="private final Find" 
				  sufType="ByPrimaryKey" 
				  preName="find" 
				  sufName="ByPrimaryKey;"
				  unCapName=false/></#compress></#assign>
	${var1?trim?replace('\n','')?replace(';',';\n\t')}
  
	public ${entity.className}Response ${entity.getInstanceName()}Response(${entity.className} ${entity.getInstanceName()}) {
		<#assign var2><#compress><@factor.pmb_xxxresourceutils_xxxresponse /></#compress></#assign>
		${var2?trim?replace('\n','')?replace(';',';\n\t\t')?replace('. ','.')?replace(',new',',\n\t\t\t\t\t\t\t\t\t\tnew')}
        return ${entity.getInstanceName()}Response;
	}

	public ${entity.className}ListResponse ${entity.getInstanceName()}Response(PageResult<${entity.className}> pageResult) {
		final var resultResponse =
			pageResult.getResult().stream()
				.map(${entity.getInstanceName()} -> ${entity.getInstanceName()}Response(${entity.getInstanceName()}))
				.collect(Collectors.toList());
		return new ${entity.className}ListResponse(resultResponse, pageResult.getTotal());
	}
	
	@Override
	protected String validateField(String string) {
		if(lsField.contains(string.trim().toUpperCase())) {
			return string.trim();
		} else {
			throw new FilterFieldNotValidException();
		}
	}
	
	@Override
	protected String transformToSqlField(String string) {
		switch (string) {
		<#list entity.fieldListSortByOrdinalPosition as fld>
			<#if fld.create>
			case "${fld.fieldName}":
				return "${fld.columnName}";
    		</#if>
  	   	</#list>
			default:
				return "";
		}
	}
}
