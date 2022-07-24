package SOF3021.beans;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class AccountModel {
	@NotBlank
	private String fullname;
	@NotBlank
	private String email;
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	@NotBlank
	private String photo;
	private MultipartFile photofile;
	@NotBlank
	private int admin;
	@NotBlank
	private int activated;
}
