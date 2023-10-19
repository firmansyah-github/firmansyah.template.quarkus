<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/model/constants/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|ValidationMessages.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.model.constants;

public class ValidationMessages {
  
	public static final String REQUEST_BODY_MUST_BE_NOT_NULL = "request body must be not null";
  	public static final String USERNAME_MUST_BE_NOT_BLANK = "username must be not blank";
  	public static final String EMAIL_MUST_BE_NOT_BLANK = "email must be not blank";
  	public static final String PASSWORD_MUST_BE_NOT_BLANK = "password must be not blank";  
  	public static final String BODY_MUST_BE_NOT_BLANK = "body must not be blank";
  
  	public static final String USER_ID_MUST_BE_NOT_BLANK = "id of USER must not be blank";
  	public static final String USER_ID_MAX_LENGTH = "id of USER must not be greater than 2,147,483,647";
 
  	public static final String USER_BIO_MAX_LENGTH = "bio of USER must not be greater than 255";
 
  	public static final String USER_EMAIL_MAX_LENGTH = "email of USER must not be greater than 255";
 
  	public static final String USER_IMAGE_MAX_LENGTH = "image of USER must not be greater than 255";
 
  	public static final String USER_PASSWORD_MAX_LENGTH = "password of USER must not be greater than 255";
 
  	public static final String USER_USERNAME_MAX_LENGTH = "username of USER must not be greater than 255";
  	<#list adv.entities as ent  >
  	<#list ent.fieldList as fld>
		<#if fld.create>
			<#if !fld.nullable>
  	public static final String ${ent.className?upper_case}_${fld.fieldName?upper_case}_MUST_BE_NOT_BLANK = "${fld.fieldName} of ${ent.className} must not be blank";
			</#if>
			<#if fld.columnSize gt 0>
  	public static final String ${ent.className?upper_case}_${fld.fieldName?upper_case}_MAX_LENGTH = "${fld.fieldName} of ${ent.className} must not be greater than ${fld.columnSize}";
			</#if>		
 
		</#if>
  	</#list>
  	</#list> 
}
