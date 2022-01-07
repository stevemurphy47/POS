<?php include('header.php'); ?>
<body>
	<div class="loader">
		<div class="loader__bar"></div>
		<div class="loader__bar"></div>
		<div class="loader__bar"></div>
		<div class="loader__bar"></div>
		<div class="loader__bar"></div>
		<div class="loader__ball"></div>
	</div>

    <script>
		$(window).on("load", function(){
			$("html").fadeOut(1000);
		});
    </script>
</body>