package SOF3021.beans;
import java.sql.Date;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import SOF3021.entities.Categories;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModel {
	private String name;
	private String image;
	private MultipartFile imagefile;
	private int price;
	private Date createdDate;
	private int available;
	private Categories categories;
}
