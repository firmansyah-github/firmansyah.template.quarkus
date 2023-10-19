<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/[instance]/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]Filter.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()};

import lombok.AllArgsConstructor;
import lombok.Data;

<@factor.gci isIncludeValid=false isIncludeParent=false isIncludeChild=true suffix="" suffixChild=""/>

@Data
@AllArgsConstructor
public class ${entity.className}Filter {
	private final int offset;
	private final int limit;
	<@factor.gcv isIncludeValid=false isIncludeParent=false isIncludeChild=false isJsonFormatDate=false suffix="" isFindDataType=true suffixChild=""/>
}
