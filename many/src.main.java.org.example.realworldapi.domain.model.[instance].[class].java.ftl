<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/[instance]/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class].java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()};

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;

<@factor.gci isIncludeValid=true isIncludeParent=true isIncludeChild=true />

@Data
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class ${entity.className} {
	<@factor.gcv isIncludeValid=true isIncludeParent=true isIncludeChild=true />
}
