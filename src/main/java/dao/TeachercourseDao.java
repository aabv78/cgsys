
package dao;

import java.util.List;
import model.Course;
import model.Teachercourse;

public interface TeachercourseDao {
    public void addTeachercourse (Teachercourse teachercourse);
    
    public void editTeachercourse (Teachercourse teachercourse);
    
    public List<Teachercourse> listTeachercourses();
    
    public Teachercourse getTeachercourseById(int teachercourseId);
    
    public List<Teachercourse> listTeachercourseByTeacher(int teacherId);
    
    public void deleteTeachercourse (Teachercourse teachercourse);
}
