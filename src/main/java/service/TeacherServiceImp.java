/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Teacher;
import dao.TeacherDao;
import java.util.List;
import model.Course;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author armando
 */
@Service
@Transactional
public class TeacherServiceImp implements TeacherService{

    private TeacherDao teacherDao;

    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }
    
    
    @Override
    public void addTeacher(Teacher teacher) {
        teacherDao.addTeacher(teacher);
    }

    @Override
    public List<Teacher> listTeachers() {
        return teacherDao.listTeachers();
    }

    @Override
    public Teacher getTeacherById(int teacherId) {
        return teacherDao.getTeacherById(teacherId);
    }

    @Override
    public void editTeacher(Teacher teacher) {
        teacherDao.editTeacher(teacher);
    }
    
    @Override
    public void deleteTeacher(Teacher teacher){
        teacherDao.deleteTeacher(teacher);
    }
    
    @Override
    public List<Teacher> listTeachersByCourse(Course course){
        return teacherDao.listTeachersByCourse(course);
    }
}
