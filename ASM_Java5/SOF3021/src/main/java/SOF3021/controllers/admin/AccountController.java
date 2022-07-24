package SOF3021.controllers.admin;

import java.io.File;
import java.nio.file.Path;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import SOF3021.beans.AccountModel;
import SOF3021.entities.Accounts;
import SOF3021.repositories.AccountRepository;
import SOF3021.utils.EncryptUtil;



@Controller
@RequestMapping("admin/account")
public class AccountController {
	@Autowired
	private AccountRepository accRepo;

	@Autowired
	ServletContext application;

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "3") int size,
			@RequestParam(name = "field", defaultValue = "id") Optional<String> field,
			@ModelAttribute("acc") Accounts acc) {
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
		Page<Accounts> p = this.accRepo.findAll(pageable);
		model.addAttribute("accview", p);
		model.addAttribute("page", page);
		model.addAttribute("field", field.orElse("id"));
		return "admin/account";
	}

//
//	@GetMapping("create")
//	public String create(@ModelAttribute("cate") Categories cate) {
//		return "category/create";
//	}
//
	@PostMapping("store")
	public String store(@Valid @ModelAttribute("acc") Accounts acc1, AccountModel accModel, BindingResult result) {
		if (result.hasErrors() == true) {
			System.out.println("Form không hợp lệ!");
		} else {
			System.out.println("Form hợp lệ!");
			Accounts acc = new Accounts();
			acc.setUsername(accModel.getUsername());
			String encrypted = EncryptUtil.encrypt(accModel.getPassword());
			acc.setPassword(encrypted);
			acc.setFullname(accModel.getFullname());
			acc.setEmail(accModel.getEmail());

			// Photo
			if (!accModel.getPhotofile().isEmpty()) {
				String path = application.getRealPath("/");
				try {
					acc.setPhoto(accModel.getPhotofile().getOriginalFilename());
					System.out.println(accModel.getPhotofile().getOriginalFilename());
					String filePath = path + "/images/" + accModel.getPhotofile().getOriginalFilename();
					accModel.getPhotofile().transferTo(Path.of(filePath));
					accModel.setPhotofile(null);
				} catch (Exception e) {
					acc.setPhoto("Chưa có!");
				}
			}

			// Photo
//			acc.setPhoto(accModel.getPhoto());
			acc.setAdmin(accModel.getAdmin());
			acc.setActivated(0);
			this.accRepo.save(acc);
		}
		return "redirect:/admin/account/index";
	}

//
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Accounts acc) {
		this.accRepo.delete(acc);
		return "redirect:/admin/account/index";
	}

//
//	@GetMapping("edit/{id}")
//	public String edit(@PathVariable("id") Categories cate, Model model) {
//		model.addAttribute("cate", cate);
//		return "category/edit";
//	}
//
	@PostMapping("update/{id}")
	public String update(@PathVariable("id") Accounts acc, AccountModel accModel) {
		acc.setUsername(accModel.getUsername());
		acc.setPassword(accModel.getPassword());
		acc.setFullname(accModel.getFullname());
		acc.setEmail(accModel.getEmail());
		if (!accModel.getPhotofile().isEmpty()) {
			String path = application.getRealPath("/");
			try {
				acc.setPhoto(accModel.getPhotofile().getOriginalFilename());
				System.out.println(accModel.getPhotofile().getOriginalFilename());
				String filePath = path + "/images/" + accModel.getPhotofile().getOriginalFilename();
				accModel.getPhotofile().transferTo(Path.of(filePath));
				accModel.setPhotofile(null);
			} catch (Exception e) {
				acc.setPhoto("Chưa có!");
			}
		}
//		acc.setPhoto(accModel.getPhoto());
		acc.setAdmin(accModel.getAdmin());
		acc.setActivated(accModel.getActivated());
		this.accRepo.save(acc);
		return "redirect:/admin/account/index";
	}
//	@ResponseBody
//	public JsonValidationRepose saveAccount(@ModelAttribute @Valid Accounts acc, BindingResult result) {
//		
//	}
}
