<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

<!DOCTYPE html><!-- #84BD32 green -->
<html lang="en"> 
	<head>
		<title>My Documents - Document Search Tool</title>  
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="shortcut icon" href="<core:url value="/favicon.ico" />" type="image/x-icon">		

		<link rel="stylesheet" href="<core:url value="/resources/css/template.css" />" type="text/css" media="all">
		<link rel="stylesheet" href="<core:url value="/resources/css/color.css" />"> 
		<link rel="stylesheet" href="<core:url value="/resources/css/css.css" />" type="text/css">
		<link rel="stylesheet" href="<core:url value="/resources/css/layout.css" />" type="text/css" >
		
		<script type="text/javascript" src="<core:url value="/resources/js/jquery-1.js" />"></script>
	</head>
	<body> 
		<div id="container" >
			
			<div id="header">
				<core:import url="/resources/layouts/header.jsp" />
			</div>
			
			<div id="body">
			
				<div class="site-wrapper">
					<div class="site-body">		
						
						<div class="page-title">
							<div class="pe-container">
								<h1>My Uploaded Documents</h1>
							</div>
						</div> 
						
						<br/><br/>
						
						<div class="pe-container">
							<div >
								<p>
									<span class="accent">My Uploaded Documents</span> allows you to <span class="accent">view</span>, <span class="accent">print</span>, <span class="accent">download</span> and <span class="accent">delete</span> your uploaded documents. 
									You can always come here and perform any operation listed before.	
									<br /><br/>
									Those uploaded documents, are going to <span class="accent">identify your profile</span> when some search is 
									being performed. They will not be available on your searches. It means that you wont 
									be able to find your own items but the ones shared by other 
									users, who share a profile like yours.   
								</p>
							</div>
							
							<div>
							
								<core:choose>
									
									<%-- IF NO SHARED DOCUMENTS BY THE USER --%>
									<core:when test="${noOfPages eq 0}">
										<blockquote>
											<h2>You have no shared documents</h2>
											<p style="margin-top: 10px;font-size: 12px">
											This message could be due to some deletition or simply because you just started a new account.<br/>
											To shutdown this message you need to start your profile by uploading your research articles on the top menu <b>upload</b>.
											</p>
										</blockquote>
									</core:when>
									
									<%-- SHARED DOCUMENTS RESULT --%>
									<core:otherwise>
										<%-- RESULT PAGINATION --%>
									    <table style="width: 100%;">
									        <tr>
									            <th><h3>TYPE</h3></th>
									            <th><h3>DOCUMENT NAME</h3></th>
												<th style="text-align: right;"><h3>ACTION</h3></th>							            
									        </tr>
											<core:forEach var="document" items="${documents}">
									        	<tr>
									        		<td>
									        			<img alt="PDF Document" src="<core:url value="/resources/img/red_pdf.png" />" />
									        		</td>
											   		<td>
											   			<a class="fancybox fancybox.iframe" href="<core:url value="/FileViewerService?service=view&page=${currentPage}&dc=${document.articleid}&lang=en" />"><h5>${document.name}</h5></a>
											   		</td>
											   		<td>
											   			<a href="<core:url value="/DeleteDocumentAction?service=del&page=${currentPage}&dc=${document.articleid}&dn=${document.name}&lang=en" />">
											   				<img alt="delete document"  src="<core:url value="/resources/img/delete.png" />" style="margin:auto;float: right;">
											   			</a>
											   		</td>
											  	</tr>
											</core:forEach>										
										</table>
									    
									    <%-- PAGINATION --%>
										<div style="width: 1000px; margin-bottom: 30px;margin-top: 30px;">
											<div class="row-fluid project-pagination results">
												<div class="span12 clearfix">
														    		
												    <%-- PREVIUS LINK --%>
												    <core:if test="${currentPage != 1}">
												       <a href="<core:url value="/DocumentsInboxService?service=ldmt&page=${currentPage - 1}&lang=en" />" class="prev-btn">Prev</a>
												    </core:if>					
												    
												    <%-- PAGE NUMBER AND CURRENT PAGE --%>
												    <core:if test="${noOfPages gt 1}" >
														<ul>
												            <core:forEach var="i" begin="1" end="${noOfPages}" >
												                <core:choose>
												                    <core:when test="${currentPage eq i}">
												                        <li class="selected"><a>${i}</a></li>
												                    </core:when>
												                    <core:otherwise>
												                        <a href="<core:url value="/DocumentsInboxService?service=ldmt&page=${i}" />">${i}</a>
												                    </core:otherwise>
												                </core:choose>
												            </core:forEach>												
														</ul>
													</core:if>
												    
												    <%-- NEXT LINK --%>
												    <core:if test="${currentPage lt noOfPages}">
												        <a href="<core:url value="/DocumentsInboxService?service=ldmt&page=${currentPage + 1}&lang=en" />" class="next-btn">Next</a>
												    </core:if>
												    		
												</div>
											</div>
										</div>
																    
									</core:otherwise>
									
								</core:choose>
								
								<core:if test="${noOfPages gt 0}">
				       				<h3 style="color: #777777;">Number of documents :<span class="accent"> ${affectedRows}</span></h3>
				    			</core:if>
				    			
							</div>
							
						</div>
						
					</div>
				</div>
							
			</div>	
														
			<div id="footer">					
				<%--calling footer --%>
				<core:import url="/resources/layouts/footer.jsp" />
			</div>
			
		</div>
	</body>
</html>