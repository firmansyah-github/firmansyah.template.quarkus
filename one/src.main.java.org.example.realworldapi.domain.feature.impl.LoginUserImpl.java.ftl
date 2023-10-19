<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/feature/impl/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|LoginUserImpl.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.feature.impl;

import lombok.AllArgsConstructor;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.InvalidPasswordException;
import ${PUB_APP_GROUP}.realworldapi.domain.exception.UserNotFoundException;
import ${PUB_APP_GROUP}.realworldapi.domain.feature.LoginUser;
import ${PUB_APP_GROUP}.realworldapi.domain.model.provider.HashProvider;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.LoginUserInput;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.User;
import ${PUB_APP_GROUP}.realworldapi.domain.model.user.UserRepository;

@AllArgsConstructor
public class LoginUserImpl implements LoginUser {

	private final UserRepository userRepository;
	private final HashProvider hashProvider;

	@Override
	public User handle(LoginUserInput loginUserInput) {
		final var user = userRepository.findByEmail(loginUserInput.getEmail()).orElseThrow(UserNotFoundException::new);
		if (!isPasswordValid(loginUserInput.getPassword(), user.getPassword())) {
			throw new InvalidPasswordException();
		}
		return user;
	}

	private boolean isPasswordValid(String password, String hashedPassword) {
		return hashProvider.checkPassword(password, hashedPassword);
	}
}
