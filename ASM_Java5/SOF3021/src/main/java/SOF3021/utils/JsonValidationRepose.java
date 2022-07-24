package SOF3021.utils;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class JsonValidationRepose {
	Object validatioObject;

	private boolean validated;

	private Map<String, String> errorMessages;

	public boolean isValidated() {

		return validated;

	}

	public void setValidated(boolean validated) {

		this.validated = validated;

	}

	public Map<String, String> getErrorMessages() {

		return errorMessages;

	}

	public void setErrorMessages(Map<String, String> errorMessages) {

		this.errorMessages = errorMessages;

	}

	public Object getValidatioObject() {

		return validatioObject;

	}

	public void setValidatioObject(Object validatioObject) {

		this.validatioObject = validatioObject;

	}

}
