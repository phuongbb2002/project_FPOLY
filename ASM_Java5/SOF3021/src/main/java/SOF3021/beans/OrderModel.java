package SOF3021.beans;

import java.sql.Date;

import SOF3021.entities.Accounts;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderModel {
	private Accounts accounts;
	private Date createDate;
	private String address;
	private int status;
}
