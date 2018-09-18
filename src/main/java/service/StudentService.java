/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Course;
import model.Student;

/**
 *
 * @author armando
 */
public interface StudentService {
    
    public void addStudent (Student student);
    public void editStudent (Student course);
    public List<Student> listStudents();
    public Student getStudentById(int studentId);
    public void deleteStudent(Student student);
    public List<Student> listStudentsByCourse(Course course);
}
