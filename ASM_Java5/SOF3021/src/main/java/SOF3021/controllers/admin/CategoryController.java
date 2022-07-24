package SOF3021.controllers.admin;

import java.util.Optional;

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

import SOF3021.beans.CategoryModel;
import SOF3021.entities.Categories;
import SOF3021.repositories.CategoryRepository;



@Controller
@RequestMapping("admin/category")
public class CategoryController {
	@Autowired
	private CategoryRepository cateRepo;

	@GetMapping("index")
	public String index(
			Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "5") int size,
			@RequestParam(name = "field", defaultValue = "id") Optional<String> field,
			@ModelAttribute("cate") Categories cate
			) {
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
		Page<Categories> p = this.cateRepo.findAll(pageable);
		model.addAttribute("cateview", p);
		model.addAttribute("page", page);
		model.addAttribute("field", field.orElse("id"));
		return "admin/category";
	}
//
//	@GetMapping("create")
//	public String create(@ModelAttribute("cate") Categories cate) {
//		return "category/create";
//	}
//
	@PostMapping("store")
	public String store(CategoryModel cateModel) {
		Categories cate = new Categories();
		cate.setName(cateModel.getName());
		this.cateRepo.save(cate);
		return "redirect:/admin/category/index";
	}
//
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Categories cate) {
		this.cateRepo.delete(cate);
		return "redirect:/admin/category/index";
	}
//
//	@GetMapping("edit/{id}")
//	public String edit(@PathVariable("id") Categories cate, Model model) {
//		model.addAttribute("cate", cate);
//		return "category/edit";
//	}
//
	@PostMapping("update/{id}")
	public String update(@PathVariable("id") Categories cate, CategoryModel cateModel) {
		cate.setName(cateModel.getName());
		this.cateRepo.save(cate);
		return "redirect:/admin/category/index";
	}
}
