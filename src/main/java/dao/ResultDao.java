/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Course;
import model.Result;

/**
 *
 * @author armando
 */
public interface ResultDao {
    
    public void addResult (Result result);
    
    public void editResult (Result result);
    
    public List<Result> listResults();
    
    public Result getResultById(int resultId);
    
    public List<Result> listResultByStudent(int studentId);
    
    public void deleteResult (Result result);
    
}
