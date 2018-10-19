<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp" />


<script type="text/javascript">
	$(document).ready(function() {

		$("#submitButton").click(function() {

			var name = $("#StudentState").val();
			var country=$("#UserCountry").val();

			$('#StudentStateNameError').text("");
			$('#CountryError').text("");

			if (name == "" || name == null) {
				$('#StudentStateNameError').text("please Enter State Name");
			}
			
			else if (country == "" || country == null) {
				$('#CountryError').text("please Enter Country Name");

			}

			else {
				return true;
			}
			return false;
		});

	});
</script>

<body>
<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />

<div id="page" class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="sidemenu.jsp" />
		</div>
		<div class="col-md-10">
		<h4>STATE FORM</h4>
				<div class="row">
				<div class="col-md-5">

			<form action="${FormAction}" method="post">
				<h4>${Message}</h4>
				<div class="row">
					<div class="col-md-7">
						<input type="hidden" name="id" value="${StateId}" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">STATE</div>
					<div class="col-md-7">
						<input type="text" name="name" id="StudentState"
							class="form-control" value="${StateValue}" />
						<div id="StudentStateError" style="color: red;"></div>
					</div>
				</div>
				
				<div class="row">	
						<div class="col-md-4">
							Select Country
						</div>
						<div class="col-md-7">
							<!-- <input type="text" style="width: 250px" id="userCity" class="form-control" name="city" value="${city1}"/> -->
							<select style="width: 250px" id="UserCountry" class="form-control" name="country">
								<option>SELECT</option>
									<c:if test="${not empty CountryList}">
										<c:forEach items="${CountryList}" var="countryinfo">
											<c:set var="CountryMenu" scope="session" value="${CountryValue}"/>
												<c:choose>
													<c:when test="${CountryMenu eq countryinfo}">
														<option value="${countryinfo.id}" selected="selected">${countryinfo.name}</option>
													</c:when>
													<c:otherwise>
														<option value="${countryinfo.id}">${countryinfo.name}</option>
													</c:otherwise>
												</c:choose>
										</c:forEach>
									</c:if>
								
							</select>
							<div id="CountryError" style="color: red"></div>
						</div>
					</div>

				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<input type="submit" class="btn btn-secondary" id="submitButton"
							value="${Button}" /> <input type="reset"
							class="btn btn-secondary" value="RESET" />
					</div>
				</div>
			</form>
			</div>



			<div class="col-md-7">

				<div style="width: 90%; height: 300px; overflow: scroll;">
					<table class="table table-stripped">
						<tr>
							<th>Name</th>
							<th>Country</th>
							<th>Action</th>
						</tr>
						<c:if test="${not empty StateList}">
							<c:forEach var="state" items="${StateList}">
								<tr>
									<td>${state.name}</td>
									<td>${state.countries.name}</td>

									<td><a href="StudentStateGetUpdate?id=${state.id}">UPDATE</a>||<a
										href="StudentStateGetDelete?id=${state.id}">DELETE</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
