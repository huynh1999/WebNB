/*
	@author:Quang Truong
	@date: Feb 2, 2020
*/

package online.newbrandshop.repository;

import online.newbrandshop.modal.BillEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface BillRepository extends JpaRepository<BillEntity, Long> {
    BillEntity findByBillName(String billName);
    List<BillEntity>findAllByCreatedBy(String createdBy);
    List<BillEntity>findAllByStatus(int status);
    BillEntity findById(Long id);
}
