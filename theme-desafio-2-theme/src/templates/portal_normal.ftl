
<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<script>
        (function() {
            const savedTheme = localStorage.getItem('theme') || 'light';
            document.documentElement.setAttribute('data-theme', savedTheme);
        })();
    </script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<@liferay_util["include"] page=top_head_include />
	
	
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid position-relative px-0" id="wrapper">
	<header class="d-flex flex-column align-items-center pt-2 py-md-4" id="banner" role="banner">
		<div class="d-flex px-3 w-100 align-items-center justify-content-between" id="heading">
			<div aria-level="1" class="site-title" role="heading">
				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</div>
			<button id="themeToggle" class="toggle-button d-flex align-items-center p-1">
			<span class="material-symbols-outlined w-100" id="icon-sunny">
				sunny
			</span>
			<span class="material-symbols-outlined w-100" id="icon-mode_night">
				mode_night
			</span>
		</button>
		</div>

		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
		</#if>

		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
		
	</header>

	<section class="section-style" id="content">
		<h2 class="hide-accessible sr-only" role="heading" aria-level="1">${htmlUtil.escape(the_title)}</h2>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language_format
				arguments='<a href="http://www.liferay.com" rel="external">Liferay</a>'
				key="powered-by-x"
			/>
		</p>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
    (function() {
        const savedTheme = localStorage.getItem('theme') || 'light';
        document.documentElement.setAttribute('data-theme', savedTheme);
    })();
</script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.getElementById('themeToggle').addEventListener('click', function() {
    let currentTheme = document.documentElement.getAttribute('data-theme');
    let newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);

});

document.addEventListener('DOMContentLoaded', function () {
  const dropdownElements = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
  dropdownElements.forEach(function (dropdownToggleEl) {
    new bootstrap.Dropdown(dropdownToggleEl);
  });
});
  </script>
<style>
	[data-theme="dark"] {
		--background-color: #55757e;
		--background-color-header: #7098a3;
		--background-color-chart: #6d98a3;
		--text-color: #d1d1d1;
		--dark-mode-color-shadow: #d1d1d1;
		--background-color-submenu: #638891;
		--espacador-link: #7fa8b3;
	}
    :root[data-theme="dark"] #icon-sunny {
        transform: translateX(100%);
    	opacity: 0;
		transition: all 0.4s;
    }
	:root[data-theme="dark"] #icon-mode_night {
		transform: translateX(0%);
    	opacity: 1;
		transition: all 0.4s;
    }
    :root:not([data-theme="dark"]) #icon-sunny {
		transform: translateX(0%);
        opacity: 1;
		transition: all 0.4s;
    }
	:root:not([data-theme="dark"]) #icon-mode_night {
		transform: translateX(-100%);
        opacity: 0;
		transition: all 0.4s;
    }
</style>	

</body>

</html>
