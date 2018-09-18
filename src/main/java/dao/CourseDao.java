/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Course;

/**
 *
 * @author armando
 */
public interface CourseDao {
    
    public void addCourse (Course course);
    
    public void editCourse (Course course);
    
    public List<Course> listCourses();
    
    public Course getCourseById(int courseId);
    
    public List<Course> listCoursesAvailableStudent(int studentId); 
    
    public List<Course> listCoursesAvailableTeacher(int teacherId);
    
    public void deleteCourse (Course course);
    
}
