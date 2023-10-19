<#-- 
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|.gitignore|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
-->
# Eclipse
.project
.classpath
.settings/
bin/

# IntelliJ
.idea
*.ipr
*.iml
*.iws

# NetBeans
nb-configuration.xml

# Visual Studio Code
.vscode

# OSX
.DS_Store

# Vim
*.swp
*.swo

# patch
*.orig
*.rej

# Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
release.properties
