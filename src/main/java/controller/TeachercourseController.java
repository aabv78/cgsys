package controller;

import javax.validation.Valid;
import model.Course;
import model.Teachercourse;
import model.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.TeachercourseService;
import service.CourseService;
import service.TeacherService;

@Controller
public class TeachercourseController {
    private TeachercourseService teachercourseService;
    private CourseService courseService;
    private TeacherService teacherService;

    @Autowired(required = true)
    @Qualifier(value = "teachercourseService")
    public void setTeachercourseService(TeachercourseService teachercourseService) {
        this.teachercourseService = teachercourseService;
    }

    @Autowired(required = true)
    @Qualifier(value = "courseService")
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    @Autowired(required = true)
    @Qualifier(value = "teacherService")    
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }    
    
    @RequestMapping(value = "/teachercourse/add", method = RequestMethod.GET)
    public String teachercourseForm(Model model) {
        model.addAttribute("teachercourse", new Teachercourse());
        model.addAttribute("courseList", this.courseService.listCourses());
        return "teachercourse_form";
    }

    @RequestMapping(value = "/teachercourse/add/{teacherId}", method = RequestMethod.GET)
    public String addTeachercourse(@PathVariable("teacherId") int teacherId, Model model) {
        Teachercourse teachercourse = new Teachercourse();
        teachercourse.setTeachercourseTeacher(this.teacherService.getTeacherById(teacherId));
        model.addAttribute("courseList", this.courseService.listCoursesAvailableTeacher(teacherId));
        model.addAttribute("teachercourse", teachercourse);
        return "teachercourse_form";
    }

    @RequestMapping(value = "/teachercourse/add", method = RequestMethod.POST)
    public String addTeachercourse(
            @Valid @ModelAttribute("teachercourse") Teachercourse teachercourse,
            BindingResult bindingResult) {
        
        if (bindingResult.hasErrors()) {
            return "teachercourse_form";
        } else {      
            teachercourseService.addTeachercourse(teachercourse);
            return "redirect:/teacher/list";
        }
    }

    @RequestMapping(value = "/teachercourse/{id}")
    public String editTeachercourse(@PathVariable("id") int id, Model model) {
        Teachercourse teachercourse = this.teachercourseService.getTeachercourseById(id);
        model.addAttribute("teachercourse",teachercourse);
//        model.addAttribute("courseList", this.courseService.listCoursesAvailableTeacher(teachercourse.getTeachercourseTeacher().getTeacherId()));
        model.addAttribute("courseList", this.courseService.listCourses());        
        return "teachercourse_form";
    }   
    
    @RequestMapping(value = "/teachercourse/edit", method = RequestMethod.POST)
    public String editTeachercourse(
            @Valid @ModelAttribute("teachercourse") Teachercourse teachercourse,
            BindingResult bindingResult) {
        
        if (bindingResult.hasErrors()) {
            return "teachercourse_form";
        } else { 
            teachercourseService.editTeachercourse(teachercourse);        
            return "redirect:/teacher/list";
        }
    }    
    
    @RequestMapping(value = "/teachercourse/delete/{id}", method = RequestMethod.POST)
    public String deleteTeachercourse(@PathVariable("id") int id, Model model) {
        Teachercourse teachercourse = teachercourseService.getTeachercourseById(id);
        teachercourseService.deleteTeachercourse(teachercourse);        
        return "redirect:/teachercourse/list";        
    }
    
    @RequestMapping(value = "/teachercourse/list", method = RequestMethod.GET)
    public String listTeachercourse(Model model) {
        model.addAttribute("listTeachercourses", teachercourseService.listTeachercourses());
        return "teachercourse_list";
    }
}
