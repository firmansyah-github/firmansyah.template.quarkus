<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/mapper/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|BeanValidationExceptionMapper.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.mapper;

import ${PUB_APP_GROUP}.realworldapi.application.web.model.response.ErrorResponse;

import javax.validation.ConstraintViolationException;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

@Provider
public class BeanValidationExceptionMapper
    implements ExceptionMapper<ConstraintViolationException> {

  	@Override
	public Response toResponse(ConstraintViolationException e) {

		ErrorResponse errorResponse = new ErrorResponse();

		e.getConstraintViolations().iterator().forEachRemaining(contraint -> {
			errorResponse.getBody().add(contraint.getMessage());
		});

		return Response.ok(errorResponse).status(422).build();
	}
}
