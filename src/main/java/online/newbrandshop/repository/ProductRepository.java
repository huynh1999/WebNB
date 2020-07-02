/*
	@author:Quang Truong
	@date: Jan 21, 2020
*/

package online.newbrandshop.repository;

import java.util.List;

import online.newbrandshop.modal.ProductEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


public interface ProductRepository extends JpaRepository<ProductEntity, Long> {

	@Query("select p from ProductEntity p where p.active=1 and p.id=:id")
	ProductEntity findById(@Param("id") Long id);
	@Query("select u from ProductEntity u where u.name LIKE %:keyword%")
	List<ProductEntity> search(@Param("keyword") String keyword);
	List<ProductEntity>findByNameContaining(String name);
}
