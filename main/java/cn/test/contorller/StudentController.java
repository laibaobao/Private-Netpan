package cn.test.contorller;

import cn.test.domain.Student;
import cn.test.service.StudentService;
import cn.test.utils.MyMail;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 该类对浏览器的请求进行相应的处理，
 * 包括请求的页面数据，响应追加的页面数据
 *
 */
@Controller
@RequestMapping("/Student")
public class StudentController {

    //文件存储的根路径
    private static final String rootpath = "F:\\userspace\\";
    //MD5 加盐
    private static final String key = "super";
    private static final String activecode = "acode";

    private static HashMap<String,Boolean> activeCode = new HashMap<String, Boolean>();

    //spring框架自动注入相应的服务类
    @Autowired
    private StudentService studentService;

    @RequestMapping("/moveup.do")
    public String moveup(){
        return "signup";
    }

    //注册模块

    /**
     * @param student 浏览器返回的用户数据
     * @param attr 重定向对象
     * @return 返回一个字符串以指定一个返回的JSP页面
     */
    @RequestMapping("/up.do")
    public String up(Student student,RedirectAttributes attr){

        String s = studentService.selectemail(student.getEmail());
        //检查是否注册
        if(null==s) {

            String address = student.getEmail();
            String password = student.getPassword();
            //生成邮箱激活码
            String code = DigestUtils.md5Hex(address+activecode);
            StudentController.activeCode.put(code,false);
            MyMail.sendMail(address,code);

            /*
             * 生成md5，防止明文存储
             */

            password = DigestUtils.md5Hex(password);
            password = DigestUtils.md5Hex(password+key);
            /**
             * 生成邮箱激活文件
             */


            /**
             * 分配生成初始页面的数据
             */
            String path = "{\"name\":\"开始\",\"files\":[],\"dirs\":[]}";
            String name = address.split("@")[0];

            System.out.println("收到注册请求");

            student.setName(name);
            student.setFilepathData(path);
            student.setPassword(password);
            System.out.println(student.toString());
            /*
             * 将注册好的用户信息存储至数据库
             */
            studentService.insertOne(student);

            //返回登陆页面
            return "redirect:/";
        }else {
            attr.addAttribute("error",1);
            //返回注册页面
            return "signup";
        }

    }

    @RequestMapping("/active.do")
    @ResponseBody
    public String activeAct(String code){

        System.out.println("激活成功");
        if(StudentController.activeCode.containsKey(code)){
            activeCode.put(code,true);
            System.out.println("code:"+code);
        }

        return "successful";
    }
    //登陆模块

    /**
     * @param s 浏览器返回的用户数据
     * @param model JSP需要的数据
     * @param attr 重定向对象
     * @return 返回一个字符串以指定一个返回的JSP页面
     */
    @RequestMapping("/in.do")
    public String in(Student s, Model model, RedirectAttributes attr){

        //根据用户填写的用户与密码数据与数据库的内容进行比对，密码需要经过MD5转换
        String password = DigestUtils.md5Hex(DigestUtils.md5Hex(s.getPassword())+key);
        s.setPassword(password);
        Student student=studentService.selectOne(s);
        //是否为空


        if(null!=student&&
                StudentController.activeCode.get(DigestUtils.md5Hex(student.getEmail()+activecode))) {


                //根据id生成用户空间的文件路径
                String filepath = rootpath + student.getStudent_Id();
                File userdir = new File(filepath);
                if (!userdir.exists()) {
                    userdir.mkdir();
                }
                //追加返回的页面数据
                model.addAttribute("now", student);
                System.out.println(student.toString());
                //跳转至用户空间页面
                return "gg";

        }
        else{
            //返回错误信息
            attr.addFlashAttribute("error", 1);
            //跳转至当前页面
            return "redirect:/";
        }
    }


    //注销模块

    /**
     * @param student_Id  浏览器返回的用户ID
     * @param filepathData 浏览器返回的用户空间页面的数据
     * @return
     */
    @RequestMapping("/out.do")
    @ResponseBody
    public String out(String student_Id,String filepathData){

        //根据id判断用户
        Student s = studentService.selectId(student_Id);

        s.setFilepathData(filepathData);
        //更新用户空间的页面数据
        studentService.updateOne(s);

        return "";
    }



    //上传模块

    /**
     *
     * @param fileUpload 文件数据流
     * @param email 用户表识
     * @param file 文件名
     * @return
     * @throws IOException 将io异常抛出
     */
    @RequestMapping("/upload.do")
    @ResponseBody
    public String upload(MultipartFile fileUpload,@RequestParam(value = "filrs") String email,String file) throws IOException {

        //生成上传文件的文件路径
        String path = rootpath+email;
        String fileName = fileUpload.getOriginalFilename();
        System.out.println(file);

        File user = new File(path,file);
        System.out.println(user.getAbsolutePath());
        if(!user.exists()){
            user.mkdir();
        }

        //将文件数据流传入文件对象
        fileUpload.transferTo(user);
        System.out.println("email = "+email);

        return "";
    }


    //下载模块
    /**
     * @param dir 用户空间的路径
     * @param downfile 需要下载文件的文件名
     * @param ofile 原文件名
     * @param response http响应报文
     * @throws IOException 抛出IO异常
     */
    @RequestMapping("/download.do")
    @ResponseBody
    public void download(@RequestParam(value = "filrs") String dir,@RequestParam(value = "file")String downfile,String ofile,HttpServletResponse response) throws IOException {

        //生成下载文件的路径
        String path = rootpath+dir+"\\"+downfile;

        System.out.println(path);
        File file = new File(path);

        if(!file.exists()){
            response.setContentType("text/html;charset=UTF-8");
            System.out.println("文件不存在");
            return;
        }

        //生成文件流对象，用于处理文件
        InputStream bis = new BufferedInputStream(new FileInputStream(file));
        String filename = URLEncoder.encode(ofile,"UTF-8");

        //设置响应报文的格式为文件流
        response.setHeader("content-disposition","attachment;filename="+filename);
        response.setContentType("multipart/form-data");

        //将response输出流包装为输出流作为文件输出
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        //开始发送
        //判断结束符
        int len =0;
        //使用缓冲区，减少磁盘IO
        byte[] buffer = new byte[1024];
        while((len=bis.read(buffer))!=-1){
            System.out.println(len);
            out.write(buffer,0,len);
            //立即刷新至输出对象
            out.flush();
        }
        System.out.println("结束发送");
        out.close();
        bis.close();
    }

    //删除模块
    @RequestMapping("/delete.do")
    @ResponseBody
    public String deletefile(String filrs,String file){

        //生成删除文件的路径
        String path = rootpath+filrs+"\\"+file;
        File deletefile = new File(path);

        if(deletefile.exists()){
            //删除文件
            deletefile.delete();
            return "";
        }else {
            return "";
        }
    }
}
