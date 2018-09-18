/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.TeachercourseDao;
import java.util.List;
import model.Teachercourse;

/**
 *
 * @author armando
 */
public class TeachercourseServiceImp  implements TeachercourseService{
    
    private TeachercourseDao teachercourseDao;

    public void setTeachercourseDao(TeachercourseDao teachercourseDao) {
        this.teachercourseDao = teachercourseDao;
    }
    
    
    @Override
    public void addTeachercourse(Teachercourse teachercourse) {
        teachercourseDao.addTeachercourse(teachercourse);
    }

    @Override
    public List<Teachercourse> listTeachercourses() {
        return teachercourseDao.listTeachercourses();
    }

    @Override
    public Teachercourse getTeachercourseById(int teachercourseId) {
        return teachercourseDao.getTeachercourseById(teachercourseId);
    }

    @Override
    public void editTeachercourse(Teachercourse teachercourse) {
        teachercourseDao.editTeachercourse(teachercourse);
    }    

    @Override
    public List<Teachercourse> listTeachercourseByTeacher(int teacherId) {
        return teachercourseDao.listTeachercourseByTeacher(teacherId);
    }
    
    @Override
    public void deleteTeachercourse(Teachercourse teachercourse){
        teachercourseDao.deleteTeachercourse(teachercourse);
    };
}
