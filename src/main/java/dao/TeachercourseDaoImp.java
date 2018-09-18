/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.util.List;
import model.Course;
import model.Teachercourse;
import model.Student;
import org.hibernate.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import dao.CourseDao;
import dao.StudentDao;
/**
 *
 * @author armando
 */

@Repository
@Transactional
public class TeachercourseDaoImp implements TeachercourseDao {
    private SessionFactory sessionFactory;
    private StudentDao studentDao;
    private CourseDao courseDao;
	
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
    
    
    @Override
    public void addTeachercourse(Teachercourse teachercourse) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(teachercourse);
    }

    @Override
    public List<Teachercourse> listTeachercourses() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Teachercourse> teachercoursesList = session.createQuery("from Teachercourse").list();
        return teachercoursesList;
    }

    @Override
    public Teachercourse getTeachercourseById(int teachercourseId) {
        Session session = this.sessionFactory.getCurrentSession();
        Teachercourse st = (Teachercourse) session.load(Teachercourse.class, new Integer(teachercourseId) );
        return st;
    }

    @Override
    public void editTeachercourse(Teachercourse teachercourse) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(teachercourse);
    }

    @Override
    public List<Teachercourse> listTeachercourseByTeacher(int teacherId) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Teachercourse> teachercourseList = session.createQuery("from Teachercourse R where R.teachercourseTeacher.teacherId =" + teacherId).list();
        return teachercourseList;
    }
    
    @Override
    public void deleteTeachercourse (Teachercourse teachercourse){
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(teachercourse);   
    };
    
}
