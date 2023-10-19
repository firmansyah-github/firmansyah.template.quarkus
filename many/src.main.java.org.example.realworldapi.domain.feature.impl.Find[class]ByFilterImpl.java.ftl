<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/impl/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|Find[class]ByFilterImpl.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature.impl;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.Find${entity.className}ByFilter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};
<#-- import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}Filter;
 -->
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.ResourceFilter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}Repository;
import ${PUB_APP_GROUP}.realworldapi.domain.model.util.PageResult;

@AllArgsConstructor
public class Find${entity.className}ByFilterImpl implements Find${entity.className}ByFilter {

	private final ${entity.className}Repository ${entity.getInstanceName()}Repository;

	<#-- @Override
	public PageResult<${entity.className}> handle(${entity.className}Filter ${entity.getInstanceName()}Filter) {
		return ${entity.getInstanceName()}Repository.find${entity.className}ByFilter(${entity.getInstanceName()}Filter);
	}
	 -->
	@Override
	public PageResult<${entity.className}> handle(ResourceFilter resourceFilterr) {
		return ${entity.getInstanceName()}Repository.find${entity.className}ByFilter(resourceFilterr);
	}
}
