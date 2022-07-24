// Generated with g9.

package SOF3021.entities;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "accounts", indexes = { @Index(name = "accounts_username_IX", columnList = "username", unique = true),
		@Index(name = "accounts_email_IX", columnList = "email", unique = true) })
public class Accounts implements Serializable {
	protected static final String PK = "id";
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false, precision = 10)
	private int id;
	@Column(unique = true, nullable = false, length = 255)
	private String username;
	@Column(nullable = false, length = 255)
	private String password;
	@Column(nullable = false, length = 255)
	private String fullname;
	@Column(unique = true, nullable = false, length = 255)
	private String email;
	@Column(length = 255)
	private String photo;
	@Column(nullable = false, precision = 10)
	private int activated;
	@Column(nullable = false, precision = 10)
	private int admin;
	@OneToMany(mappedBy = "accounts")
	private Set<Orders> orders;
}
