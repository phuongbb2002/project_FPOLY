package SOF3021.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import SOF3021.entities.Categories;


@Repository
public interface CategoryRepository extends JpaRepository<Categories, Integer>{
	
}
