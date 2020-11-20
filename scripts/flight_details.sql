<%
								
								try{
									Class.forName("com.mysql.cj.jdbc.Driver");
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost/3306/flyaway", "root", "12345");
									String query = "select distinct(source) from flight_details";
									PreparedStatement psmt= con.prepareStatement(query);
									ResultSet rs = psmt.executeQuery();
									%>
									<select>
									<option>--FROM--</option>
									<%
									while (rs.next()){%>
									<option><%=rs.getString("Source")%></option>
									</select>
									<%	
									}
								}catch(Exception e){
								}
								%>