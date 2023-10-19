<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/model/request/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|New[class]Request.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.model.request;

import com.fasterxml.jackson.annotation.JsonRootName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.Getter;
import lombok.Setter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.New${entity.className}Input;
<@factor.gci isIncludeValid=true isIncludeParent=false isIncludeChild=false/>

@Getter
@Setter
@JsonRootName("${entity.getInstanceName()}")
@RegisterForReflection
public class New${entity.className}Request {
  
	<@factor.gcv isIncludeValid=true isIncludeParent=false isIncludeChild=false/>
  

	public New${entity.className}Input toNew${entity.className}Input() {
		return new New${entity.className}Input(
			<#assign x><@factor.gmv c=false this="this." isIncludeParent=false isIncludeChild=false/></#assign>${x?trim}
		);
  	}

}
