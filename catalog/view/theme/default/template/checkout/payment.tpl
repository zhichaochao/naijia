<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="/catalog/view/theme/default/css/common.css" />
		<link rel="stylesheet" href="/catalog/view/theme/default/css/index.css" />
		<link rel="stylesheet" href="/catalog/view/theme/default/css/swiper.min.css" />
		<script type="text/javascript" src="/catalog/view/theme/default/js/jquery.min.js" ></script>
		<script type="text/javascript" src="/catalog/view/theme/default/js/common.js" ></script>
		<script type="text/javascript" src="/catalog/view/theme/default/js/swiper.js" ></script>
		<title>LOADING</title>
	</head>
	<body>
		<div class="loading clearfix">
			<img src="/catalog/view/theme/default/img/loading.gif" alt="" />
			
			<p>Redirecting... </p>
			<p>Please wait while we redirect you.</p>
			
		</div>
	</body>
</html>

<script type="text/javascript">
	bank_transfer_gay();
function bank_transfer_gay() {


	$.ajax({
		type: 'get',
		url: '<?php echo $continue; ?>',
		cache: false,
		beforeSend: function() {
			$('.a_qd_btn').html('loading');
		},
		
		success: function(json) {
			// location =json['href'];
		}
	});
};
</script>

