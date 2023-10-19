<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/user/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|NewUserInput.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class NewUserInput {
  	private String id; //java.lang.String
	private String bio; //java.lang.String
	private String email; //java.lang.String
	private String image; //java.lang.String
	private String password; //java.lang.String
	private String username; //java.lang.String
}
