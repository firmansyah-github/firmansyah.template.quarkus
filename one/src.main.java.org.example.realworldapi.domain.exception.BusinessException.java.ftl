<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/domain/exception/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|BusinessException.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.domain.exception;

import lombok.Data;

import java.util.LinkedList;
import java.util.List;

import static java.util.Collections.singletonList;

@Data
public class BusinessException extends RuntimeException {

    private final int code;
	private final List<String> messages;

	public BusinessException(int code, String message) {
		super(message);
		this.code = code;
		this.messages = new LinkedList<>(singletonList(message));
	}

	public BusinessException(int code, List<String> messages) {
		super(String.join(", ", messages));
		this.code = code;
		this.messages = messages;
	}
}