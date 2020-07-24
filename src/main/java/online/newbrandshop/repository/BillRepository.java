/*
	@author:Quang Truong
	@date: Feb 2, 2020
*/

package online.newbrandshop.repository;

import online.newbrandshop.modal.BillEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;


public interface BillRepository extends JpaRepository<BillEntity, Long> {
    BillEntity findByBillName(String billName);
    List<BillEntity>findAllByCreatedBy(String createdBy);
    List<BillEntity>findAllByStatus(int status);
    BillEntity findById(Long id);
    @Query(nativeQuery = true,value = "select json_arrayagg( json_object('money',money,'date',date)) FROM (select SUM(totalmoney) as money, DATE(createddate) as date from bill where month(createddate)=:month and year(createddate)=:year GROUP BY DATE(createddate))as T;")
    String doChartjs(@Param("month")int month,@Param("year")int year);
}
