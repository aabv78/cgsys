/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Course;
import model.Teacher;

/**
 *
 * @author armando
 */
public interface TeacherDao {
    
    public void addTeacher (Teacher teacher);
    
    public void editTeacher (Teacher teacher);
    
    public List<Teacher> listTeachers();
    
    public Teacher getTeacherById(int teacherId);
    
    public void deleteTeacher(Teacher teacher);
    
    public List<Teacher> listTeachersByCourse(Course course);
}
