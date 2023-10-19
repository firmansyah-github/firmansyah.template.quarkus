<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/impl/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|UpdateUserImpl.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature.impl;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.FindUserById;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.UpdateUser;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.EmailAlreadyExistsException;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.UsernameAlreadyExistsException;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.UpdateUserInput;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.User;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.UserRepository;
import ${PUB_APP_GROUP}.realworldapi.domain.validator.ModelValidator;

import java.util.UUID;

@AllArgsConstructor
public class UpdateUserImpl implements UpdateUser {

    private final FindUserById findUserById;
	private final UserRepository userRepository;
	private final ModelValidator modelValidator;

	@Override
	public User handle(UpdateUserInput updateUserInput) {
		final var user = findUserById.handle(updateUserInput.getId());
		checkValidations(updateUserInput, updateUserInput.getId());
		updateFields(user, updateUserInput);
		userRepository.update(modelValidator.validate(user));
		return user;
	}

	private void updateFields(User user, UpdateUserInput updateUserInput) {
		if (isPresent(updateUserInput.getUsername())) {
			user.setUsername(updateUserInput.getUsername());
		}

		if (isPresent(updateUserInput.getEmail())) {
			user.setEmail(updateUserInput.getEmail());
		}

		if (isPresent(updateUserInput.getBio())) {
			user.setBio(updateUserInput.getBio());
		}

		if (isPresent(updateUserInput.getImage())) {
			user.setImage(updateUserInput.getImage());
		}
	}

	private void checkValidations(UpdateUserInput updateUserInput, UUID excludeId) {

		if (isPresent(updateUserInput.getUsername())) {
			checkUsername(excludeId, updateUserInput.getUsername());
		}

		if (isPresent(updateUserInput.getEmail())) {
			checkEmail(excludeId, updateUserInput.getEmail());
		}
	}

	private boolean isPresent(String property) {
		return property != null && !property.isEmpty();
	}

	private void checkUsername(UUID selfId, String username) {
		if (userRepository.existsUsername(selfId, username)) {
			throw new UsernameAlreadyExistsException();
		}
	}

	private void checkEmail(UUID selfId, String email) {
		if (userRepository.existsEmail(selfId, email)) {
			throw new EmailAlreadyExistsException();
		}
	}
}
