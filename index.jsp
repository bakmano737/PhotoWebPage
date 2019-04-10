<!DOCTYPE = HTML>
<html>
<head>
	<h1> Gallery Database </h1>
</head>
<body>

<!-- Initialize -->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%! 	String funcID; 
		String galID; String gallery_name; String gallery_desc; 
		String artist_name; String birth_year; String country; String artist_desc; 
		String title; String link; String gallery; String artist; 
		String year; String kind; String width; String height; String location; String img_desc; 
		String imgID; String artistID; String delImgID; String startYear; String endYear; %>

<!-- Get form info -->
<%
	funcID 			= request.getParameter("funcID");
	galID				= request.getParameter("galID");
	gallery_name	= request.getParameter("gallery_name");
	gallery_desc	= request.getParameter("gallery_desc");
	artist_name	= request.getParameter("artist_name");
	birth_year		= request.getParameter("birth_year");
	country			= request.getParameter("country");
	artist_desc	= request.getParameter("artist_desc");
	title 				= request.getParameter("title");
	link 				= request.getParameter("link");
	gallery			= request.getParameter("gallery");
	artist				= request.getParameter("artist");
	year				= request.getParameter("year");
	kind				= request.getParameter("kind");
	width				= request.getParameter("width");
	height			= request.getParameter("height");
	location			= request.getParameter("location");
	img_desc		= request.getParameter("img_desc");
	imgID			= request.getParameter("imgID");
	artistID			= request.getParameter("artistID");
	delImgID		= request.getParameter("delImgID");
	startYear		= request.getParameter("startYear");
	endYear		= request.getParameter("endYear");
%>

<!-- Stylesheet -->
<style>
#Tools {
	float:left;
	width:100%
	padding:10px;
	margin:5px;
}

#List {
	float:left;
	width:150px;
	padding:10px;
	margin: 5px;
}

#AddGal {
	float:left;
	width:250px;
	padding:10px;
	margin: 5px;
}

#AddArtist {
	float:left;
	width:250px;
	padding:10px;
	margin: 5px;
}

#AddImg {
	float:left;
	width:400px;
	padding:10px;
	margin: 5px;
}

#ImageFields {
	float:left;
	width:50%
	padding:5px;
	margin:5px;
}

#ImageDetails {
	float:left;
	width:50%
	padding:5px;
	margin:5px;
}

#ImageButton {
	margin-left:auto;
	margin-right:auto;
	width:70%
	padding:5px;
	margin:5px;
}

#Search {
	float:left;
	padding:10px;
	margin: 5px;
}

#SearchType {
	float:left;
	padding:10px;
	margin:5px;
}

#SearchYear {
	float:left;
	padding:10px;
	margin:5px;
}

#SearchArtist {
	float:left;
	padding:10px;
	margin:5px;
}

#SearchLocation {
	float:left;
	padding:10px;
	margin:5px;
}

#SearchCountry {
	float:left;
	padding:10px;
	margin:5px;
}

#SearchBirthYear {
	float:left;
	padding:10px;
	margin:5px;
}

#ImageContainer {
	float:left;
	padding:10px;
	margin:5px;
}

#title {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
	
#img {
    background-color:#eeeeee;
    float:right;
    padding:5px; 
}

#details {
	float:left;
	width:250px;
    padding:10px; 
	
}

#in {
	float: right;
}
</style>

<div id="Tools">
	<div id="List">
	<!-- Form for Listing Galleries -->
	<form method="post">
		<input name="funcID" type="hidden" value="1">
		<input type="submit" value="List All Galleries"/>
	</form>

	<!-- Form for listing images in a gallery -->
	<b>List All Images in a Gallery:</b>
	<form method="post">
		<input name="funcID" type="hidden" value="2">
		<input name="galID"  type="number" style="width:50px">
		<input type="submit" value="GO!"/>
	</form>
	</div>

	<div id="AddGal">
	<!-- Form for creating a gallery -->
	<b>Add a Gallery:</b>
	<form method="post">
		<input name="funcID" type="hidden" value="5">
		Gallery Name: 			<input id = "in" name="gallery_name" size = "10" type="text"><br><br>
		Gallery Description:	<input id = "in" name="gallery_desc" size = "10" type="text"><br>
		<input type="submit" value="GO!"/>
	</form>
	</div>

	<div id="AddArtist">
	<!-- Form for creating an artist -->
	<b>Add an Artist:</b>
	<form method="post">
		<input name="funcID" type="hidden" value="6">
		Artist Name:			<input id = "in" name="artist_name"	size = "10" type="text"><br><br>
		Birth Year: 			<input id = "in" name="birth_year"		size = "10" type="text"><br><br>
		Country: 				<input id = "in" name="country"			size = "10" type="text"><br><br>
		Artist Description:	<input id = "in" name="artist_desc"		size = "10" type="text"><br>
		<input type="submit" value="GO!"/>
	</form>
	</div>

	<div id="AddImg">
	<!-- Add a new image to a gallery -->
	<b> Add an Image </b>
	<form method="post">
		<input name="funcID" type="hidden" value="7">
		<div id="ImageFields">
		Image title:		<input id = "in" name="title"			size = "10" type="text"><br><br>
		Image URL:		<input id = "in" name="link"			size = "10" type="text"><br><br>
		Gallery:				<input id = "in" name="gallery"		size = "10" type="number" style="width:50px"><br><br>
		Artist:				<input id = "in" name="artist"			size = "10" type="number" style="width:50px"><br><br>
		</div>
		<div id="ImageDetails">
		<b>Details:</b><br>
		Year:				<input id = "in" name="year"			size = "10" type="text"><br><br>
		Type:				<input id = "in" name="kind"			size = "10" type="text"><br><br>
		Width:				<input id = "in" name="width"			size = "10" type="text"><br><br>
		Height				<input id = "in" name="height"		size = "10" type="text"><br><br>
		Location:			<input id = "in" name="location"		size = "10" type="text"><br><br>
		Description:		<input id = "in" name="img_desc"	size = "10" type="text"><br><br>
		</div>
		<div id="ImageButton">
		<input type="submit" value="Submit"/>
		</div>
	</form>
	</div>
</div>


<!-- Search Features -->
<div id="Search">
	<!-- Search by Type -->
	<div id="SearchType">
	<b>Image by type:</b>
	<form method="post">
					<input name="funcID" type="hidden" value="12">
		Type:	<input name="kind" size = "10" type="text">
					<input type="submit" value="Search"/><br>
	</form>
	</div>

	<!-- Image by Year -->
	<div id="SearchYear">
	<b>Image by year:</b> 
	<form method="post">
					<input name="funcID" type="hidden" value="13">
		Start:	<input name="startYear" type="number"><br>
		End: 	<input name="endYear" type="number">
					<input type="submit" value="Search"/><br>
	</form>
	</div>
	
	<!-- Image by artist -->
	<div id="SearchArtist">
	<b>Image by artist:</b> 
	<form method="post">
					<input name="funcID" type="hidden" value="14">
		Artist:	<input name="artist_name" type="text">
					<input type="submit" value="Search"/><br>
	</form>
	</div>
	
	<!-- Image by location -->
	<div id="SearchLocation">
	<b>Image by location:</b> 
	<form method="post">
						<input name="funcID" type="hidden" value="15">
		Location:	<input name="location" type="text">
						<input type="submit" value="Search"/><br>
	</form>
	</div>
	
	<!-- Artist by country -->
	<div id="SearchCountry">
	<b>Artist by country:</b>
	<form method="post">
					<input name="funcID" type="hidden" value="16"> 
		Country:<input name="country" type="text">
					<input type="submit" value="Search"/><br>
	</form>
	</div>
	
	<!-- Artis by birth year -->
	<div id="SearchBirthYear">
	<b>Artist by birth year:</b> 
	<form method="post">
				<input name="funcID" type="hidden" value="17">
		Year:<input name="year" type="number">
				<input type="submit" value="Search"/><br>
	</form>
	</div>
</div>

<!-- Load the SQL Driver -->
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		out.println("Can't load mysql driver!");
		out.println(e.toString());
	}
%>

<!-- Add an image to the image table -->
<% 
	if(funcID!=null) 
	{				
		try 
		{
			String url="jdbc:mysql://127.0.0.1:3306/gallery";
			String id="gallery";
			String pwd="eecs118";
			Connection con= DriverManager.getConnection(url,id,pwd); 
		
			int func=Integer.valueOf(funcID);
			int tally = 0;
			int tmpID = 0;
			String tempID = "";
			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;
			String sql;
			String detailForm;
			String detailFuncID;
			String detailImgID;
			String detailButton;
			String detail;
			String modifyForm;
			String modifyFuncID;
			String modifyImgID;
			String modifyButton;
			String modify;
			String deleteForm;
			String deleteFuncID;
			String deleteImgID;
			String deleteButton;
			String delete;
			String sqlSELECT;
			String sqlFROM;
			String sqlWHERE;
			String sqlUPDATE;
			String sqlSET;
			switch(func) {
				case 1:
					// List all of the galleries
					stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
					sql="SELECT * FROM gallery";
					rs=stmt.executeQuery(sql); // Result set get the result of the SQL query
					out.println("<table border=\"1\">");
					out.println("<caption> Gallery List </caption>");
					out.println("<tr>");
					out.println("<th>ID</th>");
					out.println("<th>Name</th>");
					out.println("<th>Description</th>");
					out.println("</tr>");
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>"+rs.getString("gallery_id")+"</td>");
						out.println("<td>"+rs.getString("name")+"</td>");
						out.println("<td>"+rs.getString("description")+"</td>");
						out.println("</tr>");
					}
					//rs.close();
					//stmt.close();
					out.println("</table>");
					break;
				case 2:					
					// List all images in a gallery
					stmt = con.createStatement();
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.gallery, gallery.image ";
					sqlWHERE = "WHERE gallery.gallery_id=image.gallery_id AND gallery.gallery_id="+galID;
					sql= sqlSELECT + sqlFROM + sqlWHERE;
					rs=stmt.executeQuery(sql);
					generateImageTable(rs, "name", out);
					rs.close();
					stmt.close();
					break;
				case 3:
					// Details of an image
					// String buttonID has the image_id of the image of interest
					// Natural join the image, detail, and artist tables'
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.image, gallery.detail, gallery.artist ";
					sqlWHERE = "WHERE image.image_id=detail.image_id AND image.artist_id=artist.artist_id AND image.image_id="+imgID;
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					while(rs.next())
					{
						// Create a form with a button to put next to the artist name
						detailForm = "<form method=\"post\">";
						detailFuncID = "<input name=\"funcID\" type=\"hidden\" value=4>";
						detailImgID = "<input name =\"imgID\" type=\"hidden\" value=\""+rs.getString("image.image_id")+"\">";
						detailButton = "<button type=\"sumbit\">Details</button></form>";
						detail = detailForm+detailFuncID+detailImgID+detailButton;
						
						// Create the delete button
						deleteForm = "<form method=\"post\">";
						deleteFuncID = "<input name=\"funcID\" type=\"hidden\" value=8>";
						deleteImgID = "<input name =\"delImgID\" type=\"hidden\" value=\""+rs.getString("image_id")+"\">";
						deleteButton = "<button type=\"sumbit\">Delete</button></form>";
						
						// Print the results
						out.println("<div id=\"ImageContainer\">");
						out.println("<div id=\"title\"><h1>"+rs.getString("title")+"</h1></div>");
						out.println("<div id=\"img\"><img src=\""+rs.getString("link")+"\" alt=\""+rs.getString("title")+"\"></div>");
						out.println("<div id=\"details\">");
						out.println(rs.getString("name")+detail);
						out.println(rs.getString("year")+"<br>");
						out.println(rs.getString("kind")+"<br>");
						out.println(rs.getString("width")+"<br>");
						out.println(rs.getString("height")+"<br>");
						out.println(rs.getString("location")+"<br>");
						out.println(rs.getString("description")+"<br>");
						delete = deleteForm + deleteFuncID + deleteImgID + deleteButton;
						out.println(delete+"<br>");
						out.println("</div>");
						out.println("</div>");
					}
					rs.close();
					stmt.close();
					break;
				case 4:
					// Details of an artist (w/ the image that initiated the request
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.image, gallery.detail, gallery.artist ";
					sqlWHERE = "WHERE image.image_id=detail.image_id AND image.artist_id=artist.artist_id AND image.image_id="+imgID;
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					while(rs.next())
					{						
						// Create the delete button
						deleteForm = "<form method=\"post\">";
						deleteFuncID = "<input name=\"funcID\" type=\"hidden\" value=8>";
						deleteImgID = "<input name =\"delImgID\" type=\"hidden\" value=\""+rs.getString("image_id")+"\">";
						deleteButton = "<button type=\"sumbit\">Delete</button></form>";
						
						// Print the results
						out.println("<div id=\"ImageContainer\">");
						out.println("<div id=\"title\"><h1>"+rs.getString("title")+"</h1></div>");
						out.println("<div id=\"img\"><img src=\""+rs.getString("link")+"\" alt=\""+rs.getString("title")+"\"></div>");
						out.println("<div id=\"details\">");
						out.println(rs.getString("name")+"<br>");
						out.println(rs.getString("birth_year")+"<br>");
						out.println(rs.getString("country")+"<br>");
						out.println(rs.getString("artist.description")+"<br>");
						out.println(rs.getString("year")+"<br>");
						out.println(rs.getString("kind")+"<br>");
						out.println(rs.getString("width")+"<br>");
						out.println(rs.getString("height")+"<br>");
						out.println(rs.getString("location")+"<br>");
						out.println(rs.getString("detail.description")+"<br>");
						delete = deleteForm + deleteFuncID + deleteImgID + deleteButton;
						out.println(delete+"<br>");
						out.println("</div>");
						out.println("</div>");
					}
					rs.close();
					stmt.close();
					break;
				case 5:
					// Create a gallery
					// PreparedStatements can use variables and are more efficient
					pstmt = con.prepareStatement("insert into gallery values (default,?,?)",Statement.RETURN_GENERATED_KEYS);
					// Use ? to represent the variables
					pstmt.clearParameters();
					// Parameters start with 1
					pstmt.setString(1, gallery_name);
					pstmt.setString(2, gallery_desc);
					pstmt.executeUpdate();
					rs=pstmt.getGeneratedKeys();
					while (rs.next()) {
						out.println("Successfully added. Gallery_ID:"+rs.getInt(1));
					}
					rs.close();
					pstmt.close();
					break;
				case 6:
					// Create an artist
					// PreparedStatements can use variables and are more efficient
					pstmt = con.prepareStatement("insert into artist values (default,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
					// Use ? to represent the variables
					pstmt.clearParameters();
					// Parameters start with 1
					pstmt.setString(1, artist_name);
					pstmt.setString(2, birth_year);
					pstmt.setString(3, country);
					pstmt.setString(4, artist_desc);
					pstmt.executeUpdate();
					rs=pstmt.getGeneratedKeys();
					while (rs.next()) {
						out.println("Successfully added. Artist_ID:"+rs.getInt(1));
					}
					rs.close();
					pstmt.close();
					break;
				case 7:
					// Add an image
					// PreparedStatements can use variables and are more efficient
					pstmt = con.prepareStatement("insert into image values (default,?,?,?,?,NULL)",Statement.RETURN_GENERATED_KEYS);
					// Use ? to represent the variables
					pstmt.clearParameters();
					// Parameters start with 1
					pstmt.setString(1, title);
					pstmt.setString(2, link);
					pstmt.setString(3, gallery);
					pstmt.setString(4, artist);
					pstmt.executeUpdate();
					rs=pstmt.getGeneratedKeys();
					while (rs.next()) {
						tempID = rs.getString(1);
						out.println("Successfully added. Image_ID:"+rs.getInt(1)+"<br>");
					}
					rs.close();
					pstmt.close();
					
					// Add the details
					pstmt = con.prepareStatement("insert into detail values (default,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
					// Use ? to represent the variables
					pstmt.clearParameters();
					// Parameters start with 1
					pstmt.setString(1, tempID);
					pstmt.setString(2, year);
					pstmt.setString(3, kind);
					pstmt.setString(4, height);
					pstmt.setString(5, width);
					pstmt.setString(6, location);
					pstmt.setString(7, img_desc);
					pstmt.executeUpdate();
					rs=pstmt.getGeneratedKeys();
					while (rs.next()) {
						out.println("Successfully added. Detail_ID:"+rs.getInt(1)+"<br>");
					}
					rs.close();
					pstmt.close();
					break;
				case 8:
					// Delete an image and its details
					// The delete command is given either from the list or from the details
					stmt = con.createStatement();
					sql="DELETE image FROM image WHERE image.image_id = "+delImgID;
					stmt.executeUpdate(sql);
					rs=stmt.getGeneratedKeys();
					while (rs.next()) {
						out.println("Successfully deleted. Image_ID:"+rs.getInt(1)+"<br>");
					}
					rs.close();
					stmt.close();
					// Delete the details
					stmt = con.createStatement();
					sql="DELETE detail FROM detail WHERE detail.image_id = "+delImgID;
					stmt.executeUpdate(sql);
					rs=stmt.getGeneratedKeys();
					while (rs.next()) {
						out.println("Successfully deleted. Detail_ID:"+rs.getInt(1)+"<br>");
					}
					rs.close();
					stmt.close();
					break;
				case 9:
					// Modify the details of an image
					// Modify command is from same places as delete
					// TODO: Finish implementing modify details of an image
					// First create a new input form
					tmpID = Integer.valueOf(imgID);
					out.println("<b> Modify an Image's Details: </b>");
					out.println("<form method=\"post\">");
					out.println("<input name=\"funcID\" type=\"hidden\" value=\"18\">");
					out.println("<input name=\"imgID\"  type=\"hidden\" value=\""+tmpID+"\">");
					out.println("Image title:		<input name=\"title\"			type=\"text\">");
					out.println("Image URL:		<input name=\"link\"			type=\"text\">");
					out.println("Gallery ID:		<input name=\"gallery\"		type=\"number\">");
					out.println("Artist ID:			<input name=\"artist\" 		type=\"number\"><br>");
					out.println("<b>Details:</b><br>");
					out.println("Year:				<input name=\"year\"			type=\"text\">");
					out.println("Type:				<input name=\"kind\"			type=\"text\">");
					out.println("Width:				<input name=\"width\"		type=\"text\">");
					out.println("Height				<input name=\"height\"		type=\"text\">");
					out.println("Location:			<input name=\"location\"	type=\"text\">");
					out.println("Description:		<input name=\"img_desc\"	type=\"text\">");
					out.println("<input type=\"submit\" value=\"Submit\"</button>");
					out.println("</form>");
					break;
				case 10:
					break;
				case 12:
					// Find images by type
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.image, gallery.detail ";
					sqlWHERE = "WHERE image.image_id=detail.image_id AND detail.kind=\""+kind+"\"";
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					generateImageTable(rs, "kind", out);
					rs.close();
					stmt.close();
					break;
				case 13:
					// Find image by range of years
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.image, gallery.detail ";
					sqlWHERE = "WHERE image.image_id=detail.image_id AND detail.year>="+startYear+" AND detail.year<="+endYear;
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					generateImageTable(rs, "kind", out);
					rs.close();
					stmt.close();
					break;
				case 14:
					// Find images by artist name
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.image, gallery.artist ";
					sqlWHERE = "WHERE image.artist_id=artist.artist_id AND artist.name=\""+artist_name+"\"";
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					generateImageTable(rs, "name", out);
					rs.close();
					stmt.close();
					break;
				case 15:
					// Find images by location
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.image, gallery.detail ";
					sqlWHERE = "WHERE image.image_id=detail.image_id AND detail.location=\""+location+"\"";
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					generateImageTable(rs, "location", out);
					rs.close();
					stmt.close();
					break;
				case 16:
					// Find artists by country
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.artist ";
					sqlWHERE = "WHERE artist.country=\""+country+"\"";
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					generateArtistTable(rs, "country", out);
					rs.close();
					stmt.close();
					break;
				case 17:
					// Find artists by birth year
					sqlSELECT = "SELECT * ";
					sqlFROM = "FROM gallery.artist ";
					sqlWHERE = "WHERE artist.birth_year=\""+year+"\"";
					sql = sqlSELECT + sqlFROM + sqlWHERE;
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					generateArtistTable(rs, "birth_year", out);
					rs.close();
					stmt.close();
					break;
				case 18:
					// Modify images in a table
					// Update image table
					stmt = con.createStatement();
					sqlUPDATE = "UPDATE image ";
					sqlSET = " SET ";
					sqlWHERE = " WHERE image.image_id="+imgID;
					if(!title.isEmpty())
					{
						out.println("Title not null");
						sqlSET += " image.title=\""+title+"\"";
					}
					if(!link.isEmpty())
					{
						out.println("link not null");
						sqlSET += " image.link=\""+link+"\"";
					}
					if(!artist.isEmpty())
					{
						out.println("Artist not null");
						sqlSET += " image.artist_id="+artist;
					}
					if(!gallery.isEmpty())
					{
						out.println("gallery not null");
						sqlSET += " image.gallery_id="+gallery;
					}
					if(!sqlSET.equals(" SET "))
					{
						sql = sqlUPDATE + sqlSET + sqlWHERE;
						stmt.executeUpdate(sql);
						rs=stmt.getGeneratedKeys();
						while (rs.next()) {
							out.println("Successfully updated. Image_ID:"+rs.getInt(1)+"<br>");
						}
						rs.close();
						stmt.close();
					}
					
					// Update detail table
					stmt = con.createStatement();
					sqlUPDATE = "UPDATE detail ";
					sqlSET = " SET ";
					sqlWHERE = " WHERE detail.image_id="+imgID;
					if(!year.isEmpty())
					{
						sqlSET += "detail.year="+year;
					}
					if(!kind.isEmpty())
					{
						sqlSET += "detail.kind=\""+kind+"\"";
					}
					if(!width.isEmpty())
					{
						sqlSET += "detail.width="+width;
					}
					if(!height.isEmpty())
					{
						sqlSET += "detail.height="+height;
					}
					if(!location.isEmpty())
					{
						sqlSET += "detail.location=\""+location+"\"";
					}
					if(!img_desc.isEmpty())
					{
						sqlSET += "detail.description=\""+img_desc+"\"";
					}
					if(!sqlSET.equals(" SET "))
					{
						sql = sqlUPDATE + sqlSET + sqlWHERE;
						stmt.executeUpdate(sql);
						rs=stmt.getGeneratedKeys();
						while (rs.next()) {
							out.println("Successfully updated. Image_ID:"+rs.getInt(1)+"<br>");
						}
						rs.close();
						stmt.close();
					}
			}
			con.close();
		}
		catch(Exception e)
		{
				e.printStackTrace();
				out.println(e.toString());
		} 	
		
	}
%>

<%! public void generateImageTable(ResultSet rs, String tbl, JspWriter out)
{
	String detailForm;
	String detailFuncID;
	String detailImgID;
	String detailButton;
	String detail;
	String modifyForm;
	String modifyFuncID;
	String modifyImgID;
	String modifyButton;
	String modify;
	String deleteForm;
	String deleteFuncID;
	String deleteImgID;
	String deleteButton;
	String delete;
	int tally = 0;
	try
	{
		if(rs.next())
		{
			out.println("<table border=\"1\">");
			out.println("<caption><b>Images of: " + rs.getString(tbl) + "<b></caption>");
			out.println("<tr>");
			out.println("<th>ID</th>");
			out.println("<th>Title</th>");
			out.println("<th>Link</th>");
			out.println("<th>Details</th>");
			out.println("<th>Modify</th>");
			out.println("<th>Delete</th>");
			out.println("</tr>");
		}
		else
		{
			out.println("Bad query!");
			return;
		}
		rs.beforeFirst();
		while (rs.next()) {
			// Create the button string
			detailForm = "<form method=\"post\">";
			detailFuncID = "<input name=\"funcID\" type=\"hidden\" value=3>";
			detailImgID = "<input name =\"imgID\" type=\"hidden\" value=\""+rs.getString("image_id")+"\">";
			detailButton = "<button type=\"sumbit\">Details</button></form>";
			detail = detailForm+detailFuncID+detailImgID+detailButton;
			
			// Create the modify button string
			modifyForm = "<form method=\"post\">";
			modifyFuncID = "<input name=\"funcID\" type=\"hidden\" value=9>";
			modifyImgID = "<input name =\"imgID\" type=\"hidden\" value=\""+rs.getString("image_id")+"\">";
			modifyButton = "<button type=\"sumbit\">Modify</button></form>";
			modify = modifyForm+modifyFuncID+modifyImgID+modifyButton;
			
			// Create the delete button
			deleteForm = "<form method=\"post\">";
			deleteFuncID = "<input name=\"funcID\" type=\"hidden\" value=8>";
			deleteImgID = "<input name =\"delImgID\" type=\"hidden\" value=\""+rs.getString("image_id")+"\">";
			deleteButton = "<button type=\"sumbit\">Delete</button></form>";
			delete = deleteForm + deleteFuncID + deleteImgID + deleteButton;
			out.println("<tr>");
			out.println("<td>"+rs.getString("image_id")+"</td>");
			out.println("<td>"+rs.getString("title")+"</td>");
			out.println("<td>"+rs.getString("link")+"</td>");
			out.println("<td>"+detail+"</td>");
			out.println("<td>"+modify+"</td>");
			out.println("<td>"+delete+"</td>");
			out.println("</tr>");
			tally++;
		}
		out.println("</table>");
		out.println(tally + " images.");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		try
		{
			out.println(e.toString());
		}
		catch(Exception e2)
		{
			e.printStackTrace();
		}
	}
}
%>

<%! public void generateArtistTable(ResultSet rs, String tbl, JspWriter out)
{
	String sql;
	String modifyForm;
	String modifyFuncID;
	String modifyImgID;
	String modifyButton;
	String modify;
	int tally = 0;
	try
	{
		if(rs.next())
		{
			out.println("<table border=\"1\">");
			out.println("<caption><b>Artists of: " + rs.getString(tbl) + "<b></caption>");
			out.println("<tr>");
			out.println("<th>ID</th>");
			out.println("<th>Name</th>");
			out.println("<th>Birth Year</th>");
			out.println("<th>Country</th>");
			out.println("<th>Description</th>");
			out.println("<th>Modify</th>");
			out.println("</tr>");
		}
		else
		{
			out.println("Bad query!");
			return;
		}
		rs.beforeFirst();
		while (rs.next()) {			
			// Create the modify button string
			modifyForm = "<form method=\"post\">";
			modifyFuncID = "<input name=\"funcID\" type=\"hidden\" value=9>";
			modifyImgID = "<input name =\"imgID\" type=\"hidden\" value=\""+rs.getString("artist_id")+"\">";
			modifyButton = "<button type=\"sumbit\">Modify</button></form>";
			modify = modifyForm+modifyFuncID+modifyImgID+modifyButton;
			
			out.println("<tr>");
			out.println("<td>"+rs.getString("artist_id")+"</td>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getString("birth_year")+"</td>");
			out.println("<td>"+rs.getString("country")+"</td>");
			out.println("<td>"+rs.getString("description")+"</td>");
			out.println("<td>"+modify+"</td>");
			out.println("</tr>");
			tally++;
		}
		out.println("</table>");
		out.println(tally + " artists.");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		try
		{
			out.println(e.toString());
		}
		catch(Exception e2)
		{
			e.printStackTrace();
		}
	}
}
%>

</body>
</html>
	
