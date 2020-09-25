<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#container div {
	float: left
}

.focus {
	position: fixed;
	border: 1px solid red;
	background-color: rgb(128, 0, 0, 0.3);
}

.highlight {
	border: 1px solid #000099;
}
</style>
</head>
<body>
	<div id="container"></div>
	<div class="focus"></div>
	<script>
		var $container = $("#container");
		init();
		function init() { //테스트를 위한 div 생성
			for (var i = 0; i < 3; i++) {
				var $row = $('<div class="row"></div>');
				for (var j = 0; j < 10; j++) {
					var div = $("<div></div>");
					var r = Math.random() * 1000 % 200;
					div.css("background-color", 'rgb(' + [ r, r, r ].join(',')
							+ ')');
					div.css("width", r);
					div.css("height", r);
					$row.append(div);
				}
				$container.append($row);
			}
		}
		(function() {
			var target = '#container div'; //셀렉트로 묶을 객체
			var mode = false;
			var startX = 0;
			var startY = 0;
			var left, top, width, height;
			var $focus = $(".focus");
			$(document).on("mousedown", function(e) {
				mode = true;
				startX = e.clientX;
				startY = e.clientY;
				width = height = 0;
				$focus.show();
				rangeSelect(target, 0, 0, 0, 0, function() { //기존에 선택된 객체를 선택취소한다.
					$(this).removeClass('highlight');
				});
			}).on(
					'mouseup',
					function(e) {
						mode = false;
						$focus.hide();
						$focus.css("width", 0);
						$focus.css('height', 0);
						//범위 내 객체를 선택한다.
						rangeSelect(target, left, top, left + width, top
								+ height, function(include) {
							if (include)
								$(this).addClass('highlight');
							else
								$(this).removeClass('highlight');
						});
					}).on('mousemove', function(e) {
				if (!mode) {
					return;
				}
				var x = e.clientX;
				var y = e.clientY;
				//마우스 이동에 따라 선택 영역을 리사이징 한다
				width = Math.max(x - startX, startX - x);
				left = Math.min(startX, x);
				$focus.css('left', left);
				$focus.css("width", width);
				height = Math.max(y - startY, startY - y);
				top = Math.min(startY, y);
				$focus.css('top', top);
				$focus.css('height', height);
			});
			function rangeSelect(selector, x1, y1, x2, y2, cb) {
				$(selector).each(
						function() {
							var $this = $(this);
							var offset = $this.offset();
							var x = offset.left;
							var y = offset.top;
							var w = $this.width();
							var h = $this.height();
							//범위 안인지 체크
							cb.call(this, x >= x1 && y >= y1 && x + w <= x2
									&& y + h <= y2);
						});
			}
		})();
	</script>
</body>
</html>
