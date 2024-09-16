<nav aria-label="<@liferay.language key="site-pages" />" class="${nav_css_class} w-100" id="navigation" role="navigation">
	<div class="d-md-none mb-0 align-items-center justify-content-center d-flex flex-column position-relative">
		<a 
			class="nav-link align-self-start" 
			href="#regularItemsDropdown" 
			role="button" 
						
		>	
			<span class="material-symbols-outlined icone-menu-header-mobile">
				menu
			</span>
		</a>
		<ul class="menu-links d-md-none mb-0 p-0 w-100 align-items-center justify-content-center position-absolute" role="menubar" id="regularItemsDropdown">
			<#list nav_items as nav_item>
				<#assign
					nav_item_attr_has_popup = ""
					nav_item_css_class = ""
					nav_item_layout = nav_item.getLayout()
				/>

				<#if nav_item.isSelected()>
					<#assign
						nav_item_attr_has_popup = "aria-haspopup='true'"
						nav_item_css_class = "selected"
					/>
				</#if>

				<li class="${nav_item_css_class}" role="presentation">
					<div class="link-header-item d-flex flex-column align-items-center" role="presentation">
						<#if nav_item.hasChildren()>
							<a class=" d-flex align-items-center align-self-start px-4 py-2" 
							href="#layout_${nav_item.getLayoutId()}"
							${nav_item.getTarget()} 
							role="menuitem"
							type="button" 
							>
								<span>
									<@liferay_theme["layout-icon"] layout=nav_item_layout /> 
									${nav_item.getName()}
								</span>
								<span class="material-symbols-outlined mr-1">
									keyboard_arrow_down
								</span>
							</a>
							<#if nav_item.hasChildren()>
								<ul class="link-header-item child-menusubmenu-link-nomral p-0 w-100 d-none " id="layout_${nav_item.getLayoutId()}" role="menu">
									<#list nav_item.getChildren() as nav_child>
										<li class="d-flex" id="layout_${nav_child.getLayoutId()}" role="presentation">
											<a class="px-4 py-2" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
												${nav_child.getName()}
											</a>
										</li>
									</#list>
								</ul>
							</#if>
						<#else>
							<a class=" d-flex align-items-center align-self-start px-4 py-2" href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
								<span>
									<@liferay_theme["layout-icon"] layout=nav_item_layout /> 
									${nav_item.getName()}
								</span>
							</a>
						</#if>
					</div>
				</li>
			</#list>
		</ul>
	</div>
	<ul class="d-md-flex pl-0 align-items-center justify-content-center d-none" role="menubar">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_css_class = ""
				nav_item_layout = nav_item.getLayout()
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_css_class = "selected"
				/>
			</#if>

			<li class="${nav_item_css_class} px-3 py-2" id="layout_${nav_item.getLayoutId()}" role="presentation">

				<div class="${nav_item.hasChildren()?then('dropdown', '')} d-flex align-items-center" id="layout_${nav_item.getLayoutId()}" role="presentation">
					<#if nav_item.hasChildren()>
						<a class="dropdown-toggle d-flex align-items-center" 
						href="#" 
						${nav_item.getTarget()} 
						role="menuitem"
						type="button" 
						data-toggle="dropdown"  
						aria-haspopup="true" 
						aria-expanded="false" 
						id="dropdown-${nav_item.getLayoutId()}">
							<span>
								<@liferay_theme["layout-icon"] layout=nav_item_layout /> 
								${nav_item.getName()}
							</span>
							<span class="material-symbols-outlined mr-1">
								keyboard_arrow_down
							</span>
						</a>
						<#if nav_item.hasChildren()>
							<ul class="child-menu dropdown-menu submenu-link-nomral p-0"  aria-labelledby="dropdown-${nav_item.getLayoutId()}" role="menu">
								<#list nav_item.getChildren() as nav_child>
									<li class="dropdown-item d-flex p-3" id="layout_${nav_child.getLayoutId()}" role="presentation">
										<a class="p-0" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
											${nav_child.getName()}
										</a>
									</li>
								</#list>
							</ul>
						</#if>
					<#else>
						<a class=" d-flex align-items-center" href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
							<span>
								<@liferay_theme["layout-icon"] layout=nav_item_layout /> 
								${nav_item.getName()}
							</span>
						</a>
					</#if>
				</div>
			</li>
		</#list>
	</ul>
</nav>
<script>
    document.querySelector('a[href="#regularItemsDropdown"]').addEventListener('click', function(event) {
        event.preventDefault();
        document.querySelector('.icone-menu-header-mobile').classList.toggle('rotate');
        document.getElementById('regularItemsDropdown').classList.toggle('show');
    });

    document.querySelectorAll('a[href^="#layout_"]').forEach(function(element) {
        element.addEventListener('click', function(event) {
            event.preventDefault();
            var layoutId = this.getAttribute('href').replace('#layout_', '');
            var targetElement = document.getElementById('layout_' + layoutId);
            if (targetElement) {
                targetElement.classList.toggle('d-none');
            }
        });
    });
</script>