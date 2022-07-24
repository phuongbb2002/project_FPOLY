package SOF3021.beans;

import java.sql.Date;

import SOF3021.entities.Orders;
import SOF3021.entities.Products;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailModel {
	private Orders orders;
	private Products products;
	private float price;
	private int quantity;
	private int status;
}
