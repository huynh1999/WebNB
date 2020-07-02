package online.newbrandshop.repository;



import java.util.List;

import online.newbrandshop.modal.RoleUserEntity;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface RoleUserRepository extends JpaRepository<RoleUserEntity, Long> {
//	@Transactional
//	@Query ("select r from RoleUserEntity r where r.id = :id")
	RoleUserEntity findOneById(long id);

}
