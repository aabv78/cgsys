/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.util.List;
import model.Course;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import model.Teacher;
import org.hibernate.SQLQuery;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author armando
 */

@Repository
@Transactional
public class TeacherDaoImp implements TeacherDao{
    
    private SessionFactory sessionFactory;
	
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
    
    
    @Override
    public void addTeacher(Teacher st) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(st);
    }

    @Override
    public List<Teacher> listTeachers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Teacher> teachersList = session.createQuery("from Teacher").list();
        return teachersList;
    }

    @Override
    public Teacher getTeacherById(int teacherId) {
        Session session = this.sessionFactory.getCurrentSession();
        Teacher st = (Teacher) session.load(Teacher.class, new Integer(teacherId) );
        return st;
    }


    @Override
    public void editTeacher(Teacher teacher) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(teacher);
    }
  


    @Override
    public void deleteTeacher(Teacher teacher) {
        Session session = this.sessionFactory.getCurrentSession();
    
        String sql = " DELETE FROM teachercourse  WHERE teachercourseTeacherId = :teacherId ";
        SQLQuery query = session.createSQLQuery(sql);
        query.setParameter("teacherId", teacher.getTeacherId());
        query.executeUpdate();
        
        session.delete(teacher);      
    }   
    
    public List<Teacher> listTeachersByCourse(Course course){
        Session session = this.sessionFactory.getCurrentSession();
        String sql = " SELECT distinct t.* FROM teacher t, teachercourse c "
                + " where t.teacherid=c.teachercourseteacherid "
                + " and c.teachercourseCourseid= :courseId";
        SQLQuery query = session.createSQLQuery(sql);
        query.addEntity(Teacher.class);
        query.setParameter("courseId", course.getCourseId());
        List teachersList = query.list();
        return teachersList;    
        
    }
}
