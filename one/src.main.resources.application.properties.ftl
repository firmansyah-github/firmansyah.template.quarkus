<#-- 
${PRV_SYS_GEN_PATH|src/main/resources/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|application.properties|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_ROOT|/api|Description}
${PUB_DB_TYPE|postgresql|Description}
${PUB_APP_IP|localhost|Description}
${PUB_DB_IP|localhost|Description}
${PUB_DB_PORT|5432|Description}
${PUB_DB_USER|postgres|Description}
${PUB_DB_NAME|postgres|Description}
${PUB_DB_PASS|xWmGrW0hi4|Description}
${PUB_APP_PKG|realworld-api-quarkus|Description}
-->
quarkus.resteasy.path=${PUB_APP_ROOT}
quarkus.http.port=${PUB_APP_PORT}

# Database configuration
quarkus.datasource.db-kind=${PUB_DB_TYPE}
quarkus.datasource.username=<#noparse>${</#noparse>DB_USER:${PUB_DB_USER}}
quarkus.datasource.password=<#noparse>${</#noparse>DB_PASSWORD:${PUB_DB_PASS}}

<#switch PUB_DB_TYPE>
	<#case 'db2'>
quarkus.datasource.jdbc.url=<#noparse>${</#noparse>DB_URL:jdbc:${PUB_DB_TYPE}://${PUB_DB_IP}:${PUB_DB_PORT}/${PUB_DB_NAME}:user=${PUB_DB_USER};password=${PUB_DB_PASS};}
quarkus.datasource.jdbc.driver=com.ibm.db2.jcc.DB2Driver
      <#break>
	<#case 'postgresql'>
#5432
quarkus.datasource.jdbc.url=<#noparse>${</#noparse>DB_URL:jdbc:${PUB_DB_TYPE}://${PUB_DB_IP}:${PUB_DB_PORT}/${PUB_DB_NAME}}
quarkus.datasource.jdbc.driver=org.${PUB_DB_TYPE}.Driver
      <#break>
	<#case 'oracle'>
#1521
quarkus.datasource.jdbc.url=<#noparse>${</#noparse>DB_URL:jdbc:${PUB_DB_TYPE}:thin:@${PUB_DB_IP}:${PUB_DB_PORT}:${PUB_DB_NAME}}
quarkus.datasource.jdbc.driver=oracle.jdbc.OracleDriver
       <#break>
	<#case 'sqlserver'>
#1433
quarkus.datasource.jdbc.url=<#noparse>${</#noparse>DB_URL:jdbc:${PUB_DB_TYPE}://${PUB_DB_IP}:${PUB_DB_PORT};databaseName=${PUB_DB_NAME}}
quarkus.datasource.jdbc.driver=com.microsoft.${PUB_DB_TYPE}.jdbc.SQLServerDriver
       <#break>
	<#case 'mysql'>
#3306
quarkus.datasource.jdbc.url=<#noparse>${</#noparse>DB_URL:jdbc:${PUB_DB_TYPE}://${PUB_DB_IP}:${PUB_DB_PORT}/${PUB_DB_NAME}}
quarkus.datasource.jdbc.driver=com.${PUB_DB_TYPE}.cj.jdbc.Driver
</#switch>

quarkus.hibernate-orm.jdbc.statement-batch-size=100
quarkus.hibernate-orm.database.generation=drop-and-create
quarkus.package.output-name=${PUB_APP_PKG}

# For native-image
quarkus.native.additional-build-args=-H:ResourceConfigurationFiles=resources-config.json
#quarkus.log.level=DEBUG
#quarkus.hibernate-orm.log.sql=true
jwt.issuer=users-service
jwt.secret=secret123
jwt.expiration.time.minutes=10
