/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Teachercourse;

/**
 *
 * @author armando
 */
public interface TeachercourseService {
    
    public void addTeachercourse (Teachercourse teachercourse);    
    public void editTeachercourse (Teachercourse teachercourse);    
    public List<Teachercourse> listTeachercourses();    
    public Teachercourse getTeachercourseById(int teachercourseId);    
    public List<Teachercourse> listTeachercourseByTeacher(int teacherId);
    public void deleteTeachercourse(Teachercourse teachercourse);
    
}
