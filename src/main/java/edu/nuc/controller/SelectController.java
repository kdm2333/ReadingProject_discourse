package edu.nuc.controller;/**
 * Created by 57180 on 2019/5/28.
 */

import edu.nuc.entity.Book;
import edu.nuc.service.BookService;
import edu.nuc.service.UserCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: ReadingProject
 * @description:
 * @author: 李柏君
 * @create: 2019-05-28 15:57
 **/
@Controller
@RequestMapping("select")
public class SelectController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserCommentService userCommentService;

    @RequestMapping("/select")
    public String select(String selectWords, Model model){

        model.addAttribute("selectWords",selectWords);

        List<Book> books = bookService.selectBookListByBookName(selectWords);
        if(books!=null&&books.size()>0){
            model.addAttribute("select",1);
        }
        model.addAttribute("bookname",books);

        List<Book> booksByAuthor = bookService.selectBookListByAuthor(selectWords);
        if(books!=null&&books.size()>0){
            model.addAttribute("select",2);
        }
        model.addAttribute("bookauthor",booksByAuthor);

        return "select";
    }

}
