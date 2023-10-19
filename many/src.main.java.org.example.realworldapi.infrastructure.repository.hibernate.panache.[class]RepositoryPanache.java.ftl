<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/panache/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]RepositoryPanache.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.panache;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;

import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.FilterCondition;
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.ResourceFilter;
import ${PUB_APP_GROUP}.realworldapi.application.web.resource.abs.SortCondition;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className}Repository;
import ${PUB_APP_GROUP}.realworldapi.domain.model.util.PageResult;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity.${entity.className}Entity;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity.EntityUtils;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.panache.utils.SimpleQueryBuilder;
<@factor.pci_xxxrepositorypanache/>

import java.time.LocalDateTime;

import io.quarkus.hibernate.orm.panache.PanacheQuery;
import io.quarkus.panache.common.Parameters;
import io.quarkus.panache.common.Sort;
import lombok.AllArgsConstructor;

@ApplicationScoped
@AllArgsConstructor
public class ${entity.className}RepositoryPanache extends AbstractPanacheRepository<${entity.className}Entity <@factor.pc_xxxrepositorypanache/>>
    implements ${entity.className}Repository {

  	private final EntityUtils entityUtils;

  	@Override
  	public void save(${entity.className} ${entity.getInstanceName()}) {
		<@factor.pmb_xxxrepositorypanache_save/>
  	}

	<@factor.pm_xxxrepositorypanache_findxxxbyprimarykey/>


  	@Override
  	public void update(${entity.className} ${entity.getInstanceName()}) {
  		<@factor.pmb_xxxrepositorypanache_update/>
    }

  
  	@Override
  	public boolean delete(<@factor.gv_keys sep="," c=true/>) {
    	<@factor.pmb_xxxrepositorypanache_delete/>
  	}

    <#-- 
  	@Override
  	public PageResult<${entity.className}> find${entity.className}ByFilter(${entity.className}Filter filter) {
    	Map<String, Object> params = new LinkedHashMap<>();
    	SimpleQueryBuilder find${entity.className}QueryBuilder = new SimpleQueryBuilder();
    	find${entity.className}QueryBuilder.addQueryStatement("select ${entity.getInstanceName()} from ${entity.className}Entity as ${entity.getInstanceName()}");
    
    	final var ${entity.getInstanceName()}Entity =
        	find(
                	find${entity.className}QueryBuilder.toQueryString(),
                	Sort.descending("createdAt").and("updatedAt").descending(),
                	params)
            		.page(Page.of(filter.getOffset(), filter.getLimit()))
            		.list();
    	final var ${entity.getInstanceName()}Result =
        	${entity.getInstanceName()}Entity.stream().map(entityUtils::${entity.getInstanceName()}).collect(Collectors.toList());
    	final var total = count${entity.className}();
    	return new PageResult<>(${entity.getInstanceName()}Result, total);
  	} -->
  	@Override
  	public PageResult<${entity.className}> find${entity.className}ByFilter(ResourceFilter filter) {
    	// Create a Parameters object
        Parameters params = new Parameters();

        // Build the query condition string and parameterize the fields
        StringBuilder queryCondition = new StringBuilder();
        int fieldIndex = 1;
        for (FilterCondition field : filter.getFilterConditions()) {
            String paramName = "value" + fieldIndex;
            queryCondition.append(field.getFieldSQL()).append(" ").append(field.getOperatorSQL())
                         .append(" :").append(paramName).append(" ")
                         .append(field.getConjunction().toString()).append(" ");
            if(field.getValue().matches("^(\\d{4}-\\d{2}-\\d{2})T(\\d{2}:\\d{2}:\\d{2}.\\d{6})$")) {
            	LocalDateTime dateTime = LocalDateTime.parse(field.getValue());
            	params.and(paramName, dateTime);
            } else {
            	params.and(paramName, field.getValue());
            }
            fieldIndex++;
        }
        
        PanacheQuery<${entity.className}Entity> queryBuilder = null;

        // Apply sorting
        Sort sort = null;
        for (SortCondition field : filter.getSortConditions()) {
            String sortField = field.getFieldSQL();
            Sort.Direction sortDirection = field.isDescending()?Sort.Direction.Descending:Sort.Direction.Ascending;
            if (sort == null) {
                sort = Sort.by(sortField, sortDirection);
            } else {
                sort.and(sortField, sortDirection);
            }
        }
        if (!queryCondition.toString().isEmpty() && sort != null) {
            queryBuilder = find(queryCondition.toString(), sort, params);
        }
        
        if (!queryCondition.toString().isEmpty() && sort == null) {
        	queryBuilder = find(queryCondition.toString(), params);
        } 
        
        if (queryCondition.toString().isEmpty() && sort != null) {
            queryBuilder = findAll(sort);
        }
        
        if (queryCondition.toString().isEmpty() && sort == null) {
        	queryBuilder = findAll();
        }

        // Apply pagination
        queryBuilder.page(filter.getOffset(), filter.getLimit());

        // Execute the query
        final var ${entity.getInstanceName()}Result = queryBuilder.list().stream()
        		                   .map(entityUtils::${entity.getInstanceName()})
        		                   .collect(Collectors.toList());
  		
    	final var total = ${entity.getInstanceName()}Result.size();
    	return new PageResult<>(${entity.getInstanceName()}Result, total);
  	}

  	@Override
  	public long count${entity.className}() {
    	Map<String, Object> params = new LinkedHashMap<>();
    	SimpleQueryBuilder count${entity.className}QueryBuilder = new SimpleQueryBuilder();
    	count${entity.className}QueryBuilder.addQueryStatement("from ${entity.className}Entity as ${entity.getInstanceName()}");
    
    	return count(count${entity.className}QueryBuilder.toQueryString(), params);
  	}
}
