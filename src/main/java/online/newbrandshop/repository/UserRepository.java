/*
	@author:Quang Truong
	@date: Jan 14, 2020
*/

package online.newbrandshop.repository;

import java.util.List;

import online.newbrandshop.modal.RoleUserEntity;
import online.newbrandshop.modal.UserEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


public interface UserRepository extends JpaRepository<UserEntity, Long> {
	
	UserEntity findOneByUserNameAndActive(String name, int active);
	
	
	UserEntity findFirstOneByEmail(String email);
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update UserEntity u set u.email=:email, u.password=:password, u.active=:active, u.roleUserEntity = :roleUserEntity where u.userName = :userName")
	public void update(@Param("userName") String userName, @Param("email") String email,
                       @Param("password") String password, @Param("active") int active,
                       @Param("roleUserEntity") RoleUserEntity roleUserEntity);


	@Transactional
	@Query ("select count (r.id) from UserEntity r")
	long countTotalRecords();

	@Transactional
	@Query ( "select r from UserEntity r")
	public List<UserEntity> find10Users(Pageable pageable);

}
