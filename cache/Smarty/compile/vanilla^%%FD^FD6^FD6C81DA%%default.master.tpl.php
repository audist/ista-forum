<?php /* Smarty version 2.6.25, created on 2015-10-04 17:59:06
         compiled from /Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'asset', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 10, false),array('function', 'link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 16, false),array('function', 'logo', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 16, false),array('function', 'module', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 19, false),array('function', 'discussions_link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 22, false),array('function', 'activity_link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 23, false),array('function', 'custom_menu', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 24, false),array('function', 'dashboard_link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 34, false),array('function', 'inbox_link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 37, false),array('function', 'profile_link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 39, false),array('function', 'signinout_link', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 40, false),array('function', 'searchbox', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 46, false),array('function', 'breadcrumbs', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 47, false),array('function', 'vanillaurl', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 60, false),array('function', 'event', '/Applications/XAMPP/xamppfiles/htdocs/ista-forum/themes/VBS3/views/default.master.tpl', 66, false),)), $this); ?>
<!DOCTYPE html>
<html>
<head>
    <?php echo smarty_function_asset(array('name' => 'Head'), $this);?>

</head>
<body id="<?php echo $this->_tpl_vars['BodyID']; ?>
" class="<?php echo $this->_tpl_vars['BodyClass']; ?>
">
<div id="Frame">
    <div class="NavBar">
        <div class="Row">
            <strong class="SiteTitle"><a href="<?php echo smarty_function_link(array('path' => "/"), $this);?>
"><?php echo smarty_function_logo(array(), $this);?>
</a></strong>

            <div class="MeWrap">
               <?php echo smarty_function_module(array('name' => 'MeModule','CssClass' => 'Inline FlyoutRight'), $this);?>

            </div>
            <ul class="SiteMenu">
                <?php echo smarty_function_discussions_link(array(), $this);?>

                <?php echo smarty_function_activity_link(array(), $this);?>

                <?php echo smarty_function_custom_menu(array(), $this);?>

            </ul>
        </div>
        <a id="Menu" href="#sidr" data-reveal-id="sidr"><span class="icon"></span><span class="icon"></span><span
                    class="icon"></span>
            <noscript> Mobile Menu Disabled with Javascript disabled</noscript>
        </a>

        <div id="sidr" class="sidr">
            <strong class="SiteTitle"><a href="<?php echo smarty_function_link(array('path' => "/"), $this);?>
"><?php echo smarty_function_logo(array(), $this);?>
</a></strong>
            <?php echo smarty_function_dashboard_link(array('wrap' => "li class='dashboard'"), $this);?>

            <?php echo smarty_function_discussions_link(array('wrap' => "li class='discussions'"), $this);?>

            <?php echo smarty_function_activity_link(array('wrap' => "li class='activity'"), $this);?>

            <?php echo smarty_function_inbox_link(array('wrap' => "li class='inbox'"), $this);?>

            <?php echo smarty_function_custom_menu(array(), $this);?>

            <?php echo smarty_function_profile_link(array('wrap' => "li class='profile'"), $this);?>

            <?php echo smarty_function_signinout_link(array('wrap' => "li class='signout'"), $this);?>

            </ul>
        </div>
    </div>
    <div id="Body">
        <div class="BreadcrumbsWrapper Row">
            <div class="SiteSearch"><?php echo smarty_function_searchbox(array(), $this);?>
</div>
            <?php echo smarty_function_breadcrumbs(array(), $this);?>

        </div>
        <div class="Row">
            <div class="Column PanelColumn" id="Panel">
               <?php echo smarty_function_asset(array('name' => 'Panel'), $this);?>

            </div>
            <div class="Column ContentColumn" id="Content">
		<?php echo smarty_function_asset(array('name' => 'Content'), $this);?>

	    </div>
        </div>
    </div>
    <div id="Foot">
        <div class="Row">
            <a href="<?php echo smarty_function_vanillaurl(array(), $this);?>
" class="PoweredByVanilla" title="Community Software by Vanilla Forums">Powered by
                Vanilla</a>
            <?php echo smarty_function_asset(array('name' => 'Foot'), $this);?>

        </div>
    </div>
</div>
<?php echo smarty_function_event(array('name' => 'AfterBody'), $this);?>

<?php echo '
    <script>
        // Theme Defintions
        jQuery("#Menu").sidr();
        $(\'.SignInPopup\').click(function () {
            jQuery.sidr(\'close\');
        });

        if ($(window).width() < 612) {
            $(".Options").addClass("FlyoutLeft");
            $("body.Discussion .Options").removeClass("FlyoutLeft");
        }

        $(window).resize(function () {
            if ($(window).width() > 612) {
                jQuery.sidr(\'close\');
                $(".Options").removeClass("FlyoutLeft");
            }
            else if ($(window).width() < 612) {
                $(".Options").addClass("FlyoutLeft");
                $("body.Discussion .Options").removeClass("FlyoutLeft");
            }
        });
    </script>
'; ?>

</body>
</html>