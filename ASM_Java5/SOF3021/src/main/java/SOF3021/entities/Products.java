// Generated with g9.

package SOF3021.entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "products")
public class Products implements Serializable {
	protected static final String PK = "id";
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false, precision = 10)
	private int id;
	@Column(nullable = false, length = 255)
	private String name;
	@Column(length = 255)
	private String image;
	@Column(nullable = false, precision = 10)
	private int price;
	@Column(name = "created_date", nullable = false)
	private Date createdDate;
	@Column(nullable = false, precision = 10)
	private int available;
	@OneToMany(mappedBy = "products")
	private Set<OrderDetails> orderDetails;
	@ManyToOne(optional = false)
	@JoinColumn(name = "category_id", nullable = false)
	private Categories categories;
}
