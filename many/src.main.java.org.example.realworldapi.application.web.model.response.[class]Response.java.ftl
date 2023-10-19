<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/model/response/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]Response.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
${PUB_SYS_DTM@timestamp|java.time.LocalDateTime|test}
${PUB_SYS_DTM@serial|java.lang.Integer|test}
${PUB_SYS_DTM@int4|java.lang.Integer|test}
${PUB_SYS_DTM@bool|java.lang.Boolean|test}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.model.response;

import com.fasterxml.jackson.annotation.JsonRootName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};
<@factor.gci isIncludeValid=true isIncludeParent=false isIncludeChild=false suffix="Response" suffixChild="" isJsonFormat=true/>

@Getter
@Setter
@NoArgsConstructor
@JsonRootName("${entity.getInstanceName()}")
@RegisterForReflection
public class ${entity.className}Response {

	<@factor.gcv isIncludeValid=true isIncludeParent=true isIncludeChild=false isJsonFormatDate=true suffix="Response" isFindDataType=true suffixChild=""/>

	<#assign var1><#compress><@factor.gmv c=true isIncludeEntity=true isIncludeParent=true isIncludeChild=false suffix="Response" suffixChild=""/></#compress></#assign>
	public ${entity.className}Response(${var1?trim?replace('\n','')?replace(',',', ')}) {
		<#assign x><@factor.pmb_xxxresponse_response isIncludeEntity=true 
		                                             isIncludeParent=true 
		                                             isIncludeChild=false 
		                                             suffix="Response" 
		                                             suffixChild=""/></#assign>${x}
	}
    
    <#if entity.fieldListExceptForeignKey?size gt 0 > 
  	<#assign var2><#compress><@factor.gmv c=true isIncludeEntity=true isIncludeParent=false isIncludeChild=false suffix="Response" suffixChild=""/></#compress></#assign>
	public ${entity.className}Response(boolean isFlag, ${var2?trim?replace('\n','')?replace(',',', ')}) {
		if(isFlag){
			<#assign y><#compress><@factor.pmb_xxxresponse_response isExceptForeignKey=true 
										  isIncludeEntity=true 
										  isIncludeParent=false 
										  isIncludeChild=false 
										  suffix="Response" 
										  suffixChild=""/></#compress></#assign>
			${y?replace(';\n',';\n\t\t\t')}
			
		}
	}
	</#if>
  
}
