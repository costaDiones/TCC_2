
(function(c, q) {
	var m = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
	c.fn.imagesLoaded = function(f) {
		function n() {
			var b = c(j),
			    a = c(h);
			d && (h.length ? d.reject(e, b, a) : d.resolve(e));
			c.isFunction(f) && f.call(g, e, b, a)
		}

		function p(b) {
			k(b.target, "error" === b.type)
		}

		function k(b, a) {
			b.src === m || -1 !== c.inArray(b, l) || (l.push(b), a ? h.push(b) : j.push(b), c.data(b, "imagesLoaded", {
				isBroken : a,
				src : b.src
			}), r && d.notifyWith(c(b), [a, e, c(j), c(h)]), e.length === l.length && (setTimeout(n), e.unbind(".imagesLoaded", p)))
		}

		var g = this,
		    d = c.isFunction(c.Deferred) ? c.Deferred() : 0,
		    r = c.isFunction(d.notify),
		    e = g.find("img").add(g.filter("img")),
		    l = [],
		    j = [],
		    h = [];
		c.isPlainObject(f) && c.each(f, function(b, a) {
			if ("callback" === b)
				f = a;
			else if (d)
				d[b](a)
		});
		e.length ? e.bind("load.imagesLoaded error.imagesLoaded", p).each(function(b, a) {
			var d = a.src,
			    e = c.data(a, "imagesLoaded");
			if (e && e.src === d)
				k(a, e.isBroken);
			else if (a.complete && a.naturalWidth !== q)
				k(a, 0 === a.naturalWidth || 0 === a.naturalHeight);
			else if (a.readyState || a.complete)
				a.src = m, a.src =
				d
		}) : n();
		return d ? d.promise(g) : g
	}
})(jQuery);

var cbpBGSlideshow = (function() {
	var $slideshow = $('#cbp-bislideshow'),
	    $items = $slideshow.children('li'),
	    itemsCount = $items.length,
	    $controls = $('#cbp-bicontrols'),
	    navigation = {
		$navPrev : $controls.find('span.cbp-biprev'),
		$navNext : $controls.find('span.cbp-binext'),
		$navPlayPause : $controls.find('span.cbp-bipause')
	},
	    current = 0,
	    slideshowtime,
	    isSlideshowActive = true,
	    interval = 12000;

	function init(config) {
		$slideshow.imagesLoaded(function() {

			if (Modernizr.backgroundsize) {
				$items.each(function() {
					var $item = $(this);
					$item.css('background-image', 'url(' + $item.find('img').attr('src') + ')');
				});
			} else {
				$slideshow.find('img').show();

			}

			$items.eq(current).css('opacity', 1);
			initEvents();
			startSlideshow();

		});

	}

	function initEvents() {
		navigation.$navPlayPause.on('click', function() {

			var $control = $(this);
			if ($control.hasClass('cbp-biplay')) {
				$control.removeClass('cbp-biplay').addClass('cbp-bipause');
				startSlideshow();
			} else {
				$control.removeClass('cbp-bipause').addClass('cbp-biplay');
				stopSlideshow();
			}

		});

		navigation.$navPrev.on('click', function() {
			navigate('prev');
			if (isSlideshowActive) {
				startSlideshow();
			}
		});
		navigation.$navNext.on('click', function() {
			navigate('next');
			if (isSlideshowActive) {
				startSlideshow();
			}
		});

	}

	function navigate(direction) {
		var $oldItem = $items.eq(current);

		if (direction === 'next') {
			current = current < itemsCount - 1 ? ++current : 0;
		} else if (direction === 'prev') {
			current = current > 0 ? --current : itemsCount - 1;
		}

		var $newItem = $items.eq(current);

		$oldItem.css('opacity', 0);
		$newItem.css('opacity', 1);

	}

	function startSlideshow() {
		isSlideshowActive = true;
		clearTimeout(slideshowtime);
		slideshowtime = setTimeout(function() {
			navigate('next');
			startSlideshow();
		}, interval);

	}

	function stopSlideshow() {
		isSlideshowActive = false;
		clearTimeout(slideshowtime);
	}

	return {
		init : init
	};

})();

$(function() {
	cbpBGSlideshow.init();
});






			function PreviewImage() {
	var oFReader = new FileReader();
	oFReader.readAsDataURL(document.getElementById("btn_enviar").files[0]);

	oFReader.onload = function(oFREvent) {
		document.getElementById("uploadPreview").src = oFREvent.target.result;
	};
};






		// init Full Slider </
(function(c, q) {
	var m = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
	c.fn.imagesLoaded = function(f) {
		function n() {
			var b = c(j),
			    a = c(h);
			d && (h.length ? d.reject(e, b, a) : d.resolve(e));
			c.isFunction(f) && f.call(g, e, b, a)
		}

		function p(b) {
			k(b.target, "error" === b.type)
		}

		function k(b, a) {
			b.src === m || -1 !== c.inArray(b, l) || (l.push(b), a ? h.push(b) : j.push(b), c.data(b, "imagesLoaded", {
				isBroken : a,
				src : b.src
			}), r && d.notifyWith(c(b), [a, e, c(j), c(h)]), e.length === l.length && (setTimeout(n), e.unbind(".imagesLoaded", p)))
		}

		var g = this,
		    d = c.isFunction(c.Deferred) ? c.Deferred() : 0,
		    r = c.isFunction(d.notify),
		    e = g.find("img").add(g.filter("img")),
		    l = [],
		    j = [],
		    h = [];
		c.isPlainObject(f) && c.each(f, function(b, a) {
			if ("callback" === b)
				f = a;
			else if (d)
				d[b](a)
		});
		e.length ? e.bind("load.imagesLoaded error.imagesLoaded", p).each(function(b, a) {
			var d = a.src,
			    e = c.data(a, "imagesLoaded");
			if (e && e.src === d)
				k(a, e.isBroken);
			else if (a.complete && a.naturalWidth !== q)
				k(a, 0 === a.naturalWidth || 0 === a.naturalHeight);
			else if (a.readyState || a.complete)
				a.src = m, a.src =
				d
		}) : n();
		return d ? d.promise(g) : g
	}
})(jQuery);

var cbpBGSlideshow = (function() {
	var $slideshow = $('#cbp-bislideshow'),
	    $items = $slideshow.children('li'),
	    itemsCount = $items.length,
	    $controls = $('#cbp-bicontrols'),
	    navigation = {
		$navPrev : $controls.find('span.cbp-biprev'),
		$navNext : $controls.find('span.cbp-binext'),
		$navPlayPause : $controls.find('span.cbp-bipause')
	},
	    current = 0,
	    slideshowtime,
	    isSlideshowActive = true,
	    interval = 12000;

	function init(config) {
		$slideshow.imagesLoaded(function() {

			if (Modernizr.backgroundsize) {
				$items.each(function() {
					var $item = $(this);
					$item.css('background-image', 'url(' + $item.find('img').attr('src') + ')');
				});
			} else {
				$slideshow.find('img').show();

			}

			$items.eq(current).css('opacity', 1);
			initEvents();
			startSlideshow();

		});

	}

	function initEvents() {
		navigation.$navPlayPause.on('click', function() {

			var $control = $(this);
			if ($control.hasClass('cbp-biplay')) {
				$control.removeClass('cbp-biplay').addClass('cbp-bipause');
				startSlideshow();
			} else {
				$control.removeClass('cbp-bipause').addClass('cbp-biplay');
				stopSlideshow();
			}

		});

		navigation.$navPrev.on('click', function() {
			navigate('prev');
			if (isSlideshowActive) {
				startSlideshow();
			}
		});
		navigation.$navNext.on('click', function() {
			navigate('next');
			if (isSlideshowActive) {
				startSlideshow();
			}
		});

	}

	function navigate(direction) {
		var $oldItem = $items.eq(current);

		if (direction === 'next') {
			current = current < itemsCount - 1 ? ++current : 0;
		} else if (direction === 'prev') {
			current = current > 0 ? --current : itemsCount - 1;
		}

		var $newItem = $items.eq(current);

		$oldItem.css('opacity', 0);
		$newItem.css('opacity', 1);

	}

	function startSlideshow() {
		isSlideshowActive = true;
		clearTimeout(slideshowtime);
		slideshowtime = setTimeout(function() {
			navigate('next');
			startSlideshow();
		}, interval);

	}

	function stopSlideshow() {
		isSlideshowActive = false;
		clearTimeout(slideshowtime);
	}

	return {
		init : init
	};

})();

$(function() {
	cbpBGSlideshow.init();
});


	$("#menu-close").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
	});

	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
	});



//> End Full Slider

//> init divsShow-Hidden
