package SOF3021.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import SOF3021.entities.Products;


@Repository
public interface ProductRepository extends JpaRepository<Products, Integer>{

}
