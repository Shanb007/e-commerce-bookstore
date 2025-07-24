package api;

public class ApiException extends RuntimeException {

    public ApiException(String message) {
        super(message);
    }

    public ApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public static class ValidationFailure extends ApiException {
        private final String fieldName;
        public ValidationFailure(String fieldName, String message) {
            super(message);
            this.fieldName = fieldName;
        }
        public ValidationFailure(String message) {
            super(message);
            this.fieldName = null;
        }
        public String getFieldName() { return fieldName; }
        public boolean isFieldError() { return fieldName != null && !fieldName.isBlank(); }
    }

}
