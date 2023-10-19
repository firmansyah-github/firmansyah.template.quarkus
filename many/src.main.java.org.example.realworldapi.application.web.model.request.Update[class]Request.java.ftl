<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/model/request/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|Update[class]Request.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.model.request;

import com.fasterxml.jackson.annotation.JsonRootName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.Update${entity.className}Input;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.validation.constraint.AtLeastOneFieldMustBeNotNull;

<@factor.gci isIncludeValid=true isIncludeParent=false isIncludeChild=false/>

@Getter
@Setter
@NoArgsConstructor
@JsonRootName("${entity.getInstanceName()}")
@AtLeastOneFieldMustBeNotNull
@RegisterForReflection
public class Update${entity.className}Request {

	<@factor.gcv isIncludeValid=true isIncludeParent=false isIncludeChild=false/>

	public Update${entity.className}Input toUpdate${entity.className}Input() {
		return new Update${entity.className}Input(
    		<#assign x><@factor.gmv c=false this="this." isIncludeParent=false isIncludeChild=false/></#assign>${x?trim}
		);
  }
}
