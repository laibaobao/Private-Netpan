package cn.test.dao;

import cn.test.domain.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentDao {

    /**
     * 根据账号密码查询数据库记录
     * @param student 需查询的实体对象
     * @return 查询到的结果封装为一个实体对象
     */
    @Select("select * from student where email = #{email} and password =#{password}")
    public Student selectOne(Student student);

    /**
     * 根据email查询数据库记录
     * @param email 电子邮件地址
     * @return 查询到的电子邮件地址
     */
    @Select("select email from student where email = #{email} ")
    public String selectemail(String email);

    /**
     * 根据student_Id查询将结果封装为实体对象
     * @param student_Id 用户ID
     * @return 查询将结果封装为实体对象
     */
    @Select("select * from student where student_Id = #{student_Id} ")
    public Student selectId(String student_Id);

    /**
     *
     * @return 以链表形式返回表的结果集
     */
    @Select("select * from student")
    public List<Student> findAll();

    /**
     *
     * @param s 将实体对象的信息插入数据库
     */
    @Insert("insert into student(student_Id,name,password,email,filepathData) value(#{student_Id},#{name},#{password},#{email},#{filepathData})")
    public void insertOne(Student s);

    /**
     *
     * @param s 将数据库中对应的记录更新
     */
    @Update("update student set filepathData = #{filepathData} where student_Id = #{student_Id}")
    public void upateOne(Student s);
}
