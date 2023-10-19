<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/validation/constraint/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|AtLeastOneFieldMustBeNotNull.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.validation.constraint;

import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.validation.validator.AtLeastOneFieldMustBeNotNullValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = AtLeastOneFieldMustBeNotNullValidator.class)
@Documented
public @interface AtLeastOneFieldMustBeNotNull {

    String message() default "At least one field must be not null";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    String[] fieldNames() default {};

}
