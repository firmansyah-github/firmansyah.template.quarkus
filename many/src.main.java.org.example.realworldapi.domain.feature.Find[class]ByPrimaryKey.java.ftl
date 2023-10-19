<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|Find[class]ByPrimaryKey.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature;

import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};
<@factor.gci isIncludeValid=false isIncludeParent=false isIncludeChild=false suffix="" suffixChild=""/>



public interface Find${entity.className}ByPrimaryKey {
    <#assign var1><#compress><@factor.gv_keys sep="," c=true/></#compress></#assign>
	${entity.className} handle(${var1?trim?replace('\n','')?replace(',',', ')});
}

