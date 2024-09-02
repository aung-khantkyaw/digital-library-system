
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>

<%@ page import="java.util.List"%>
<%
String ebook = request.getParameter("ebook");
%>
<style>
.pdf-page {
	margin: 10px 0;
}

canvas {
	border: 1px solid black;
}
</style>

<section class="section">
	<div id="pdf-container"></div>
 
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>
	<script>
        const url = '../book_info_files/<%=ebook%>'; // Path to the PDF file

        pdfjsLib.getDocument(url).promise.then(function(pdfDoc) {
            const pdfContainer = document.getElementById('pdf-container');
            
            const numPages = pdfDoc.numPages;

            for (let pageNum = 1; pageNum <= numPages; pageNum++) {
                pdfDoc.getPage(pageNum).then(function(page) {
                    const scale = 1;
                    const viewport = page.getViewport({ scale });

                    const canvas = document.createElement('canvas');
                    const context = canvas.getContext('2d');
                    canvas.className = 'pdf-page';
                    canvas.height = viewport.height;
                    canvas.width = viewport.width; 
                    pdfContainer.appendChild(canvas);

                    const renderContext = {
                        canvasContext: context,
                        viewport: viewport
                    };
                    page.render(renderContext).promise.then(function() {
                        console.log(`Page ${pageNum} rendered`);
                    });
                });
            }
        }).catch(function(error) {
            console.error('Error loading PDF:', error);
        });
    </script>
</section>

<%@ include file="../layout/footer.jsp"%>
<%
} else {
response.sendRedirect("../index.jsp");
}
%>