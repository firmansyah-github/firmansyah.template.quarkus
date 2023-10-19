<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/model/response/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]ListResponse.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.model.response;

import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@RegisterForReflection
public class ${entity.className}ListResponse {

	private List<${entity.className}Response> ${entity.getInstanceName()};
	private long ${entity.getInstanceName()}Count;

	public ${entity.className}ListResponse(List<${entity.className}Response> ${entity.getInstanceName()}, long ${entity.getInstanceName()}Count) {
		this.${entity.getInstanceName()} = ${entity.getInstanceName()};
		this.${entity.getInstanceName()}Count = ${entity.getInstanceName()}Count;
	}
}
