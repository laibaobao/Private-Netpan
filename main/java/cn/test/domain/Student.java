package cn.test.domain;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable {

    private Integer student_Id;
    private String name;
    private String password;
    private String email;
    private String filepathData;

    public Integer getStudent_Id() {
        return student_Id;
    }

    public void setStudent_Id(Integer student_Id) {
        this.student_Id = student_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFilepathData() {
        return filepathData;
    }

    public void setFilepathData(String filepathData) {
        this.filepathData = filepathData;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "student_Id=" + student_Id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", filepathData='" + filepathData + '\'' +
                '}';
    }
}

