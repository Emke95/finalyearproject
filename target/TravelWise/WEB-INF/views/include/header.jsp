<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="resources/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"href="resources/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="resources/assets/css/style.css" rel="stylesheet">
<link href="resources/assets/css/style-responsive.css" rel="stylesheet">
<script src="resources/assets/js/custom/search.js"></script>
<script src="resources/assets/js/custom/infiniteScrolling.js"></script>
<script src="resources/assets/js/custom/likes.js"></script>
<script src="resources/assets/js/custom/comments.js"></script>
<script src="resources/assets/js/custom/readNotification.js"></script>
<script src="resources/assets/js/custom/readMessages.js"></script>
<script type="text/javascript">
	
</script>
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
}
</style>
</head>
<body>
	<!--header start-->
	<header class="header black-bg">
	<div class="sidebar-toggle-box">
		<div class="fa-white fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!--logo start--> <a href="/TravelWise/index" class="logo"><b>TW</b></a>
	<!--logo end-->
	<div class="nav notify-row" id="top_menu">
		<!--  notification start -->
		<ul class="nav top-menu">
			<!-- settings start -->
			<li class="dropdown"><a data-toggle="dropdown"
				class="notification dropdown-toggle" href="index.html#"> <i
					class="fa-white fa-th-list"></i> <span class="badge bg-theme"><c:out
							value="${sessionScope.notificationCount}"></c:out></span>
			</a>
				<ul class="dropdown-menu extended tasks-bar">
					<div class="notify-arrow notify-arrow-green"></div>
					<li>
						<p class="green">
							You have
							<c:out value="${sessionScope.notificationCount}"></c:out>
							pending notifications
						</p>
					</li>
					<c:forEach var="notification"
						items="${sessionScope.notificationList}">
						<li><a
							href="post?postId=${notification.getPosts().getPostId()}">
								<div class="task-info">
									<div class="desc">${notification.getNotification()}</div>
								</div>
						</a></li>
					</c:forEach>
				</ul></li>
			<!-- settings end -->
			<!-- inbox dropdown start-->
			<li id="header_inbox_bar" class="dropdown"><a
				data-toggle="dropdown" class="messages dropdown-toggle"
				href="index.html#"> <i class="fa-white fa-envelope-o"></i> <span
					class="badge bg-theme"><c:out
							value="${sessionScope.messageCount}"></c:out></span>
			</a>
				<ul class="dropdown-menu extended inbox">
					<div class="notify-arrow notify-arrow-green"></div>
					<li>
						<p class="green">
							You have
							<c:out value="${sessionScope.messageCount}"></c:out>
							new messages
						</p>
					</li>
					<c:forEach var="person" items="${sessionScope.messageList}">
						<li><a href="getMessage?personId=${person.getpId()}">
								<div class="task-info">
									<div class="desc">${person.getFirstName()}
										${person.getLastName()}</div>
								</div>
						</a></li>
					</c:forEach>
					<li><a href="inbox">See all messages</a></li>
				</ul></li>
			<!-- inbox dropdown end -->
			<!-- Search Bar -->
			<li>
				<div class="pull-left">
					<form class="form-inline" role="form">
						<div class="form-group">
							<input type="text" style="width: 500px;" class="form-control"
								id="search" placeholder="Search Everyone">
						</div>
						<button type="submit" class="btn btn-theme">Search</button>
					</form>
				</div> <!-- /form-panel -->
			</li>
		</ul>
		<!--  notification end -->
	</div>
	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<li><a class="logout" href="logout">Logout</a></li>
		</ul>
	</div>
	</header>
	<!--header end-->
</body>
</html>