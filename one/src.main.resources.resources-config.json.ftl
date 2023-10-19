<#-- 
${PRV_SYS_GEN_PATH|src/main/resources/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|resources-config.json|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
{
  "resources": [
    {
      "pattern": ".*\\.xml$"
    },
    {
      "pattern": ".*\\.json$"
    },
    {
      "pattern": ".*\\.properties$"
    }
  ]
}
