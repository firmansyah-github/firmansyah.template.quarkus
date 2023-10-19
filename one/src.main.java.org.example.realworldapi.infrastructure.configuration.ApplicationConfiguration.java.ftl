<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/configuration/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|ApplicationConfiguration.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.configuration;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.github.slugify.Slugify;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.qualifiers.NoWrapRootValueObjectMapper;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;
import javax.inject.Singleton;

@Dependent
public class ApplicationConfiguration {

  	@Produces
  	@Singleton
  	public Slugify slugify() {
    	return new Slugify();
  	}

  	@Singleton
  	@Produces
  	public ObjectMapper objectMapper() {
    	ObjectMapper objectMapper = new ObjectMapper();
    	objectMapper.enable(SerializationFeature.WRAP_ROOT_VALUE);
    	objectMapper.enable(DeserializationFeature.UNWRAP_ROOT_VALUE);
    	objectMapper.registerModule(new JavaTimeModule());
    	return objectMapper;
  	}

  	@Singleton
  	@Produces
  	@NoWrapRootValueObjectMapper
  	public ObjectMapper noWrapRootValueObjectMapper() {
    	return new ObjectMapper().registerModule(new JavaTimeModule());
  	}
}
