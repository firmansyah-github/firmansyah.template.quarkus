<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/application/web/model/response/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|ErrorResponse.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
package org.example.realworldapi.application.web.model.response;

import com.fasterxml.jackson.annotation.JsonRootName;
import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedList;
import java.util.List;

@Getter
@Setter
@JsonRootName("errors")
@RegisterForReflection
public class ErrorResponse {

	private List<String> body;

	public ErrorResponse() {
		this.body = new LinkedList<>();
  	}

  	public ErrorResponse(String error) {
    	this();
    	this.body.add(error);
  	}

  	public ErrorResponse(List<String> errors) {
    	this.body = errors;
  	}
}
