<#-- 
g=global
p=private
c=class
f=field
i=import
v=variable (field class or field method)
m=method
def=definition (type and name)
pk=primary key
fk=foreign key
-->
<#macro INS>${entity.instanceName}</#macro>
<#assign INT><@INS/></#assign>


<#-- 1. global variable generic: fieldType fieldName -->
<#macro gv f c=false
			 preType="" 
			 sufType="" 
			 preName="" 
			 sufName="" 
			 unCapName=true>
	<#assign vName>${f.fieldName}</#assign>
	<#if unCapName><#assign vName=vName?uncap_first/><#else><#assign vName=vName?cap_first/></#if>
	<#if c>${preType}${f.simpleFieldType}${sufType}</#if> ${preName}${vName}${sufName}
</#macro>


<#-- 2. global variable importKey: fieldType fieldName -->
<#macro gv_imp i c=false
				 preType="" 
				 sufType="" 
				 preName="" 
				 sufName="" 
				 unCapName=true>
		<#assign vName>${i.pkBaseName?uncap_first}${columnToField(i.fkColumnName)}</#assign>
		<#if unCapName><#assign vName=vName?uncap_first/><#else><#assign vName=vName?cap_first/></#if>
		<#if c>${preType}${i.pkBaseName?cap_first}${sufType}</#if> ${preName}${vName}${sufName}
</#macro>



<#macro gv_imps preType="" 
				sufType="" 
				preName="" 
				sufName="" 
				c=false 
				unCapName=true 
				isFirstVar=false 
				sep="">
	<#assign im>
	<#compress>			
	<#list entity.importedKeys as i>
		<#if i?is_first && !isFirstVar>${sep}</#if>
	<@gv_imp i=i c=c unCapName=unCapName
		             preType="${preType}" 
				     sufType="${sufType}" 
				     preName="${preName}" 
				     sufName="${sufName}"/><#sep>${sep}
	</#list>
	</#compress>
	</#assign>
${im?trim?replace('\n','')}</#macro>


<#-- 3. global variable exportKey: fieldType fieldName -->
<#macro gv_exp e c=false
				 preType="" 
				 sufType="" 
				 preName="" 
				 sufName="" 
				 unCapName=false>
	<#assign X>${e.fkBaseName?uncap_first}${columnToField(e.fkColumnName)}</#assign>
	<#if preName?has_content><#assign X=X?cap_first/></#if>
	<#if unCapName><#assign X=X?uncap_first/></#if>
	<#if c>${preType}${e.fkBaseName?cap_first}${sufType}</#if> ${preName}${X}${sufName}
</#macro>



<#macro gv_exps preType="" 
				sufType="" 
				preName="" 
				sufName="" 
				c=false 
				unCapName=false 
				isFirstVar=false 
				sep=""
				isFindFKType=false
				modifier="">
	<#assign ex>
	<#compress>
	<#list entity.exportedKeys as e>
		<#if e?is_first && !isFirstVar>${sep}</#if>
		<#assign fkType>
			<#compress>
				<#if isFindFKType>${findDataType(e.fkTableName, e.fkColumnName)}
				<#else>${preType}${e.fkBaseName?cap_first}${sufType}
				</#if>
			</#compress>
		</#assign>
		<#assign preNM><#if c>${modifier} List<${fkType}> ${preName}<#else>${preName}</#if></#assign>
		<@gv_exp e=e c=false unCapName=unCapName 
				     preName="${preNM}" 
				     sufName="${sufName}"/><#sep>${sep}
	</#list>
	</#compress>
	</#assign>
	${ex?trim?replace('\n','')}
</#macro>



<#macro gv_keys preType="" 
				sufType="" 
				preName="" 
				sufName="" 
				c=false 
				unCapName=true 
				isFirstVar=true 
				sep="">
	<#assign ky>
	<#compress>
	<#list entity.primaryKeyFieldList as k>
		<#if k?is_first && !isFirstVar>${sep}</#if>
        <#if k.create >
			<@gv f=k c=c unCapName=unCapName
		             preType="${preType}" 
				     sufType="${sufType}" 
				     preName="${preName}" 
				     sufName="${sufName}"/>
		</#if>
		<#sep>${sep}		     
	</#list>
	</#compress>
	</#assign>
${ky?trim?replace('\n','')}</#macro>


<#-- 4. global class import -->
<#macro gci isIncludeValid=false 
            isIncludeParent=false 
            isIncludeChild=false 
            suffix="" 
            suffixChild="" 
            isJsonFormat=false>
            
	<#if isIncludeValid>
import org.example.realworldapi.domain.model.constants.ValidationMessages;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
		<#if isJsonFormat>
		<#assign isFound=false>
			<#list entity.fieldListSortByOrdinalPosition as fld>
 				<#if fld.create && (fld.fieldType == 'java.time.LocalDateTime') && (!isFound)>				
import com.fasterxml.jackson.annotation.JsonFormat;
					<#assign isFound=true>
 				</#if>
			</#list>
		</#if>
	</#if>

	<#list entity.getImportDeclarations() as impt>
${impt}
	</#list>

	<#if isIncludeChild>
		<#list entity.exportedKeys as e>
import ${PUB_APP_GROUP}.realworldapi.domain.model.${e.fkBaseName?uncap_first}.${e.fkBaseName?cap_first}${suffixChild};
		</#list>
		<#if entity.exportedKeys?size gt 0 >
import java.util.List;
import java.util.stream.Collectors;
		</#if>
	</#if>

	<#if isIncludeParent>
		<#list entity.importedKeys as i>
import ${PUB_APP_GROUP}.realworldapi.domain.model.${i.pkBaseName?uncap_first}.${i.pkBaseName?cap_first}${suffix};
		</#list>
	</#if>
</#macro>


<#-- 5. global class attributes/fields -->
<#macro gcv isIncludeValid=false 
			isIncludeParent=false 
		    isIncludeChild=false 
			isJsonFormatDate=false 
			suffix="" 
			isFindDataType=false 
			suffixChild="">
	<#if isIncludeParent>
		<#assign fields = entity.fieldListExceptForeignKey >
		<#else>
		<#assign fields = entity.fieldListSortByOrdinalPosition >
	</#if>
	<#--  fields -->
	<#list fields as fld>
		<#if fld.create >
	    	<#if isIncludeValid>
          		<#if !fld.nullable>
	@NotBlank(message = ValidationMessages.${entity.className?upper_case}_${fld.fieldName?upper_case}_MUST_BE_NOT_BLANK)
		  		</#if>
		  	<#if fld.columnSize gt 0 && fld.fieldType != 'java.time.LocalDateTime'>
	@Size(message = ValidationMessages.${entity.className?upper_case}_${fld.fieldName?upper_case}_MAX_LENGTH, max = ${fld.columnSize?string["0"]})
          	</#if>
       		</#if>
			<#if isJsonFormatDate>
       			<#if fld.fieldType == 'java.time.LocalDateTime'>				
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS")
	   			</#if>
	   		</#if>			
	<@gv f=fld c=true preType="private " sufName=";"/>
		</#if>
	</#list>
	<#--  exps -->
	<#if isIncludeChild>
	<#assign ex1><#compress><@gv_exps c=true 
		          isFindFKType=isFindDataType 
		          sufType="${suffixChild}"
		          sufName="${suffixChild}List;" 
		          modifier="private" unCapName=true/></#compress></#assign>
	${ex1?trim?replace('\n','')?replace(';',';\n\t')}
	</#if>
    <#--  imps -->
	<#if isIncludeParent>
	<#assign im1><#compress><@gv_imps c=true 
		          preType="private " 
				  sufType="${suffix}" 
				  preName="" 
				  sufName="${suffix};"/></#compress></#assign>
	${im1?trim?replace('\n','')?replace(';',';\n\t')}
	</#if>
</#macro>



<#macro gmv isIncludeEntity=false 
				isIncludeParent=false 
				isIncludeChild=false 
				suffix="" 
				suffixChild=""
				c=true
				this="">
	<#if isIncludeParent>
		<#assign fields = entity.fieldListExceptForeignKey >
	<#else>
		<#assign fields = entity.fieldListSortByOrdinalPosition >
	</#if>
	<#--  entity/fields -->
	<#assign mv>
	<#compress>
	<#if isIncludeEntity>
		<#if c>${entity.className}</#if> <@INS/>
	<#else>
		<#list fields as fld>
			<#if fld.create>${this}<#compress><@gv f=fld c=c/></#compress><#sep>, </#if>
		</#list>
	</#if>
	<#--  exps -->
	<#if isIncludeChild>
		<#assign isFirstVar = !((fields?size gt 0) || isIncludeEntity)/>
		<@gv_exps c=c 
		          isFirstVar=isFirstVar 
		          sep="," 
		          sufName="${suffix}List" 
		          sufType="${suffixChild}" 
		          preName="${this}"
		          unCapName=true/>
	</#if>
	<#--  imps -->
	<#if isIncludeParent>
		<#assign isFirstVar = !((entity.exportedKeys?size gt 0) || (fields?size gt 0) || isIncludeEntity)/>
		<@gv_imps c=c 
		          isFirstVar=isFirstVar 
		          sep="," 
		          sufType="${suffix}" 
		          sufName="${suffix}"
		          preName="${this}" />
	</#if>
	</#compress>
	</#assign>
${mv?trim?replace('\n','')?replace(',',', ')}</#macro>


<#macro pmb_xxxresponse_response isIncludeEntity=false 
								isIncludeParent=false 
								isIncludeChild=false 
								suffix="" 
								suffixChild="" 
								isExceptForeignKey=false>
								
	<#if isIncludeParent || isExceptForeignKey>
		<#assign fields = entity.fieldListExceptForeignKey >
	<#else>
		<#assign fields = entity.fieldListSortByOrdinalPosition >
	</#if>
	<#-- fields -->
	<#if isIncludeEntity>
		<#list fields as fld>
			<#if fld.create>
		this.${fld.fieldName} = <@INS/>.${fld.getterMethodName}();
			</#if>
		</#list>
	</#if>   
	<#-- fields exports-->
	<#if isIncludeChild>     
		<#list entity.exportedKeys as e>
		this.<@gv_exp e=e sufName="${suffixChild}List"/> = 
			 <@gv_exp e=e sufName="${suffixChild}List"/>.stream().map(
					${e.fkBaseName?cap_first}${suffixChild}::get${columnToField(e.fkColumnName)}
				).collect(Collectors.toList());
		</#list>
	</#if>
	<#-- fields imports-->
	<#if isIncludeParent>
	    <#assign im>
	    	<#compress>
	    		<#list entity.importedKeys as i>
					<@gv_imp i=i preName="this." sufName="${suffix} = "/> <@gv_imp i=i sufName="${suffix};" />
				</#list>
			</#compress>
		</#assign>
		${im?trim?replace('\n','')?replace(';',';\n\t\t')}
	</#if> 
</#macro>


<#-- CreateXXXImpl_Builder -->
<#macro pmv_crudxxximpl_builder suffix="new">
	<#list entity.fieldListExceptForeignKey as fld>
		<#if fld.create>
			${suffix}${entity.className}Input.get${fld.fieldName?cap_first}()<#sep>,
		</#if>
	</#list> 
	<#if (entity.exportedKeys?size gt 0) && (entity.fieldListExceptForeignKey?size gt 0) >,</#if>
	<#list entity.exportedKeys as e>null<#sep>,</#list>
			
	<#if (entity.importedKeys?size gt 0) && ((entity.exportedKeys?size gt 0) || 
		 (entity.fieldListExceptForeignKey?size gt 0)) >,</#if>
	<#list entity.importedKeys as i>
			<@gv_imp i=i preName="find" sufName="ByPrimaryKey" unCapName=false/>
				.handle(${suffix}${entity.className}Input
				.get${columnToField(i.fkColumnName)}())<#sep>,
 	</#list>
</#macro>



<#macro pmv_xxxresource_pk_queryparam>
    <#list entity.primaryKeyFieldList as fld>
			<#if fld?is_first>,</#if>@QueryParam("${fld.fieldName?uncap_first}") <@gv f=fld c=true/><#sep>, 
	</#list>
</#macro>



<#macro pmb_xxxresource_find >
	<#assign fields = entity.fieldListSortByOrdinalPosition />
    <#list fields as fld>
				<#if fld?is_first>,</#if>
				<#if fld.create>new${entity.className}Request.get${fld.fieldName?cap_first}()<#sep>,</#if>
	</#list>
</#macro>



<#macro pmb_xxxresourceutils_xxxresponse>
	<#list entity.importedKeys as i>
		<#compress><@gv_imp i=i preName="final var "/></#compress> = 
			<@gv_imp i=i c=false preName="find" sufName="ByPrimaryKey" unCapName=false/>
			.handle(<@INS/>.<@gv_imp i=i unCapName=false preName="get"/>()
					.get${columnToField(i.pkColumnName)}()
					);
	</#list>
		final var <@INS/>Response = new ${entity.className}Response(
			<@gmv c=false isIncludeEntity=true isIncludeParent=false isIncludeChild=false suffix=""/>
            <#list entity.importedKeys as i>
				<#if i?is_first>,</#if>new ${i.pkBaseName?cap_first}Response(true, <@gv_imp c=false i=i/>)<#sep>,
			</#list>
					);
</#macro>



<#macro pci_xxxentity>
	<#list entity.getImportDeclarations() as impt>
${impt}
	</#list>
	<#if entity.exportedKeys?size gt 0 >
import java.util.List;
	</#if>
	<#list entity.fieldListSortByOrdinalPosition  as fld>
		<#if fld.create && fld.pkPosition == 0 && fld.fieldType == 'java.time.LocalDateTime' && 
			 fld.fieldName?contains('create')>
import org.hibernate.annotations.CreationTimestamp;
		</#if> 
		<#if fld.create && fld.pkPosition == 0 && fld.fieldType == 'java.time.LocalDateTime' && 
			 fld.fieldName?contains('update')>
import org.hibernate.annotations.UpdateTimestamp;
		</#if>
	</#list>
</#macro>



<#macro pcv_xxxentity>
	<#if entity.primaryKeyFieldList?size gt 1>
	@EmbeddedId 
	private ${entity.className}EntityKey primaryKey;
	</#if>	
	<#list entity.fieldListSortByOrdinalPosition  as fld>
		<#if entity.primaryKeyFieldList?size == 1 && fld.pkPosition gt 0 && fld.create>
	@Id
		</#if>
		<#if fld.create && fld.pkPosition == 0 && fld.fieldType == 'java.time.LocalDateTime' && 
		     fld.fieldName?contains('create')>
	@CreationTimestamp
		</#if> 
		<#if fld.create && fld.pkPosition == 0 && fld.fieldType == 'java.time.LocalDateTime' && 
		     fld.fieldName?contains('update')>
	@UpdateTimestamp
		</#if>
		<#if fld.create  && (!isImportedKey(fld.columnName)!false) && (entity.primaryKeyFieldList?size lt 2)>
	<@gv f=fld c=true preType="private " sufName=";"/>
		</#if>
		<#if fld.create  && (!isImportedKey(fld.columnName)!false) && (entity.primaryKeyFieldList?size gt 1) && 
		    (fld.pkPosition == 0)>
	<@gv f=fld c=true preType="private " sufName=";"/>
		</#if>
		<#if fld.create  && isImportedKey(fld.columnName)!false>
			<#list entity.importedKeys as i>
				<#if fld.columnName == i.fkColumnName>
	@ManyToOne
					<#if fld.pkPosition == 0>
	@JoinColumn(name = "${i.fkColumnName}", referencedColumnName = "${i.pkColumnName}", nullable = ${fld.nullable?c})
					</#if>
					<#if fld.pkPosition gt 0>
	@JoinColumn(name = "${i.fkColumnName}", referencedColumnName = "${i.pkColumnName}", insertable = false, updatable = false)
					</#if>
    <#assign im>
    <#compress>
    <@gv_imp i=i c=true 
	             preType="private " 
	             sufType="Entity" 
	             sufName=";"/>
	</#compress>
	</#assign>
	${im?trim}
				</#if>
			</#list>
		</#if>
	</#list>
	<#list entity.exportedKeys as e>
	@OneToMany(mappedBy = "<@INS/>${columnToField(e.fkColumnName)}", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<${e.fkBaseName?cap_first}Entity> <#compress><@gv_exp e=e sufName="EntityList;"/></#compress>
	</#list>
</#macro>



<#macro pmb_xxxentity_equals>
	<#compress>
		<#list entity.fieldListSortByOrdinalPosition as fld>
			<#if entity.primaryKeyFieldList?size == 1 && fld.pkPosition gt 0>
${fld.fieldName},  that.${fld.fieldName}
			<#elseif entity.primaryKeyFieldList?size gt 1 && fld.pkPosition == 1>
primaryKey,  that.primaryKey
			</#if>
		</#list>
	</#compress>
</#macro>



<#macro pmb_xxxentity_hashcode>
	<#compress>
		<#list entity.fieldListSortByOrdinalPosition as fld>
			<#if entity.primaryKeyFieldList?size == 1 && fld.pkPosition gt 0>
${fld.fieldName}
			<#elseif entity.primaryKeyFieldList?size gt 1 && fld.pkPosition == 1>
primaryKey
			</#if>
		</#list>
	</#compress>
</#macro>



<#macro pmb_xxxentity_init>
    <#assign init>
    <#compress>
	<#if entity.primaryKeyFieldList?size gt 1>
		final var <@INS/>EntityKey = new ${entity.className}EntityKey();
		<#list entity.primaryKeyFieldList as pkField>
			<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
		<@INS/>EntityKey.set${pkField.fieldName?cap_first}(<@INS/>
			.${pkField.getterMethodName}());
			</#if>
			<#if pkField.create  && isImportedKey(pkField.columnName)!false>
				<#list entity.importedKeys as i>
					<#if pkField.columnName == i.fkColumnName>
		<@gv_imp i=i unCapName=false preName="${INT}EntityKey.set"/>(
			<@gv_imp i=i sufName="Entity"/>);
					</#if>
				</#list>
			</#if>
		</#list>
		this.primaryKey = <@INS/>EntityKey;
	</#if>
	<#list entity.fieldListSortByOrdinalPosition  as fld>
		<#if fld.create  && (!isImportedKey(fld.columnName)!false)  && (fld.pkPosition gt 0) && 
		     (entity.primaryKeyFieldList?size == 1)>
		this.${fld.fieldName} = <@INS/>.${fld.getterMethodName}();
		</#if>
	</#list>
		update(<@INS/> <@gv_imps c=false sufName="Entity" sep=","/>);
	</#compress>
	</#assign>
		${init?trim?replace('\n','')?replace(';',';\n\t\t')?replace('. ','.')}
</#macro>



<#macro pmb_xxxentity_update>
	<#assign init>
    <#compress>
    <#list entity.fieldListSortByOrdinalPosition  as fld>
		<#if fld.create  && (!isImportedKey(fld.columnName)!false) && (fld.pkPosition == 0)>
		this.${fld.fieldName} = <@INS/>.${fld.getterMethodName}();
		</#if>
		<#if fld.create  && isImportedKey(fld.columnName)!false>
			<#list entity.importedKeys as i>
				<#if fld.columnName == i.fkColumnName>
			<@gv_imp i=i c=false
				 preType="" 
				 sufType="" 
				 preName="this." 
				 sufName=" = "/> 
				 
			<@gv_imp i=i c=false
				 preType="" 
				 sufType="" 
				 preName="" 
				 sufName="Entity;"/>
				</#if>
			</#list>
		</#if>
	</#list>
	</#compress>
	</#assign>
		${init?trim?replace('\n','')?replace(';',';\n\t\t')}
</#macro>



<#macro pcv_xxxentitykey>
	<#list entity.primaryKeyFieldList as pkField>
		<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
	<@gv f=pkField c=true preType="private " sufName=";"/>
		</#if>
		<#if pkField.create  && isImportedKey(pkField.columnName)!false>
			<#list entity.importedKeys as i>
				<#if pkField.columnName == i.fkColumnName>
    @ManyToOne 
    @JoinColumn(name = "${i.fkColumnName}", referencedColumnName = "${i.pkColumnName}")
    private <#assign var><@gv_imp i=i c=true preType="" sufType="Entity" sufName=";"/></#assign>${var?trim}
				</#if>
			</#list>
		</#if>
	</#list>
</#macro>



<#macro pmb_xxxentitykey_equals>
	<#assign eqs>
	<#compress>
	<#list entity.primaryKeyFieldList as pkField>
		<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
			Objects.equals(${pkField.fieldName}, that.${pkField.fieldName}) 
		</#if>
		<#if pkField.create  && isImportedKey(pkField.columnName)!false>
			<#list entity.importedKeys as i>
				<#if pkField.columnName == i.fkColumnName>
				<#assign var><#compress><@gv_imp i=i/></#compress></#assign>
			Objects.equals(${var?trim}, that.${var?trim})
					</#if>
			</#list>
		</#if>
			<#sep>&&
	</#list>
	</#compress>
	</#assign>
${eqs?trim?replace('\n','')?replace('&&',' && ')}</#macro>



<#macro pmb_xxxentity_hashcode>
	<#assign var>
	<#compress>
	<#list entity.primaryKeyFieldList as pkField>
		<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
			${pkField.fieldName}
		</#if>
		<#if pkField.create  && isImportedKey(pkField.columnName)!false>
			<#list entity.importedKeys as i>
				<#if pkField.columnName == i.fkColumnName>
			<@gv_imp i=i/>
				</#if>
			</#list>
		</#if>
			<#sep>,
	</#list>
	</#compress>
	</#assign>
${var?trim?replace('\n','')?replace(',',', ')}</#macro>



<#macro pc_xxxrepositorypanache>
	<#if entity.primaryKeyFieldList?size == 1>
		<#compress>
			<#list entity.primaryKeyFieldList as fld>, ${fld.simpleFieldType}
			</#list>
		</#compress>
	<#elseif entity.primaryKeyFieldList?size gt 1>
		<#compress>, Find${entity.className}ByPrimaryKey
		</#compress>
	</#if>
</#macro>



<#macro pci_xxxrepositorypanache>
	<#if entity.primaryKeyFieldList?size == 1>
		<#list entity.primaryKeyFieldList as fld>
import ${fld.fieldType};
		</#list>
	<#elseif entity.primaryKeyFieldList?size gt 1>
import ${PUB_APP_GROUP}.realworldapi.domain.feature.Find${entity.className}ByPrimaryKey;
import ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity.${entity.className}EntityKey;
	</#if>
	<#list entity.importedKeys as i>
import ${PUB_APP_GROUP}.realworldapi.infrastructure.repository.hibernate.entity.${i.pkBaseName?cap_first}Entity;
	</#list>
</#macro>



<#macro pm_xxxrepositorypanache_findxxxbyprimarykey>
	@Override
	<#if entity.primaryKeyFieldList?size == 1>
		<#list entity.primaryKeyFieldList as fld>
	public Optional<${entity.className}> find${entity.className}ByPrimaryKey(<@gv_keys c=true sep=","/>) {
		return findByIdOptional(<@gv_keys c=false sep=","/>).map(entityUtils::<@INS/>);
	}
		</#list>
	<#elseif entity.primaryKeyFieldList?size gt 1>
	public Optional<${entity.className}> find${entity.className}ByPrimaryKey(<@gv_keys c=true sep=","/>) {
	    <#assign fpk>
        <#compress>
		final var <@INS/>EntityKey = new ${entity.className}EntityKey();
		<#list entity.primaryKeyFieldList as pkField>
			<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
		<@INS/>EntityKey.set${pkField.fieldName?cap_first}(${pkField.fieldName?uncap_first});
			</#if>
			<#if pkField.create  && isImportedKey(pkField.columnName)!false>
				<#list entity.importedKeys as i>
					<#if pkField.columnName == i.fkColumnName>
		<@INS/>EntityKey.<@gv_imp i=i unCapName=false preName="set"/>(
			getEntityManager().find(${i.pkBaseName?cap_first}Entity.class, 
				${columnToField(i.fkColumnName)?uncap_first})
			);
					</#if>
				</#list>
			</#if>
		</#list>
		return Optional.ofNullable(getEntityManager().find(${entity.className}Entity.class, 
			<@INS/>EntityKey)).map(entityUtils::<@INS/>);
		</#compress>
		</#assign>
		${fpk?trim?replace('\n','')?replace(';',';\n\t\t')?replace('. ','.')}
	}
	</#if>
</#macro>



<#macro pm_xxxrepository_findxxxbyprimarykey>
	<#if entity.primaryKeyFieldList?size == 1>
		<#list entity.primaryKeyFieldList as fld>
	Optional<${entity.className}> find${entity.className}ByPrimaryKey(<@gv_keys c=true sep=","/>);
		</#list>
	<#elseif entity.primaryKeyFieldList?size gt 1>
	Optional<${entity.className}> find${entity.className}ByPrimaryKey(<@gv_keys c=true sep=","/>);
	</#if>
</#macro>



<#macro pmb_xxxrepositorypanache_save>
    <#assign sv>
    <#compress>
	<#list entity.importedKeys as i>
		final var <@gv_imp i=i sufName="Entity"/> = 
			getEntityManager().find(${i.pkBaseName?cap_first}Entity.class, 
				<@gv_imp i=i unCapName=false preName="${INT}.get" sufName="()"/>
				.get${columnToField(i.pkColumnName)?cap_first}());	
	</#list>
		persistAndFlush(new ${entity.className}Entity(<@INS/> <@gv_imps sep="," c=false sufName="Entity"/>));
	</#compress>
	</#assign>
		${sv?trim?replace('\n','')?replace(';',';\n\t\t')?replace('=',' = ')}
</#macro>



<#macro pmv_createxxximpl_save>
	<#assign var3>
	<#compress>
	<#list entity.primaryKeyFieldList as pkField>
		<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
			<@INS/>.get${pkField.fieldName?cap_first}()
		<#elseif pkField.create  && isImportedKey(pkField.columnName)!false>
			<#list entity.importedKeys as i>
				<#if pkField.columnName == i.fkColumnName>
		    <@gv_imp i=i unCapName=false preName="${INT}.get" sufName="()"/>
				.get${columnToField(i.pkColumnName)?cap_first}()
				</#if>
			</#list>
		</#if><#sep>,
	</#list>
	</#compress>
	</#assign>
${var3?trim?replace('\n','')?replace(',',', ')}</#macro>



<#macro pmb_xxxrepositorypanache_update>
	<#assign pu>
    <#compress>
	<#list entity.importedKeys as i>
		final var <@gv_imp i=i sufName="Entity"/> = getEntityManager().find(
			${i.pkBaseName?cap_first}Entity.class, <@gv_imp i=i unCapName=false preName="${INT}.get" sufName="()"/>
				.get${columnToField(i.pkColumnName)?cap_first}());	
	</#list>
	<#if entity.primaryKeyFieldList?size == 1>
		<#list entity.primaryKeyFieldList as fld>
		final var <@INS/>Entity = findById(<@INS/>.get${fld.fieldName?cap_first}());
		</#list>
	<#elseif entity.primaryKeyFieldList?size gt 1>
		final var <@INS/>EntityKey = new ${entity.className}EntityKey();
		<#list entity.primaryKeyFieldList as pkField>
			<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
		<@INS/>EntityKey.set${pkField.fieldName?cap_first}(<@INS/>.get${pkField.fieldName?cap_first}());
			</#if>
			<#if pkField.create  && isImportedKey(pkField.columnName)!false>
				<#list entity.importedKeys as i>
					<#if pkField.columnName == i.fkColumnName>
		<@gv_imp i=i unCapName=false preName="${INT}EntityKey.set" sufName=""/>(
			<@gv_imp i=i sufName="Entity"/>
			);
					</#if>
				</#list>
			</#if>
		</#list>
		final var <@INS/>Entity = getEntityManager().find(${entity.className}Entity.class, <@INS/>EntityKey);
		
	</#if>
		<@INS/>Entity.update(<@INS/> <@gv_imps c=false sufName="Entity" sep=","/>);
	</#compress>
	</#assign>
		${pu?trim?replace('\n','')?replace(';',';\n\t\t')?replace('. ','.')}
</#macro>



<#macro pmb_xxxrepositorypanache_delete>
	<#if entity.primaryKeyFieldList?size == 1>
		return deleteById(<@factor.gv_keys sep="," c=false/>);
	<#else>
	    <#assign pu>
        <#compress>
	    <#list entity.importedKeys as i>
		final var <@gv_imp i=i sufName="Entity"/> = 
			  getEntityManager().find(
			${i.pkBaseName?cap_first}Entity.class, ${columnToField(i.fkColumnName)?uncap_first});	
	    </#list>
	    final var <@INS/>EntityKey = new ${entity.className}EntityKey();
		<#list entity.primaryKeyFieldList as pkField>
			<#if pkField.create  && !isImportedKey(pkField.columnName)!false>
		<@INS/>EntityKey.set${pkField.fieldName?cap_first}(<@INS/>.get${pkField.fieldName?cap_first}());
			</#if>
			<#if pkField.create  && isImportedKey(pkField.columnName)!false>
				<#list entity.importedKeys as i>
					<#if pkField.columnName == i.fkColumnName>
		<@gv_imp i=i unCapName=false preName="${INT}EntityKey.set" sufName=""/>(
			<@gv_imp i=i sufName="Entity"/>
			);
					</#if>
				</#list>
			</#if>
		</#list>
		</#compress>
	    </#assign>
		${pu?trim?replace('\n','')?replace(';',';\n\t\t')?replace('. ','.')}
		
		final var <@INS/>Entity = getEntityManager().find(${entity.className}Entity.class, <@INS/>EntityKey);
		try {
		     delete(<@INS/>Entity);
			 return true;
		} catch (Exception e){
			 return false;
		}
	</#if>
</#macro>



<#function createDummyData fld>
	<#switch fld.fieldType>
  				<#case "java.lang.String">
					<#assign inx>"${fld.fieldName}"</#assign>
					<#return inx>			
     				<#break>
			  <#case "java.time.LocalDateTime">
					<#assign inx>LocalDateTime.now()</#assign>
					<#return inx>
			     	<#break>
			  <#default>
					<#assign inx>"${fld.fieldName}"</#assign>	
					<#return inx>	    
	</#switch>
</#function>


<#function createGetMethod entity fld suffix="">
	<#switch fld.fieldType>
			  <#case "java.time.LocalDateTime">
					<#assign inx><@INS/>${suffix}.${fld.getterMethodName}().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSSSSS"))</#assign>
					<#return inx>
			     	<#break>
			  <#default>
					<#assign inx><@INS/>${suffix}.${fld.getterMethodName}()</#assign>	
					<#return inx>	    
	</#switch>
</#function>


<#function findDataType table column>
  <#list adv.entities as ent>
  	<#list ent.fieldList as fd>
  		<#if table == ent.tableName && column == fd.columnName>
    		<#return fd.fieldType>
  		</#if>
  	</#list>
  </#list>
</#function>

<#function columnToField columnName>
	<#return columnName?replace('_',' ')?capitalize?replace(' ','')>
</#function>

<#function isImportedKey column>
	<#list entity.importedKeys as i>
	<#if i.fkColumnName == column>
    	<#return true>
  	</#if>
	</#list>
</#function>

<#function isImportedKeyWithEntity entity column>
	<#list entity.importedKeys as i>
	<#if i.fkColumnName == column>
    	<#return true>
  	</#if>
	</#list>
</#function>

<#function countNotBlank seq>
<#assign x=0>
<#list seq as fld>
	<#if fld.create >
	    <#if !fld.nullable>
	    <#assign x++ >
	    </#if>
	</#if>
</#list>
<#return x>
</#function>



