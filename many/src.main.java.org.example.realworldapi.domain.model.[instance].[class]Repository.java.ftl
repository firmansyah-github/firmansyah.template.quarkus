<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/[instance]/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]Repository.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()};

import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.ResourceFilter;
import java.util.Optional;
import org.example.realworldapi.domain.model.util.PageResult;


public interface ${entity.className}Repository {

	void save(${entity.className} ${entity.getInstanceName()});

	<@factor.pm_xxxrepository_findxxxbyprimarykey/>

	void update(${entity.className} ${entity.getInstanceName()});

	boolean delete(<@factor.gv_keys sep="," c=true/>);

	<#-- PageResult<${entity.className}> find${entity.className}ByFilter(${entity.className}Filter filter);
 -->
    PageResult<${entity.className}> find${entity.className}ByFilter(ResourceFilter resourceFilter);
    
	long count${entity.className}();
}
