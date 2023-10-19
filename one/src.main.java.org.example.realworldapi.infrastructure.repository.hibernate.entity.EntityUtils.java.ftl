<#import "/factor.ftl" as factor>
<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/entity/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|EntityUtils.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity;

import lombok.AllArgsConstructor;
<#list adv.entities as ent>
<#if ent.create>
import ${PUB_APP_GROUP}.realworldapi.domain.model.${ent.instanceName}.${ent.className};
import ${PUB_APP_GROUP}.realworldapi.domain.model.${ent.instanceName}.${ent.className}ModelBuilder;
</#if>
</#list>

import org.example.realworldapi.domain.model.user.User;
import org.example.realworldapi.domain.model.user.UserModelBuilder;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
@AllArgsConstructor
public class EntityUtils {
<#list adv.entities as ent>
<#if ent.create>
	private final ${ent.className}ModelBuilder ${ent.instanceName}Builder;
</#if>
</#list>
	private final UserModelBuilder userBuilder;

<#list adv.entities as ent>
<#if ent.create>
	public ${ent.className} ${ent.instanceName}(${ent.className}Entity ${ent.instanceName}Entity) {
    	return ${ent.instanceName}Builder.build(
        	<@factor.pmv_entityutils_xxx isIncludeChild=true isIncludeParent=true suffix="" entity=ent/> 
        );
	}
</#if>
</#list>

     public User user(UserEntity userEntity) {
	    final var id = userEntity.getId();
	    final var username = userEntity.getUsername();
	    final var bio = userEntity.getBio();
	    final var image = userEntity.getImage();
	    final var password = userEntity.getPassword();
	    final var email = userEntity.getEmail();
	    return userBuilder.build(id, username, bio, image, password, email);
 	 }

 
}
