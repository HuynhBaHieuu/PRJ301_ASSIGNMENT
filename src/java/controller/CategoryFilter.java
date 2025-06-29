//package controller;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.List;
//import model.Category;
//import service.CategoryService;
//
//@WebFilter("/*")
//public class CategoryFilter implements Filter {
//    private CategoryService categoryService;
//
//    @Override
//    public void init(FilterConfig filterConfig) {
//        categoryService = new CategoryService();
//    }
//
//    @Override
//    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
//            throws IOException, ServletException {
//
//        HttpServletRequest request = (HttpServletRequest) req;
//        HttpSession session = request.getSession();
//
//        if (session.getAttribute("categories") == null) {
//            List<Category> categories = categoryService.getAllCategories();
//            session.setAttribute("categories", categories);
//        }
//
//        chain.doFilter(req, res);
//    }
//} 