package com.codezmr.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ValidationFilter implements Filter {

	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException 
	{
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException 
	{
		String name2 = req.getParameter("name1");
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String gender2 = req.getParameter("gender1");
		String city2 = req.getParameter("city1");
		
		ValidationServerSide validations = new ValidationServerSide();
		
		if(!validations.nameValidate(name2)) 
		{
			RequestDispatcher rd1 = req.getRequestDispatcher("register.jsp");
			rd1.include(req, resp);
			
			
			
		}
		else if(!validations.emailValidate(email2)) 
		{
			RequestDispatcher rd1 = req.getRequestDispatcher("register.jsp");
			rd1.include(req, resp);
		}
		else if(!validations.passwordValidate(pass2)) 
		{
			RequestDispatcher rd1 = req.getRequestDispatcher("register.jsp");
			rd1.include(req, resp);
		}
		else if(gender2 == null || gender2.equals("")) 
		{
			RequestDispatcher rd1 = req.getRequestDispatcher("register.jsp");
			rd1.include(req, resp);
		}
		else if(city2 == null || city2.equals("")) 
		{
			RequestDispatcher rd1 = req.getRequestDispatcher("register.jsp");
			rd1.include(req, resp);
		}
		else {
			chain.doFilter(req, resp);
		}
	}
	
	@Override
	public void destroy() 
	{
		
	}
}
