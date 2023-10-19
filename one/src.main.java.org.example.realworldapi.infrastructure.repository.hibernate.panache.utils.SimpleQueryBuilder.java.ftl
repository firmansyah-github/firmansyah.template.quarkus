<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/repository/hibernate/panache/utils/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|SimpleQueryBuilder.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.panache.utils;

import java.util.LinkedList;
import java.util.List;

public class SimpleQueryBuilder {

    private List<String> queryStatements;
	private List<String> whereStatements;

	public SimpleQueryBuilder() {
		this.queryStatements = new LinkedList<>();
		this.whereStatements = new LinkedList<>();
	}

	public void addQueryStatement(String queryStatement) {
		this.queryStatements.add(queryStatement);
	}

	public void updateQueryStatementConditional(boolean updateCondition, String queryStatement, String whereStatement,
			Runnable afterAddStatements) {
		if (updateCondition) {
			queryStatements.add(queryStatement);
			whereStatements.add(whereStatement);
			afterAddStatements.run();
		}
	}

	public String toQueryString() {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append(String.join(" ", queryStatements));
		if (!whereStatements.isEmpty()) {
			queryBuilder.append(" where ");
			queryBuilder.append(String.join(" and ", whereStatements));
		}
		return queryBuilder.toString();
	}
}
