<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/security/filter/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|AuthorizationFilter.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.filter;

import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.profile.Role;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.exception.ForbiddenException;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.annotation.Secured;

import javax.annotation.Priority;
import javax.ws.rs.Priorities;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ResourceInfo;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.ext.Provider;
import java.io.IOException;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

@Secured
@Provider
@Priority(Priorities.AUTHORIZATION)
public class AuthorizationFilter implements ContainerRequestFilter {

    @Context
	private ResourceInfo resourceInfo;

	@Override
	public void filter(ContainerRequestContext containerRequestContext) throws IOException {

		Class<?> resourceClass = resourceInfo.getResourceClass();
		Method resourceMethod = resourceInfo.getResourceMethod();

		if (!isSecurityOptional(resourceMethod, resourceClass)) {
			SecurityContext securityContext = containerRequestContext.getSecurityContext();

			List<Role> classRoles = extractRoles(resourceClass);
			List<Role> methodRoles = extractRoles(resourceMethod);

			try {
				if (methodRoles.isEmpty()) {
					checkPermissions(classRoles, securityContext);
				} else {
					checkPermissions(methodRoles, securityContext);
				}
			} catch (Exception ex) {
				containerRequestContext.abortWith(Response.status(Response.Status.FORBIDDEN).build());
			}
		}
	}

	private boolean isSecurityOptional(Method resourceMethod, Class<?> resourceClass) {
		Secured resourceClassSecured = resourceClass.getAnnotation(Secured.class);
		Secured resourceMethodSecured = resourceMethod.getAnnotation(Secured.class);

		if (resourceMethodSecured != null) {
			return resourceMethodSecured.optional();
		}

		if (resourceClassSecured != null) {
			return resourceClassSecured.optional();
		}

		return false;
	}

	private void checkPermissions(List<Role> allowedRoles, SecurityContext securityContext) {
		if (!isAccessAllowed(allowedRoles, securityContext)) {
			throw new ForbiddenException();
		}
	}

	private boolean isAccessAllowed(List<Role> allowedRoles, SecurityContext securityContext) {
		for (Role allowedRole : allowedRoles) {
			if (securityContext.isUserInRole(allowedRole.name())) {
				return true;
			}
		}
		return false;
	}

	private List<Role> extractRoles(AnnotatedElement annotatedElement) {
		if (annotatedElement == null) {
			return new LinkedList<>();
		} else {
			Secured secured = annotatedElement.getAnnotation(Secured.class);
			if (secured == null) {
				return new LinkedList<>();
			} else {
				return Arrays.asList(secured.value());
			}
		}
	}
}
