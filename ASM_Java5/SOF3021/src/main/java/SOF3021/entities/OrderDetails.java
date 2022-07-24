// Generated with g9.

package SOF3021.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "order_details")
public class OrderDetails implements Serializable {
	protected static final String PK = "id";
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(unique=true, nullable=false, precision=10)
    private int id;
    @Column(nullable=false, precision=12)
    private float price;
    @Column(nullable=false, precision=10)
    private int quantity;
    @Column(nullable=false, precision=10)
    private int status;
    @ManyToOne(optional=false)
    @JoinColumn(name="order_id", nullable=false)
    private Orders orders;
    @ManyToOne(optional=false)
    @JoinColumn(name="product_id", nullable=false)
    private Products products;
}
