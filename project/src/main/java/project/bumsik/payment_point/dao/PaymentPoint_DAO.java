package project.bumsik.payment_point.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.bumsik.payment_main.vo.Lecture_VO;
import project.bumsik.payment_point.vo.PaymentPoint_VO;

public interface PaymentPoint_DAO {
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void insertPoint(Map<String, Object> resultMap) throws DataAccessException;
	public void updatePoint(Map<String, Object> resultMap) throws DataAccessException;
}
