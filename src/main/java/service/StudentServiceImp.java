/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Student;
import dao.StudentDao;
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
public class StudentServiceImp implements StudentService{

    private StudentDao studentDao;

    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }
    
    
    @Override
    public void addStudent(Student student) {
        studentDao.addStudent(student);
    }

    @Override
    public List<Student> listStudents() {
        return studentDao.listStudents();
    }

    @Override
    public Student getStudentById(int studentId) {
        return studentDao.getStudentById(studentId);
    }

    @Override
    public void editStudent(Student student) {
        studentDao.editStudent(student);
    }
    
    @Override
    public void deleteStudent(Student student){
        studentDao.deleteStudent(student);
    }
    
    @Override
    public List<Student> listStudentsByCourse(Course course){
        return studentDao.listStudentsByCourse(course);
    }
}
