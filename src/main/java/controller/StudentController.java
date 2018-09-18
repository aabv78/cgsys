
package controller;

import javax.validation.Valid;
import model.Course;
import model.Result;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.StudentService;
import service.CourseService;
import service.ResultService;
import service.PaymentService;

@Controller
public class StudentController {

    private StudentService studentService;
    private CourseService courseService;
    private ResultService resultService;
    private PaymentService paymentService;
    
    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "courseService")    
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    
    @Autowired(required = true)
    @Qualifier(value = "resultService")   
    public void setResultService(ResultService resultService) {
        this.resultService = resultService;
    }

    @Autowired(required = true)
    @Qualifier(value = "paymentService")       
    public void setPaymentService(PaymentService paymentService) {
        this.paymentService = paymentService;
    }
    
    
    @InitBinder
    public void initBinder(WebDataBinder dataBinder){
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }    
    
    
    @RequestMapping(value = "/student/add", method = RequestMethod.GET)
    public String studentForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("courseList", this.courseService.listCourses());
        return "student_form";
    }
    
    @RequestMapping(value = "/student/add", method = RequestMethod.POST)
    public String addStudent(
            @Valid @ModelAttribute("student") Student s,
            BindingResult bindingResult) {
        
        if (bindingResult.hasErrors()) {
            return "student_form";
        } else {        
            studentService.addStudent(s);        
            return "redirect:/student/list";
        }
    }
    
    @RequestMapping(value = "/student/{id}")
    public String editStudent(@PathVariable("id") int id, Model model) {
        model.addAttribute("student", this.studentService.getStudentById(id));
        model.addAttribute("resultList", this.resultService.listResultByStudent(id));
        model.addAttribute("paymentList", this.paymentService.listPaymentByStudent(id));        
        return "student_form";
    }    
    
    @RequestMapping(value = "/student/list", method = RequestMethod.GET)
    public String listStudents(Model model) {
        model.addAttribute("listStudents", studentService.listStudents());
        return "student_list";
    }
    
    @RequestMapping(value = "/student/edit", method = RequestMethod.POST)
    public String editStudent(
            @Valid @ModelAttribute("student") Student student,
            BindingResult bindingResult) {
        
        if (bindingResult.hasErrors()) {
            return "student_form";
        } else {  
            studentService.editStudent(student);        
            return "redirect:/student/list";
        }
    }


    @RequestMapping(value = "/student/delete/{id}", method = RequestMethod.POST)
    public String deleteStudent(@PathVariable("id") int id, Model model) {
        Student student = studentService.getStudentById(id);
        studentService.deleteStudent(student);
        return "redirect:/student/list";
    }    

    
}
