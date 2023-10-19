<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/configuration/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]Configuration.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.configuration;

import ${PUB_APP_GROUP}.realworldapi.domain.feature.*;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.impl.*;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}ModelBuilder;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}Repository;
import ${PUB_APP_GROUP}.realworldapi.domain.validator.ModelValidator;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;
import javax.inject.Singleton;

@Dependent
public class ${entity.className}Configuration {

	@Produces
  	@Singleton
  	public Create${entity.className} create${entity.className}(
		${entity.className}Repository ${entity.getInstanceName()}Repository,
      	${entity.className}ModelBuilder ${entity.getInstanceName()}Builder <@factor.gv_imps sep="," 
                       preType="Find" 
		               sufType="ByPrimaryKey" 
		               preName="find" 
		               sufName="ByPrimaryKey" 
		               c=true 
		               unCapName=false 
		               isFirstVar=false/>) {
    	return new Create${entity.className}Impl(
        	${entity.getInstanceName()}Repository,
        	${entity.getInstanceName()}Builder <@factor.gv_imps sep=","  
                         preType="Find" 
		                 sufType="ByPrimaryKey" 
		                 preName="find" 
		                 sufName="ByPrimaryKey" 
		                 c=false 
		                 unCapName=false 
		                 isFirstVar=false/>);
  	}
  
  	@Produces
  	@Singleton
  	public Delete${entity.className} delete${entity.className}(
		${entity.className}Repository ${entity.getInstanceName()}Repository) {
    		return new Delete${entity.className}Impl(
        			${entity.getInstanceName()}Repository);
  	}

  	@Produces
  	@Singleton
  	public Find${entity.className}ByFilter find${entity.className}ByFilter(${entity.className}Repository ${entity.getInstanceName()}Repository) {
    	return new Find${entity.className}ByFilterImpl(${entity.getInstanceName()}Repository);
  	}
  
  	@Produces
  	@Singleton
  	public Find${entity.className}ByPrimaryKey find${entity.className}ByPrimaryKey(${entity.className}Repository ${entity.getInstanceName()}Repository) {
		return new Find${entity.className}ByPrimaryKeyImpl(${entity.getInstanceName()}Repository);
  	}

  	@Produces
  	@Singleton
  	public Update${entity.className} update${entity.className}(
		${entity.className}Repository ${entity.getInstanceName()}Repository,
      	${entity.className}ModelBuilder ${entity.getInstanceName()}Builder,
      	Find${entity.className}ByPrimaryKey find${entity.getInstanceName()?cap_first}ByPrimaryKey	<@factor.gv_imps sep=","  
                       preType="Find" 
		               sufType="ByPrimaryKey" 
		               preName="find" 
		               sufName="ByPrimaryKey" 
		               c=true 
		               unCapName=false 
		               isFirstVar=false/>) {
		return new Update${entity.className}Impl(
        	${entity.getInstanceName()}Repository,
        	${entity.getInstanceName()}Builder,
        	find${entity.getInstanceName()?cap_first}ByPrimaryKey <@factor.gv_imps sep="," 
                        preType="Find" 
		                sufType="ByPrimaryKey" 
		                preName="find" 
		                sufName="ByPrimaryKey" 
		                c=false 
		                unCapName=false 
		                isFirstVar=false/>);
  	}
  

  	@Produces
  	@Singleton
  	public ${entity.className}ModelBuilder ${entity.getInstanceName()}Builder(ModelValidator modelValidator) {
		return new ${entity.className}ModelBuilder(modelValidator);
  	}
}
