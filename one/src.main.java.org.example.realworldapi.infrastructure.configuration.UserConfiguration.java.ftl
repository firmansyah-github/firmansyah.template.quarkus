<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/configuration/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|UserConfiguration.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.configuration;

import org.example.realworldapi.domain.feature.*;
import org.example.realworldapi.domain.feature.impl.*;
import org.example.realworldapi.domain.model.provider.HashProvider;
import org.example.realworldapi.domain.model.user.UserModelBuilder;
import org.example.realworldapi.domain.model.user.UserRepository;
import org.example.realworldapi.domain.validator.ModelValidator;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;
import javax.inject.Singleton;
import javax.validation.Validator;

@Dependent
public class UserConfiguration {

	  @Produces
	  @Singleton
	  public CreateUser createUser(
	      UserRepository userRepository, HashProvider hashProvider, UserModelBuilder userBuilder) {
	    return new CreateUserImpl(userRepository, hashProvider, userBuilder);
	  }
	
	  @Produces
	  @Singleton
	  public UpdateUser updateUser(
	      FindUserById findUserById, UserRepository userRepository, ModelValidator modelValidator) {
	    return new UpdateUserImpl(findUserById, userRepository, modelValidator);
	  }
	
	  @Produces
	  @Singleton
	  public FindUserById findUserById(UserRepository userRepository) {
	    return new FindUserByIdImpl(userRepository);
	  }
	
	  @Produces
	  @Singleton
	  public LoginUser loginUser(UserRepository userRepository, HashProvider hashProvider) {
	    return new LoginUserImpl(userRepository, hashProvider);
	  }
	
	  @Produces
	  @Singleton
	  public FindUserByUsername findUserByUsername(UserRepository userRepository) {
	    return new FindUserByUsernameImpl(userRepository);
	  }
	
	
	  @Produces
	  @Singleton
	  public UserModelBuilder userModelBuilder(ModelValidator modelValidator) {
	    return new UserModelBuilder(modelValidator);
	  }

}
