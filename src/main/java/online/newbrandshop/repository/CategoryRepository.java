/*
	@author:Quang Truong
	@date: Feb 11, 2020
*/

package online.newbrandshop.repository;

import online.newbrandshop.modal.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CategoryRepository extends JpaRepository<CategoryEntity, Long>{
	CategoryEntity findOneByCategoryName(String categoryName);
}
