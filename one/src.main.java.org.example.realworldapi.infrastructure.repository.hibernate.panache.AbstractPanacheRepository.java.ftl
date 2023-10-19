<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/panache/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|AbstractPanacheRepository.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.panache;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity.*;

import java.util.List;
import java.util.stream.Collectors;

public class AbstractPanacheRepository<ENTITY, ID> implements PanacheRepositoryBase<ENTITY, ID> {

 	protected UsersEntity findUserEntityById(String id) {
		return getEntityManager().find(UsersEntity.class, id);
	}

	protected boolean isNotEmpty(List<?> list) {
		return list != null && !list.isEmpty();
	}

	protected List<String> toUpperCase(List<String> subjectList) {
		return subjectList.stream().map(String::toUpperCase).collect(Collectors.toList());
	}
}
