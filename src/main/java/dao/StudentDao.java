/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Course;
import model.Student;

/**
 *
 * @author armando
 */
public interface StudentDao {
    
    public void addStudent (Student st);
    
    public void editStudent (Student student);
    
    public List<Student> listStudents();
    
    public Student getStudentById(int studentId);
    
    public void deleteStudent(Student student);
    
    public List<Student> listStudentsByCourse(Course course);
}
