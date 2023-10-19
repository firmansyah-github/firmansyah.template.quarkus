<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/user/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|UserRepository.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.user;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository {
  	void save(User user);

  	boolean existsBy(String field, String value);

  	Optional<User> findByEmail(String email);

  	Optional<User> findUserById(UUID id);

  	boolean existsUsername(UUID excludeId, String username);

  	boolean existsEmail(UUID excludeId, String email);

  	void update(User user);

  	Optional<User> findByUsername(String username);
}
