<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/impl/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|Find[class]ByPrimaryKeyImpl.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature.impl;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.Find${entity.className}ByPrimaryKey;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.${entity.className}NotFoundException;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}Repository;


@AllArgsConstructor
public class Find${entity.className}ByPrimaryKeyImpl implements Find${entity.className}ByPrimaryKey {

	private final ${entity.className}Repository ${entity.getInstanceName()}Repository;

	@Override
  	<#assign var1><#compress><@factor.gv_keys sep="," c=true/></#compress></#assign>
	public ${entity.className} handle(${var1?trim?replace('\n','')?replace(',',', ')}) {
  		<#assign var2><#compress><@factor.gv_keys sep="," c=false/></#compress></#assign>
		return ${entity.getInstanceName()}Repository.find${entity.className}ByPrimaryKey(${var2?trim?replace('\n','')?replace(',',', ')})
    			.orElseThrow(${entity.className}NotFoundException::new);
	}
}
