<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/provider/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|TokenProvider.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.provider;

import com.auth0.jwt.interfaces.DecodedJWT;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.profile.Role;

public interface TokenProvider {

    String createUserToken(String subject);

	DecodedJWT verify(String token);

	Role[] extractRoles(DecodedJWT decodedJWT);
}
