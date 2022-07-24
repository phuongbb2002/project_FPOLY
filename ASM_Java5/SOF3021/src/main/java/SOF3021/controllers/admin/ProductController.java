package SOF3021.controllers.admin;

import java.nio.file.Path;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import SOF3021.beans.ProductModel;
import SOF3021.entities.Categories;
import SOF3021.entities.Products;
import SOF3021.repositories.CategoryRepository;
import SOF3021.repositories.ProductRepository;


@Controller
@RequestMapping("admin/product")
public class ProductController {
	@Autowired
	private ProductRepository proRepo;

	@Autowired
	private CategoryRepository cateRepo;

	@Autowired
	ServletContext application;

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "3") int size,
			@RequestParam(name = "field", defaultValue = "id") Optional<String> field,
			@ModelAttribute("pro") Products pro) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
//		if (page < 0) {
//			page = 0;
//		}
//		if (page > this.accRepo.findAll().size() / size - 1) {
////			int a =this.accRepo.findAll().size() / size;
////			if(a == 1) {
////				page = 0;
////			}else {
////				page = this.accRepo.findAll().size() / size;
////			}
//			page = this.accRepo.findAll().size() / size - 1;
//		}
		Pageable pageable = PageRequest.of(page, size, sort);
		Page<Products> p = this.proRepo.findAll(pageable);
		model.addAttribute("proview", p);
		model.addAttribute("page", page);
		model.addAttribute("field", field.orElse("id"));
		List<Categories> c = this.cateRepo.findAll();
		model.addAttribute("cate", c);
		return "admin/product";
	}

//
//	@GetMapping("create")
//	public String create(@ModelAttribute("cate") Categories cate) {
//		return "category/create";
//	}
//
	@PostMapping("store")
	public String store(ProductModel proModel) {
		Products pro = new Products();
		pro.setName(proModel.getName());
		if (!proModel.getImagefile().isEmpty()) {
			String path = application.getRealPath("/");
			try {
				pro.setImage(proModel.getImagefile().getOriginalFilename());
				String filePath = path + "/images/" + proModel.getImagefile().getOriginalFilename();
				proModel.getImagefile().transferTo(Path.of(filePath));
				proModel.setImagefile(null);
			} catch (Exception e) {
				pro.setImage("Chưa có!");
			}
		}
//		pro.setImage(proModel.getImage());
		pro.setPrice(proModel.getPrice());
		System.out.println("Ngày:" + proModel.getCreatedDate());
		pro.setCreatedDate(proModel.getCreatedDate());
		pro.setAvailable(proModel.getAvailable());
		pro.setCategories(proModel.getCategories());
		this.proRepo.save(pro);
		return "redirect:/admin/product/index";
	}

//
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Products pro) {
		this.proRepo.delete(pro);
		return "redirect:/admin/product/index";
	}

//
//	@GetMapping("edit/{id}")
//	public String edit(@PathVariable("id") Categories cate, Model model) {
//		model.addAttribute("cate", cate);
//		return "category/edit";
//	}
//
	@PostMapping("update/{id}")
	public String update(@PathVariable("id") Products pro, ProductModel proModel) {
		pro.setName(proModel.getName());
		if (!proModel.getImagefile().isEmpty()) {
			String path = application.getRealPath("/");
			try {
				pro.setImage(proModel.getImagefile().getOriginalFilename());
				String filePath = path + "/images/" + proModel.getImagefile().getOriginalFilename();
				proModel.getImagefile().transferTo(Path.of(filePath));
				proModel.setImagefile(null);
			} catch (Exception e) {
				pro.setImage("Chưa có!");
			}
		}
//		pro.setImage(proModel.getImage());
		pro.setPrice(proModel.getPrice());
		pro.setCreatedDate(proModel.getCreatedDate());
		pro.setAvailable(proModel.getAvailable());
		pro.setCategories(proModel.getCategories());
		this.proRepo.save(pro);
		return "redirect:/admin/product/index";
	}

	@ModelAttribute("catelist")
	public Map<Integer, String> getHobbies() {
		Map<Integer, String> map = new HashMap<>();
		map.put(-1, "Rỗng. Vui lòng thêm Category!");
		List<Categories> c = this.cateRepo.findAll();
		for (int i = 0; i < c.size(); i++) {
			map.put(c.get(i).getId(), c.get(i).getName());
		}
		return map;
	}
}
