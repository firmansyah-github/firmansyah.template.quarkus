<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/mapper/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|InfrastructureExceptionMapper.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.mapper;

import ${PUB_APP_GROUP}.realworldapi.application.web.model.response.ErrorResponse;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.exception.ForbiddenException;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.exception.InfrastructureException;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.exception.UnauthorizedException;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Provider
public class InfrastructureExceptionMapper implements ExceptionMapper<InfrastructureException> {

    private final Map<Class<? extends InfrastructureException>, Function<InfrastructureException, Response>> exceptionMapper;

	public InfrastructureExceptionMapper() {
		this.exceptionMapper = configureExceptionMapper();
	}

	private Map<Class<? extends InfrastructureException>, Function<InfrastructureException, Response>> configureExceptionMapper() {
		final var exceptionMap = new HashMap<Class<? extends InfrastructureException>, Function<InfrastructureException, Response>>();
		exceptionMap.put(ForbiddenException.class, this::forbidden);
		exceptionMap.put(UnauthorizedException.class, this::unauthorized);
		return exceptionMap;
	}

	private Response forbidden(InfrastructureException infrastructureException) {
		return Response.ok(errorResponse(Response.Status.FORBIDDEN.toString())).status(Response.Status.FORBIDDEN)
				.build();
	}

	private Response unauthorized(InfrastructureException infrastructureException) {
		return Response.ok(errorResponse(Response.Status.UNAUTHORIZED.toString())).status(Response.Status.UNAUTHORIZED)
				.build();
	}

	private ErrorResponse errorResponse(String message) {
		return new ErrorResponse(message);
	}

	@Override
	public Response toResponse(InfrastructureException infrastructureException) {
		return this.exceptionMapper.get(infrastructureException.getClass()).apply(infrastructureException);
	}
}
