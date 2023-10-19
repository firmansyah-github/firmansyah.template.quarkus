<#-- 
${PRV_SYS_GEN_PATH|src/main/java/org/example/realworldapi/infrastructure/web/validation/validator/|Private System placeholder for create generated relative path}
${PRV_SYS_GEN_TYPE|one|Please choose one option from this Private Gen type list: one, many, copy}
${PRV_SYS_GEN_FILENAME|AtLeastOneFieldMustBeNotNullValidator.java|Private System placeholder for define file name that need to be generated, if required to be different with template name}
${PRV_SYS_IS_REPLACE|true|Private System placeholder for replace previous generated file or create unique file name,list:true,false}
${PUB_APP_GROUP|org.example|Description}
-->
package ${PUB_APP_GROUP}.realworldapi.infrastructure.web.validation.validator;

import ${PUB_APP_GROUP}.realworldapi.infrastructure.web.validation.constraint.AtLeastOneFieldMustBeNotNull;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.Field;

public class AtLeastOneFieldMustBeNotNullValidator implements ConstraintValidator<AtLeastOneFieldMustBeNotNull, Object> {

    private String[] fieldNames;

    public void initialize(AtLeastOneFieldMustBeNotNull constraintAnnotation) {
        fieldNames = constraintAnnotation.fieldNames();
    }

    public boolean isValid(Object object, ConstraintValidatorContext constraintValidatorContext) {

        Class<?> clazz = object.getClass();

        configFieldNamesIfEmpty(clazz);

        for (String propertyName : fieldNames) {
            Field field = getDeclaredField(clazz, propertyName);
            if (getValue(field, object) != null) {
                return true;
            }
        }

        return false;
    }

    private void configFieldNamesIfEmpty(Class<?> clazz) {

        if (fieldNames.length == 0) {
            fieldNames = getInstanceDeclaredFieldNames(clazz);
        }

    }

    private String[] getInstanceDeclaredFieldNames(Class<?> clazz) {

        Field[] fields = clazz.getDeclaredFields();

        String[] resultNames = new String[fields.length];

        for (int fieldIndex = 0; fieldIndex < fields.length; fieldIndex++) {
            resultNames[fieldIndex] = fields[fieldIndex].getName();
        }

        return resultNames;
    }

    private Object getValue(Field field, Object instance) {
        Object value;
        try {
            value = field.get(instance);
        } catch (IllegalAccessException ex) {
            throw new RuntimeException(ex);
        }
        return value;
    }

    private Field getDeclaredField(Class<?> clazz, String name) {
        Field field;
        try {
            field = clazz.getDeclaredField(name);
            field.setAccessible(true);
        } catch (NoSuchFieldException ex) {
            throw new RuntimeException(ex);
        }
        return field;
    }
}
