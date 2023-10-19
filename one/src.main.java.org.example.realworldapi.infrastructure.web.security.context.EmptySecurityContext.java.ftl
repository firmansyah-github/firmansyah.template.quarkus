<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/security/context/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|EmptySecurityContext.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.context;

import javax.ws.rs.core.SecurityContext;
import java.security.Principal;

public class EmptySecurityContext implements SecurityContext {
    @Override
	public Principal getUserPrincipal() {
		return null;
	}

	@Override
	public boolean isUserInRole(String s) {
		return false;
	}

	@Override
	public boolean isSecure() {
		return false;
	}

	@Override
	public String getAuthenticationScheme() {
		return null;
	}
}
