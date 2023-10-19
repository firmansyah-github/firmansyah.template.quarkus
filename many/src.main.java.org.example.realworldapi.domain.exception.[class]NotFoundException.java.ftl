<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/exception/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]NotFoundException.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.exception;

public class ${entity.className}NotFoundException extends BusinessException {

	public ${entity.className}NotFoundException() {
		super(5, "${entity.getInstanceName()} not found");
	}
}
