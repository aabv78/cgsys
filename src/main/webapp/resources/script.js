function disableForm(form, status) {
//alert('Test');
    if (form == 'course') {
        document.getElementById("courseName").disabled = status;
        document.getElementById("courseCredits").disabled = status;
    }

    if (form == 'student') {
        document.getElementById("studentFirstName").disabled = status;
        document.getElementById("studentLastName").disabled = status;
        document.getElementById("studentEmail").disabled = status;
        document.getElementById("studentAddress").disabled = status;
        document.getElementById("studentPhone").disabled = status;
        document.getElementById("studentCity").disabled = status;
        document.getElementById("studentState").disabled = status;
        document.getElementById("studentCountry").disabled = status;
        document.getElementById("studentBirthday").disabled = status;
        document.getElementById("studentOrganization").disabled = status;
        document.getElementById("studentGenderM").disabled = status;
        document.getElementById("studentGenderF").disabled = status;
    }


    if (form == 'teacher') {
        document.getElementById("teacherFirstName").disabled = status;
        document.getElementById("teacherLastName").disabled = status;
        document.getElementById("teacherAddress").disabled = status;
        document.getElementById("teacherCity").disabled = status;
        document.getElementById("teacherCountry").disabled = status;
        document.getElementById("teacherPhone").disabled = status;
        document.getElementById("teacherSalary").disabled = status;
    }

    if (form == 'result') {
        document.getElementById("courseId").disabled = status;
        document.getElementById("resultSession").disabled = status;
        document.getElementById("resultMark").disabled = status;
    }



}

function validateFormResult() {
    var x = document.forms["Form"]["resultSession"].value;
    var msg = "Session number is a number between 101 and 1299";

    sx = x.trim() + "";
    //alert("|" + x + "|");
    if (sx.length > 0) {
        if (!isNaN(sx)) {
            if (x < 101 || x > 1299) {
                alert(msg);
                return false;
            }
        }
    }

    var y = document.forms["Form"]["resultMark"].value;
    sy = y.trim() + "";
    msg = "Mark is a number between 0 and 20";
    if (sy.length > 0) {
        if (!isNaN(y)) {
            if (y < 0 || y > 20) {
                alert(msg);
                return false;
            }
        }
    }


}

function confirmDelete (){
    var result=confirm('Are you sure you want to delete this item?');
    return result;
    
}