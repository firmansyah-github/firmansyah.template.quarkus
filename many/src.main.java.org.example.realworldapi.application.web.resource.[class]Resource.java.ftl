<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/resource/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]Resource.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.application.web.resource;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import ${PUB_APP_GROUP}.realworldapi.application.web.model.request.New${entity.className}Request;
import ${PUB_APP_GROUP}.realworldapi.application.web.model.request.Update${entity.className}Request;
import ${PUB_APP_GROUP}.realworldapi.domain.model.constants.ValidationMessages;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.*;
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.FilterCondition;
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.ResourceFilter;
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.SortCondition;
<#--import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}Filter;
 -->
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.qualifiers.NoWrapRootValueObjectMapper;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.annotation.Secured;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.security.profile.Role;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;

@Path("/${entity.getInstanceName()}")
@AllArgsConstructor
public class ${entity.className}Resource {  
  
    private final Find${entity.className}ByFilter find${entity.className}ByFilter;
  	private final Find${entity.className}ByPrimaryKey find${entity.className}ByPrimaryKey;
  	private final Create${entity.className} create${entity.className};
  	private final Update${entity.className} update${entity.className};
  	private final Delete${entity.className} delete${entity.className};
  	@NoWrapRootValueObjectMapper ObjectMapper objectMapper;
  	private final ${entity.className}ResourceUtils resourceUtils;
  	
  	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Secured(optional = true)
	public Response find${entity.className}ByFilter(@QueryParam("offset") int offset, @QueryParam("limit") int limit,
			@Context SecurityContext securityContext, @QueryParam("filter") String filter,
            @QueryParam("conjunctions") String conjunctions,
            @QueryParam("sort") String sort)
			throws JsonProcessingException {
		
		<#-- // final var loggedUserId = resourceUtils.getLoggedUserId(securityContext);
		<#assign var1><#compress><@factor.pmb_xxxresource_find/></#compress></#assign>
		final var filter = new ${entity.className}Filter(offset, resourceUtils.getLimit(limit) ${var1?trim?replace('\n','')?replace(',',',\n\t\t\t\t\t\t\t\t')});
		final var ${entity.getInstanceName()}PageResult = find${entity.className}ByFilter.handle(filter);
		 -->
		List<FilterCondition> filterConditions = resourceUtils.parseFilterConditions(filter, conjunctions);
        List<SortCondition> sortConditions = resourceUtils.parseSortConditions(sort);
		final var resourceFilter = new ResourceFilter(offset, resourceUtils.getLimit(limit) ,
								filterConditions,sortConditions);
		final var ${entity.getInstanceName()}PageResult = find${entity.className}ByFilter.handle(resourceFilter);

		return Response.ok(
            objectMapper.writeValueAsString(
                resourceUtils.${entity.getInstanceName()}Response(${entity.getInstanceName()}PageResult)))
        .status(Response.Status.OK)
        .build();
	}
	
	@GET
	@Path("/find")
  	@Secured(optional = true)
  	@Produces(MediaType.APPLICATION_JSON)
  	<#assign var2><#compress><@factor.pmv_xxxresource_pk_queryparam/></#compress></#assign>
  	public Response find${entity.className}ByPrimaryKey(@Context SecurityContext securityContext ${var2?trim?replace('\n','')?replace(',',',\n\t\t\t')}) {
    	<#assign var3><#compress><@factor.gv_keys c=false sep=","/></#compress></#assign>
    	final var ${entity.getInstanceName()} = find${entity.className}ByPrimaryKey.handle(${var3?trim?replace('\n','')?replace(',',', ')});
    	
    	return Response.ok(resourceUtils.${entity.getInstanceName()}Response(${entity.getInstanceName()})).status(Response.Status.OK).build();
  	}
  	
  	@POST
  	@Transactional
  	@Secured({Role.ADMIN, Role.USER})
  	@Consumes(MediaType.APPLICATION_JSON)
  	@Produces(MediaType.APPLICATION_JSON)
  	public Response create(
      		@Valid @NotNull(message = ValidationMessages.REQUEST_BODY_MUST_BE_NOT_NULL)
          	New${entity.className}Request new${entity.className}Request,
      		@Context SecurityContext securityContext) {
    <#--  //final var loggedUserId = resourceUtils.getLoggedUserId(securityContext);-->
    final var ${entity.getInstanceName()} = create${entity.className}.handle(new${entity.className}Request.toNew${entity.className}Input());
    return Response.ok(resourceUtils.${entity.getInstanceName()}Response(${entity.getInstanceName()}))  
        .status(Response.Status.CREATED)
        .build();
  	}
  	
  	@PUT
  	@Transactional
  	@Secured({Role.ADMIN, Role.USER})
  	@Consumes(MediaType.APPLICATION_JSON)
  	@Produces(MediaType.APPLICATION_JSON)
  	public Response update(
      		@Valid @NotNull Update${entity.className}Request update${entity.className}Request,
      		@Context SecurityContext securityContext) {
    	<#--//final var loggedUserId = resourceUtils.getLoggedUserId(securityContext);-->
    	final var updated${entity.className} =
        	update${entity.className}.handle(update${entity.className}Request.toUpdate${entity.className}Input());
    	return Response.ok(resourceUtils.${entity.getInstanceName()}Response(updated${entity.className}))
        	.status(Response.Status.OK)
        	.build();
  	}
  	
  	@DELETE
  	@Transactional
  	@Secured({Role.ADMIN, Role.USER})
  	@Produces(MediaType.APPLICATION_JSON)
  	<#assign var4><#compress><@factor.pmv_xxxresource_pk_queryparam/></#compress></#assign>
  	public Response delete(
		@Context SecurityContext securityContext ${var4?trim?replace('\n','')?replace(',',',\n\t\t\t')}) {
		
		<#--//final var loggedUserId = resourceUtils.getLoggedUserId(securityContext);-->
		<#assign var5><#compress><@factor.gv_keys c=false sep=","/></#compress></#assign>
		if (delete${entity.className}.handle(${var5?trim?replace('\n','')?replace(',',', ')})) {
			return Response.ok().build();
		} else {
			return Response.status(Response.Status.NOT_FOUND).build();
		}
	}


  
}
