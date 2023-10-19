<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/model/request/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|LoginUserRequest.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.model.request;

import com.fasterxml.jackson.annotation.JsonRootName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.Getter;
import lombok.Setter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.constants.ValidationMessages;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.LoginUserInput;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@JsonRootName("user")
@RegisterForReflection
public class LoginUserRequest {

	@NotBlank(message = ValidationMessages.EMAIL_MUST_BE_NOT_BLANK)
 	private String email;

  	@NotBlank(message = ValidationMessages.PASSWORD_MUST_BE_NOT_BLANK)
  	private String password;

  	public LoginUserInput toLoginUserInput() {
		return new LoginUserInput(this.email, this.password);
  	}
}
