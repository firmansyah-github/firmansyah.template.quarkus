<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/user/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|UserModelBuilder.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.user;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.domain.validator.ModelValidator;

import javax.inject.Named;
import java.util.UUID;

@Named
@AllArgsConstructor
public class UserModelBuilder {
  	private final ModelValidator modelValidator;

  	public User build(String username, String email, String password) {
    	return modelValidator.validate(
        	new User(UUID.randomUUID(), username, email, password, null, null));
  	}

  	public User build(
      	UUID id, String username, String bio, String image, String password, String email) {
    	return modelValidator.validate(new User(id, username, email, password, bio, image));
  	}
}
