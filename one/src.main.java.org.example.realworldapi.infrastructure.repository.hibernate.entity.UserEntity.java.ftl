<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/entity/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|UserEntity.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.User;

import javax.persistence.*;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "FGUSER")
public class UserEntity {

    @Id
	private UUID id;

	private String username;
	private String bio;
	private String image;
	private String password;
	private String email;

	public UserEntity(User user) {
		this.id = user.getId();
		update(user);
	}

	public void update(User user) {
		this.username = user.getUsername();
		this.bio = user.getBio();
		this.image = user.getImage();
		this.password = user.getPassword();
		this.email = user.getEmail();
	}
}
