<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/mapper/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|BusinessExceptionMapper.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.mapper;

import ${PUB_APP_GROUP}.realworldapi.application.web.model.response.ErrorResponse;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.*;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Provider
public class BusinessExceptionMapper implements ExceptionMapper<BusinessException> {

    private final Map<Class<? extends BusinessException>, Function<BusinessException, Response>> exceptionMapper;

	public BusinessExceptionMapper() {
		this.exceptionMapper = configureExceptionMapper();
	}

	private Map<Class<? extends BusinessException>, Function<BusinessException, Response>> configureExceptionMapper() {

		final var handlerMap = new HashMap<Class<? extends BusinessException>, Function<BusinessException, Response>>();

		handlerMap.put(EmailAlreadyExistsException.class, this::conflict);
		handlerMap.put(UserNotFoundException.class, this::notFound);
		handlerMap.put(InvalidPasswordException.class, this::unauthorized);
		handlerMap.put(UsernameAlreadyExistsException.class, this::conflict);
		<#list adv.entities as e>
		<#if e.create>
		handlerMap.put(${e.className}NotFoundException.class, this::notFound);
		handlerMap.put(${e.className}AlreadyExistsException.class, this::conflict);
		</#if>
		</#list>
		
		handlerMap.put(ModelValidationException.class, this::unprocessableEntity);
		handlerMap.put(FilterConjunctionNotValidException.class, this::unprocessableEntity);
		handlerMap.put(FilterFieldNotValidException.class, this::unprocessableEntity);
		handlerMap.put(FilterOperatorNotValidException.class, this::unprocessableEntity);
		handlerMap.put(FilterValueNotValidException.class, this::unprocessableEntity);

		return handlerMap;
	}

	private Response notFound(BusinessException businessException) {
		return Response.ok(errorResponse(businessException)).status(Response.Status.NOT_FOUND.getStatusCode()).build();
	}

	private Response conflict(BusinessException businessException) {
		return Response.ok(errorResponse(businessException)).status(Response.Status.CONFLICT.getStatusCode()).build();
	}

	private Response unauthorized(BusinessException businessException) {
		return Response.ok(errorResponse(businessException)).status(Response.Status.UNAUTHORIZED.getStatusCode())
				.build();
	}

	private Response unprocessableEntity(BusinessException businessException) {
		return Response.ok(errorResponse(businessException)).status(422).build();
	}

	private ErrorResponse errorResponse(BusinessException businessException) {
		return new ErrorResponse(businessException.getMessages());
	}

	@Override
	public Response toResponse(BusinessException businessException) {
		return this.exceptionMapper.get(businessException.getClass()).apply(businessException);
	}
}
