<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/impl/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|CreateUserImpl.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature.impl;

import lombok.AllArgsConstructor;

import java.util.UUID;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.EmailAlreadyExistsException;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.UsernameAlreadyExistsException;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.CreateUser;
import ${PUB_APP_GROUP}.realworldapi.domain.model.provider.HashProvider;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.NewUserInput;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.User;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.UserModelBuilder;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.UserRepository;


@AllArgsConstructor
public class CreateUserImpl implements CreateUser {

  	private final UserRepository userRepository;
	private final HashProvider hashProvider;
	private final UserModelBuilder userBuilder;

	@Override
	public User handle(NewUserInput newUserInput) {
		final var user = userBuilder.build(UUID.randomUUID(), newUserInput.getUsername(),
				newUserInput.getBio(), newUserInput.getImage(), newUserInput.getPassword(), newUserInput.getEmail());
		checkExistingUsername(user.getUsername());
		checkExistingEmail(user.getEmail());
		user.setPassword(hashProvider.hashPassword(user.getPassword()));
		userRepository.save(user);
		return user;
	}

	private void checkExistingUsername(String username) {
		if (userRepository.existsBy("username", username)) {
			throw new UsernameAlreadyExistsException();
		}
	}

	private void checkExistingEmail(String email) {
		if (userRepository.existsBy("email", email)) {
			throw new EmailAlreadyExistsException();
		}
	}
}
