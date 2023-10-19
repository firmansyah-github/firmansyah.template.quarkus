<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/entity/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|many|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|[class]Entity.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.${entity.getInstanceName()}.${entity.className};
<@factor.pci_xxxentity/>

import javax.persistence.*;
import java.util.Objects;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "${entity.tableName?upper_case}")
public class ${entity.className}Entity {

	<@factor.pcv_xxxentity />

	public ${entity.className}Entity(${entity.className} ${entity.getInstanceName()} <@factor.gv_imps c=true preType="" 
				 sufType="Entity" 
				 preName="" 
				 sufName="Entity" sep=","/>) {
		<@factor.pmb_xxxentity_init/>
  	}
  	
  	public void update(${entity.className} ${entity.getInstanceName()} <@factor.gv_imps c=true preType="" 
				 sufType="Entity" 
				 preName="" 
				 sufName="Entity" sep=","/>){
  		<@factor.pmb_xxxentity_update/>
  	}

  

  	@Override
  	public boolean equals(Object o) {
		if (this == o) return true;

    	if (o == null || getClass() != o.getClass()) return false;

    	${entity.className}Entity that = (${entity.className}Entity) o;
    	return Objects.equals(<@factor.pmb_xxxentity_equals/>);
  	}

  	@Override
  	public int hashCode() {
		return Objects.hash(<@factor.pmb_xxxentity_hashcode/>);
  	}
}
