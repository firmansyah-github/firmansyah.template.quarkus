<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/user/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|User.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.user;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import ${PUB_APP_GROUP}.realworldapi.domain.model.constants.ValidationMessages;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.UUID;

@Data
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class User {

    @NotNull(message = ValidationMessages.USER_ID_MUST_BE_NOT_BLANK)
	//@Size(message = ValidationMessages.USER_ID_MAX_LENGTH, max = 2147483647)
	private UUID id; //java.lang.String
	@Size(message = ValidationMessages.USER_USERNAME_MAX_LENGTH, max = 255)
	private String username; //java.lang.String
	@Email
	@Size(message = ValidationMessages.USER_EMAIL_MAX_LENGTH, max = 255)
	private String email; //java.lang.String
	@Size(message = ValidationMessages.USER_PASSWORD_MAX_LENGTH, max = 255)
	private String password; //java.lang.String
	
	@Size(message = ValidationMessages.USER_BIO_MAX_LENGTH, max = 255)
	private String bio; //java.lang.String
	
	@Size(message = ValidationMessages.USER_IMAGE_MAX_LENGTH, max = 255)
	private String image; //java.lang.String
	
	
	
}
