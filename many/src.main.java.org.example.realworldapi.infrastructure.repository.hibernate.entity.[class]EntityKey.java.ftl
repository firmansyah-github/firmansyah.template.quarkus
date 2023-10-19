<#if (entity.primaryKeyFieldList?size gt 1)>
<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/entity/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]EntityKey.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class ${entity.className}EntityKey implements Serializable {

	<@factor.pcv_xxxentitykey/>

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;

    	if (o == null || getClass() != o.getClass()) return false;

    	${entity.className}EntityKey that = (${entity.className}EntityKey) o;
    	return <@factor.pmb_xxxentitykey_equals/>;
  	}

  	@Override
  	public int hashCode() {
    	return Objects.hash(<@factor.pmb_xxxentity_hashcode/>);
  	}

}
</#if>