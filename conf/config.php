<?php if (!defined('APPLICATION')) exit();

// Conversations
$Configuration['Conversations']['Version'] = '2.1.11';

// Database
$Configuration['Database']['Name'] = 'istaforum';
$Configuration['Database']['Host'] = 'localhost';
$Configuration['Database']['User'] = 'admin';
$Configuration['Database']['Password'] = 'istaforumadmin';

// EnabledApplications
$Configuration['EnabledApplications']['Conversations'] = 'conversations';
$Configuration['EnabledApplications']['Vanilla'] = 'vanilla';

// EnabledPlugins
$Configuration['EnabledPlugins']['GettingStarted'] = 'GettingStarted';
$Configuration['EnabledPlugins']['HtmLawed'] = 'HtmLawed';
$Configuration['EnabledPlugins']['Incognito'] = TRUE;

// Garden
$Configuration['Garden']['Title'] = 'ISTA Forum';
$Configuration['Garden']['Cookie']['Salt'] = 'XJXYPSBP4L';
$Configuration['Garden']['Cookie']['Domain'] = '';
$Configuration['Garden']['Registration']['ConfirmEmail'] = TRUE;
$Configuration['Garden']['Registration']['Method'] = 'Basic';
$Configuration['Garden']['Email']['SupportName'] = 'ISTA Forum';
$Configuration['Garden']['Email']['SupportAddress'] = 'discuss.ista@gmail.com';
$Configuration['Garden']['Email']['UseSmtp'] = '1';
$Configuration['Garden']['Email']['SmtpHost'] = 'smtpcorp.com';
$Configuration['Garden']['Email']['SmtpUser'] = 'discuss.ista@gmail.com';
$Configuration['Garden']['Email']['SmtpPassword'] = 'istaforumadmin';
$Configuration['Garden']['Email']['SmtpPort'] = '2525';
$Configuration['Garden']['Email']['SmtpSecurity'] = '';
$Configuration['Garden']['InputFormatter'] = 'Html';
$Configuration['Garden']['Html']['SafeStyles'] = TRUE;
$Configuration['Garden']['Version'] = '2.1.11';
$Configuration['Garden']['RewriteUrls'] = TRUE;
$Configuration['Garden']['Cdns']['Disable'] = FALSE;
$Configuration['Garden']['CanProcessImages'] = TRUE;
$Configuration['Garden']['SystemUserID'] = '2';
$Configuration['Garden']['Installed'] = TRUE;
$Configuration['Garden']['Theme'] = 'bootstrap';
$Configuration['Garden']['ThemeOptions']['Name'] = 'Bootstrap';

// Plugins
$Configuration['Plugins']['GettingStarted']['Dashboard'] = '1';
$Configuration['Plugins']['GettingStarted']['Plugins'] = '1';
$Configuration['Plugins']['GettingStarted']['Discussion'] = '1';
$Configuration['Plugins']['GettingStarted']['Categories'] = '1';
$Configuration['Plugins']['Incognito']['UserID'] = '3';

// Routes
$Configuration['Routes']['DefaultController'] = 'discussions';

// Vanilla
$Configuration['Vanilla']['Version'] = '2.1.11';

// Last edited by arjunmayilvaganan (127.0.0.1)2015-10-04 18:01:00