<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/impl/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|Create[class]Impl.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature.impl;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.Create${entity.className};
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.*;
import org.example.realworldapi.domain.exception.${entity.className}AlreadyExistsException;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.*;


@AllArgsConstructor
public class Create${entity.className}Impl implements Create${entity.className} {

	private final ${entity.className}Repository ${entity.getInstanceName()}Repository;
	private final ${entity.className}ModelBuilder ${entity.getInstanceName()}Builder;
	<#assign var1><#compress><@factor.gv_imps c=true
		          preType="private final Find" 
				  sufType="ByPrimaryKey" 
				  preName="find" 
				  sufName="ByPrimaryKey;"
				  unCapName=false/></#compress></#assign>
	${var1?trim?replace('\n','')?replace(';',';\n\t')}

	@Override
	public ${entity.className} handle(New${entity.className}Input new${entity.className}Input) {
    	<#assign var2><#compress><@factor.pmv_crudxxximpl_builder/></#compress></#assign>
		final var ${entity.getInstanceName()} =
			${entity.getInstanceName()}Builder.build(${var2?trim?replace('\n','')?replace(' ','')?replace(',',',\n\t\t\t\t\t')});
		
		if(${entity.instanceName}Repository.find${entity.className}ByPrimaryKey(<@factor.pmv_createxxximpl_save/>).isPresent()) {
			throw new ${entity.className}AlreadyExistsException();
		} else {
			${entity.instanceName}Repository.save(${entity.getInstanceName()});
		}
   
		return ${entity.getInstanceName()};
	}
}
