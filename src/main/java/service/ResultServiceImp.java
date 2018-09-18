/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Result;
import dao.ResultDao;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author armando
 */
@Service
@Transactional
public class ResultServiceImp implements ResultService{

    private ResultDao resultDao;

    public void setResultDao(ResultDao resultDao) {
        this.resultDao = resultDao;
    }
    
    
    @Override
    public void addResult(Result result) {
        resultDao.addResult(result);
    }

    @Override
    public List<Result> listResults() {
        return resultDao.listResults();
    }

    @Override
    public Result getResultById(int resultId) {
        return resultDao.getResultById(resultId);
    }

    @Override
    public void editResult(Result result) {
        resultDao.editResult(result);
    }

    @Override
    public List<Result> listResultByStudent(int studentId) {
        return resultDao.listResultByStudent(studentId);
    }

    @Override
    public void deleteResult(Result result) {
        resultDao.deleteResult(result);
    }

    
}
