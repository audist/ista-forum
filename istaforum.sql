-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2015 at 08:09 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `istaforum`
--

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Activity`
--

CREATE TABLE IF NOT EXISTS `GDN_Activity` (
`ActivityID` int(11) NOT NULL,
  `ActivityTypeID` int(11) NOT NULL,
  `NotifyUserID` int(11) NOT NULL DEFAULT '0',
  `ActivityUserID` int(11) DEFAULT NULL,
  `RegardingUserID` int(11) DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HeadlineFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Story` text COLLATE utf8_unicode_ci,
  `Format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `Notified` tinyint(4) NOT NULL DEFAULT '0',
  `Emailed` tinyint(4) NOT NULL DEFAULT '0',
  `Data` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Activity`
--

INSERT INTO `GDN_Activity` (`ActivityID`, `ActivityTypeID`, `NotifyUserID`, `ActivityUserID`, `RegardingUserID`, `Photo`, `HeadlineFormat`, `Story`, `Format`, `Route`, `RecordType`, `RecordID`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `DateUpdated`, `Notified`, `Emailed`, `Data`) VALUES
(1, 17, -1, 4, NULL, NULL, '{ActivityUserID,You} joined.', 'Welcome Aboard!', NULL, NULL, NULL, NULL, NULL, '2015-10-04 16:44:15', '127.0.0.1', '2015-10-04 16:55:34', 0, 0, 'a:1:{s:15:"ActivityUserIDs";a:2:{i:0;i:3;i:1;i:1;}}'),
(2, 15, -1, 1, 2, NULL, '{RegardingUserID,you} &rarr; {ActivityUserID,you}', 'Ping! An activity post is a public way to talk at someone. When you update your status here, it posts it on your activity feed.', 'Html', NULL, NULL, NULL, 2, '2015-10-04 16:44:16', NULL, '2015-10-04 16:44:16', 0, 0, NULL),
(3, 17, -2, 1, 3, NULL, '{ActivityUserID,user} added an account for {RegardingUserID,user}.', NULL, NULL, NULL, NULL, NULL, 1, '2015-10-04 16:49:48', '127.0.0.1', '2015-10-04 16:49:48', 0, 0, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_ActivityComment`
--

CREATE TABLE IF NOT EXISTS `GDN_ActivityComment` (
`ActivityCommentID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_ActivityType`
--

CREATE TABLE IF NOT EXISTS `GDN_ActivityType` (
`ActivityTypeID` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AllowComments` tinyint(4) NOT NULL DEFAULT '0',
  `ShowIcon` tinyint(4) NOT NULL DEFAULT '0',
  `ProfileHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RouteCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Public` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_ActivityType`
--

INSERT INTO `GDN_ActivityType` (`ActivityTypeID`, `Name`, `AllowComments`, `ShowIcon`, `ProfileHeadline`, `FullHeadline`, `RouteCode`, `Notify`, `Public`) VALUES
(1, 'SignIn', 0, 0, '%1$s signed in.', '%1$s signed in.', NULL, 0, 1),
(2, 'Join', 1, 0, '%1$s joined.', '%1$s joined.', NULL, 0, 1),
(3, 'JoinInvite', 1, 0, '%1$s accepted %4$s invitation for membership.', '%1$s accepted %4$s invitation for membership.', NULL, 0, 1),
(4, 'JoinApproved', 1, 0, '%1$s approved %4$s membership application.', '%1$s approved %4$s membership application.', NULL, 0, 1),
(5, 'JoinCreated', 1, 0, '%1$s created an account for %3$s.', '%1$s created an account for %3$s.', NULL, 0, 1),
(6, 'AboutUpdate', 1, 0, '%1$s updated %6$s profile.', '%1$s updated %6$s profile.', NULL, 0, 1),
(7, 'WallComment', 1, 1, '%1$s wrote:', '%1$s wrote on %4$s %5$s.', NULL, 0, 1),
(8, 'PictureChange', 1, 0, '%1$s changed %6$s profile picture.', '%1$s changed %6$s profile picture.', NULL, 0, 1),
(9, 'RoleChange', 1, 0, '%1$s changed %4$s permissions.', '%1$s changed %4$s permissions.', NULL, 1, 1),
(10, 'ActivityComment', 0, 1, '%1$s', '%1$s commented on %4$s %8$s.', 'activity', 1, 1),
(11, 'Import', 0, 0, '%1$s imported data.', '%1$s imported data.', NULL, 1, 0),
(12, 'Banned', 0, 0, '%1$s banned %3$s.', '%1$s banned %3$s.', NULL, 0, 1),
(13, 'Unbanned', 0, 0, '%1$s un-banned %3$s.', '%1$s un-banned %3$s.', NULL, 0, 1),
(14, 'Applicant', 0, 0, '%1$s applied for membership.', '%1$s applied for membership.', NULL, 1, 0),
(15, 'WallPost', 1, 1, '%3$s wrote:', '%3$s wrote on %2$s %5$s.', NULL, 0, 1),
(16, 'Default', 0, 0, NULL, NULL, NULL, 0, 1),
(17, 'Registration', 0, 0, NULL, NULL, NULL, 0, 1),
(18, 'Status', 0, 0, NULL, NULL, NULL, 0, 1),
(19, 'Ban', 0, 0, NULL, NULL, NULL, 0, 1),
(20, 'ConversationMessage', 0, 0, '%1$s sent you a %8$s.', '%1$s sent you a %8$s.', 'message', 1, 0),
(21, 'AddedToConversation', 0, 0, '%1$s added %3$s to a %8$s.', '%1$s added %3$s to a %8$s.', 'conversation', 1, 0),
(22, 'NewDiscussion', 0, 0, '%1$s started a %8$s.', '%1$s started a %8$s.', 'discussion', 0, 0),
(23, 'NewComment', 0, 0, '%1$s commented on a discussion.', '%1$s commented on a discussion.', 'discussion', 0, 0),
(24, 'DiscussionComment', 0, 0, '%1$s commented on %4$s %8$s.', '%1$s commented on %4$s %8$s.', 'discussion', 1, 0),
(25, 'DiscussionMention', 0, 0, '%1$s mentioned %3$s in a %8$s.', '%1$s mentioned %3$s in a %8$s.', 'discussion', 1, 0),
(26, 'CommentMention', 0, 0, '%1$s mentioned %3$s in a %8$s.', '%1$s mentioned %3$s in a %8$s.', 'comment', 1, 0),
(27, 'BookmarkComment', 0, 0, '%1$s commented on your %8$s.', '%1$s commented on your %8$s.', 'bookmarked discussion', 1, 0),
(28, 'Discussion', 0, 0, NULL, NULL, NULL, 0, 1),
(29, 'Comment', 0, 0, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_AnalyticsLocal`
--

CREATE TABLE IF NOT EXISTS `GDN_AnalyticsLocal` (
  `TimeSlot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Views` int(11) DEFAULT NULL,
  `EmbedViews` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_AnalyticsLocal`
--

INSERT INTO `GDN_AnalyticsLocal` (`TimeSlot`, `Views`, `EmbedViews`) VALUES
('20151004', 87, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Ban`
--

CREATE TABLE IF NOT EXISTS `GDN_Ban` (
`BanID` int(11) NOT NULL,
  `BanType` enum('IPAddress','Name','Email') COLLATE utf8_unicode_ci NOT NULL,
  `BanValue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountUsers` int(10) unsigned NOT NULL DEFAULT '0',
  `CountBlockedRegistrations` int(10) unsigned NOT NULL DEFAULT '0',
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Category`
--

CREATE TABLE IF NOT EXISTS `GDN_Category` (
`CategoryID` int(11) NOT NULL,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `TreeLeft` int(11) DEFAULT NULL,
  `TreeRight` int(11) DEFAULT NULL,
  `Depth` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateMarkedRead` datetime DEFAULT NULL,
  `AllowDiscussions` tinyint(4) NOT NULL DEFAULT '1',
  `Archived` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UrlCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `CssClass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PermissionCategoryID` int(11) NOT NULL DEFAULT '-1',
  `HideAllDiscussions` tinyint(4) NOT NULL DEFAULT '0',
  `DisplayAs` enum('Categories','Discussions','Default') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default',
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `LastDiscussionID` int(11) DEFAULT NULL,
  `LastDateInserted` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Category`
--

INSERT INTO `GDN_Category` (`CategoryID`, `ParentCategoryID`, `TreeLeft`, `TreeRight`, `Depth`, `CountDiscussions`, `CountComments`, `DateMarkedRead`, `AllowDiscussions`, `Archived`, `Name`, `UrlCode`, `Description`, `Sort`, `CssClass`, `Photo`, `PermissionCategoryID`, `HideAllDiscussions`, `DisplayAs`, `InsertUserID`, `UpdateUserID`, `DateInserted`, `DateUpdated`, `LastCommentID`, `LastDiscussionID`, `LastDateInserted`) VALUES
(-1, NULL, 1, 4, NULL, 0, 0, NULL, 1, 0, 'Root', 'root', 'Root of category tree. Users should never see this.', NULL, NULL, NULL, -1, 0, 'Default', 1, 1, '2015-10-04 16:44:15', '2015-10-04 16:44:15', NULL, NULL, NULL),
(1, -1, 2, 3, NULL, 0, 0, NULL, 1, 0, 'General', 'general', 'General discussions', NULL, NULL, NULL, -1, 0, 'Default', 1, 1, '2015-10-04 16:44:15', '2015-10-04 16:44:15', NULL, NULL, '2015-10-04 17:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Comment`
--

CREATE TABLE IF NOT EXISTS `GDN_Comment` (
`CommentID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DeleteUserID` int(11) DEFAULT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flag` tinyint(4) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Conversation`
--

CREATE TABLE IF NOT EXISTS `GDN_Conversation` (
`ConversationID` int(11) NOT NULL,
  `Subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contributors` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirstMessageID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `RegardingID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Conversation`
--

INSERT INTO `GDN_Conversation` (`ConversationID`, `Subject`, `Contributors`, `FirstMessageID`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `UpdateUserID`, `DateUpdated`, `UpdateIPAddress`, `CountMessages`, `LastMessageID`, `RegardingID`) VALUES
(1, NULL, 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', NULL, 2, '2015-10-04 16:44:15', NULL, NULL, NULL, NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_ConversationMessage`
--

CREATE TABLE IF NOT EXISTS `GDN_ConversationMessage` (
`MessageID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_ConversationMessage`
--

INSERT INTO `GDN_ConversationMessage` (`MessageID`, `ConversationID`, `Body`, `Format`, `InsertUserID`, `DateInserted`, `InsertIPAddress`) VALUES
(1, 1, 'Pssst. Hey. A conversation is a private chat between two or more members. No one can see it except the members added. You can delete this one since I&rsquo;m just a bot and know better than to talk back.', 'Html', 2, '2015-10-04 16:44:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Discussion`
--

CREATE TABLE IF NOT EXISTS `GDN_Discussion` (
`DiscussionID` int(11) NOT NULL,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `FirstCommentID` int(11) DEFAULT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountViews` int(11) NOT NULL DEFAULT '1',
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateLastComment` datetime DEFAULT NULL,
  `LastCommentUserID` int(11) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `RegardingID` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Draft`
--

CREATE TABLE IF NOT EXISTS `GDN_Draft` (
`DraftID` int(11) NOT NULL,
  `DiscussionID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Invitation`
--

CREATE TABLE IF NOT EXISTS `GDN_Invitation` (
`InvitationID` int(11) NOT NULL,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `AcceptedUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Log`
--

CREATE TABLE IF NOT EXISTS `GDN_Log` (
`LogID` int(11) NOT NULL,
  `Operation` enum('Delete','Edit','Spam','Moderate','Pending','Ban','Error') COLLATE utf8_unicode_ci NOT NULL,
  `RecordType` enum('Discussion','Comment','User','Registration','Activity','ActivityComment','Configuration','Group') COLLATE utf8_unicode_ci NOT NULL,
  `TransactionLogID` int(11) DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `RecordUserID` int(11) DEFAULT NULL,
  `RecordDate` datetime NOT NULL,
  `RecordIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OtherUserIDs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `ParentRecordID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Data` mediumtext COLLATE utf8_unicode_ci,
  `CountGroup` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Log`
--

INSERT INTO `GDN_Log` (`LogID`, `Operation`, `RecordType`, `TransactionLogID`, `RecordID`, `RecordUserID`, `RecordDate`, `RecordIPAddress`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `OtherUserIDs`, `DateUpdated`, `ParentRecordID`, `CategoryID`, `Data`, `CountGroup`) VALUES
(1, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 16:44:16', NULL, 1, '2015-10-04 16:44:16', '127.0.0.1', '', NULL, NULL, NULL, 'a:1:{s:4:"_New";a:7:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(2, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 16:44:24', NULL, 1, '2015-10-04 16:44:24', '127.0.0.1', '', NULL, NULL, NULL, 'a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:1:{s:14:"GettingStarted";a:1:{s:9:"Dashboard";s:1:"1";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(3, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 16:47:04', NULL, 1, '2015-10-04 16:47:04', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:1:{s:14:"GettingStarted";a:1:{s:9:"Dashboard";s:1:"1";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:1:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(4, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 16:47:42', NULL, 1, '2015-10-04 16:47:42', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:1:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(5, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 16:47:43', NULL, 1, '2015-10-04 16:47:43', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:2:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(6, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 16:52:18', NULL, 1, '2015-10-04 16:52:18', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:1:{s:11:"SupportName";s:10:"ISTA Forum";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:1:{s:12:"ConfirmEmail";b:1;}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:14:"smtp.gmail.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:3:"587";s:12:"SmtpSecurity";s:3:"tls";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(7, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 17:04:08', NULL, 1, '2015-10-04 17:04:08', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:14:"smtp.gmail.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:3:"587";s:12:"SmtpSecurity";s:3:"tls";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:14:"smtp.gmail.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:3:"465";s:12:"SmtpSecurity";s:3:"ssl";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(8, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 17:05:13', NULL, 1, '2015-10-04 17:05:13', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:14:"smtp.gmail.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:3:"465";s:12:"SmtpSecurity";s:3:"ssl";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(9, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 17:06:53', NULL, 4, '2015-10-04 17:06:53', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:2:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:3:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";s:10:"Discussion";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"2";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(10, 'Delete', 'Discussion', 10, 3, 4, '2015-10-04 17:19:52', '127.0.0.1', 1, '2015-10-04 17:24:30', '127.0.0.1', '', NULL, NULL, 1, 'a:27:{s:12:"DiscussionID";i:3;s:4:"Type";N;s:9:"ForeignID";N;s:10:"CategoryID";i:1;s:12:"InsertUserID";i:2;s:12:"UpdateUserID";i:4;s:14:"FirstCommentID";N;s:13:"LastCommentID";N;s:4:"Name";s:12:"Hello there!";s:4:"Body";s:22:"I''m new to this forum.";s:6:"Format";s:4:"Html";s:4:"Tags";N;s:13:"CountComments";i:0;s:14:"CountBookmarks";i:0;s:10:"CountViews";i:5;s:6:"Closed";i:0;s:8:"Announce";i:0;s:4:"Sink";i:0;s:12:"DateInserted";s:19:"2015-10-04 17:12:23";s:11:"DateUpdated";s:19:"2015-10-04 17:19:52";s:15:"InsertIPAddress";s:9:"127.0.0.1";s:15:"UpdateIPAddress";s:9:"127.0.0.1";s:15:"DateLastComment";s:19:"2015-10-04 17:12:23";s:17:"LastCommentUserID";N;s:5:"Score";N;s:10:"Attributes";N;s:11:"RegardingID";N;}', NULL),
(11, 'Delete', 'Discussion', 11, 2, 4, '2015-10-04 17:06:53', '127.0.0.1', 1, '2015-10-04 17:24:34', '127.0.0.1', '', NULL, NULL, 1, 'a:27:{s:12:"DiscussionID";i:2;s:4:"Type";N;s:9:"ForeignID";N;s:10:"CategoryID";i:1;s:12:"InsertUserID";i:4;s:12:"UpdateUserID";N;s:14:"FirstCommentID";N;s:13:"LastCommentID";N;s:4:"Name";s:29:"How to setup a Vanilla forum?";s:4:"Body";s:63:"Please help me giving pointers on how to setup a Vanilla Forum.";s:6:"Format";s:4:"Html";s:4:"Tags";N;s:13:"CountComments";i:0;s:14:"CountBookmarks";N;s:10:"CountViews";i:3;s:6:"Closed";i:0;s:8:"Announce";i:0;s:4:"Sink";i:0;s:12:"DateInserted";s:19:"2015-10-04 17:06:53";s:11:"DateUpdated";N;s:15:"InsertIPAddress";s:9:"127.0.0.1";s:15:"UpdateIPAddress";N;s:15:"DateLastComment";s:19:"2015-10-04 17:06:53";s:17:"LastCommentUserID";N;s:5:"Score";N;s:10:"Attributes";N;s:11:"RegardingID";N;}', NULL),
(12, 'Delete', 'Discussion', 12, 1, 2, '2015-10-04 16:44:16', NULL, 1, '2015-10-04 17:24:37', '127.0.0.1', '', NULL, NULL, 1, 'a:28:{s:12:"DiscussionID";i:1;s:4:"Type";N;s:9:"ForeignID";s:4:"stub";s:10:"CategoryID";i:1;s:12:"InsertUserID";i:2;s:12:"UpdateUserID";N;s:14:"FirstCommentID";N;s:13:"LastCommentID";i:1;s:4:"Name";s:35:"BAM! You&rsquo;ve got a sweet forum";s:4:"Body";s:974:"There&rsquo;s nothing sweeter than a fresh new forum, ready to welcome your community. A Vanilla Forum has all the bits and pieces you need to build an awesome discussion platform customized to your needs. Here&rsquo;s a few tips:\n<ul>\n<li>Use the <a href="/dashboard/settings/gettingstarted">Getting Started</a> list in the Dashboard to configure your site.</li>\n<li>Don&rsquo;t use too many categories. We recommend 3-8. Keep it simple!\n<li>&ldquo;Announce&rdquo; a discussion (click the gear) to stick to the top of the list, and &ldquo;Close&rdquo; it to stop further comments.</li>\n<li>Use &ldquo;Sink&rdquo; to take attention away from a discussion. New comments will no longer bring it back to the top of the list.</li>\n<li>Bookmark a discussion (click the star) to get notifications for new comments. You can edit notification settings from your profile.</li>\n</ul>\nGo ahead and edit or delete this discussion, then spread the word to get this place cooking. Cheers!";s:6:"Format";s:4:"Html";s:4:"Tags";N;s:13:"CountComments";i:1;s:14:"CountBookmarks";N;s:10:"CountViews";i:1;s:6:"Closed";i:0;s:8:"Announce";i:0;s:4:"Sink";i:0;s:12:"DateInserted";s:19:"2015-10-04 16:44:16";s:11:"DateUpdated";N;s:15:"InsertIPAddress";N;s:15:"UpdateIPAddress";N;s:15:"DateLastComment";s:19:"2015-10-04 16:44:16";s:17:"LastCommentUserID";i:2;s:5:"Score";N;s:10:"Attributes";N;s:11:"RegardingID";N;s:5:"_Data";a:1:{s:7:"Comment";a:1:{i:0;a:15:{s:9:"CommentID";i:1;s:12:"DiscussionID";i:1;s:12:"InsertUserID";i:2;s:12:"UpdateUserID";N;s:12:"DeleteUserID";N;s:4:"Body";s:341:"This is the first comment on your site and it&rsquo;s an important one. \n\nDon&rsquo;t see your must-have feature? We keep Vanilla nice and simple by default. Use <b>addons</b> to get the special sauce your community needs.\n\nNot sure which addons to enable? Our favorites are Button Bar and Tagging. They&rsquo;re almost always a great start.";s:6:"Format";s:4:"Html";s:12:"DateInserted";s:19:"2015-10-04 16:44:16";s:11:"DateDeleted";N;s:11:"DateUpdated";N;s:15:"InsertIPAddress";N;s:15:"UpdateIPAddress";N;s:4:"Flag";i:0;s:5:"Score";N;s:10:"Attributes";N;}}}}', NULL),
(13, 'Delete', 'Discussion', 13, 4, 3, '2015-10-04 17:27:28', '127.0.0.1', 4, '2015-10-04 17:35:51', '127.0.0.1', '', NULL, NULL, 1, 'a:27:{s:12:"DiscussionID";i:4;s:4:"Type";N;s:9:"ForeignID";N;s:10:"CategoryID";i:1;s:12:"InsertUserID";i:3;s:12:"UpdateUserID";N;s:14:"FirstCommentID";N;s:13:"LastCommentID";N;s:4:"Name";s:4:"How?";s:4:"Body";s:30:"how to vanilla? pls eloborate.";s:6:"Format";s:4:"Html";s:4:"Tags";N;s:13:"CountComments";i:0;s:14:"CountBookmarks";N;s:10:"CountViews";i:2;s:6:"Closed";i:0;s:8:"Announce";i:0;s:4:"Sink";i:0;s:12:"DateInserted";s:19:"2015-10-04 17:27:28";s:11:"DateUpdated";N;s:15:"InsertIPAddress";s:9:"127.0.0.1";s:15:"UpdateIPAddress";N;s:15:"DateLastComment";s:19:"2015-10-04 17:27:28";s:17:"LastCommentUserID";N;s:5:"Score";N;s:10:"Attributes";N;s:11:"RegardingID";N;}', NULL),
(14, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 17:36:10', NULL, 4, '2015-10-04 17:36:10', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:3:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";s:10:"Discussion";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"3";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:4:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";s:10:"Discussion";s:1:"1";s:10:"Categories";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"3";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL),
(15, 'Edit', 'Configuration', NULL, NULL, NULL, '2015-10-04 18:01:00', NULL, 4, '2015-10-04 18:01:00', '127.0.0.1', '', NULL, NULL, NULL, 'a:9:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:12:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:4:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";s:10:"Discussion";s:1:"1";s:10:"Categories";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"3";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}s:4:"_New";a:8:{s:13:"Conversations";a:1:{s:7:"Version";s:6:"2.1.11";}s:8:"Database";a:4:{s:4:"Name";s:9:"istaforum";s:4:"Host";s:9:"localhost";s:4:"User";s:5:"admin";s:8:"Password";s:14:"istaforumadmin";}s:19:"EnabledApplications";a:2:{s:13:"Conversations";s:13:"conversations";s:7:"Vanilla";s:7:"vanilla";}s:14:"EnabledPlugins";a:3:{s:14:"GettingStarted";s:14:"GettingStarted";s:8:"HtmLawed";s:8:"HtmLawed";s:9:"Incognito";b:1;}s:6:"Garden";a:14:{s:5:"Title";s:10:"ISTA Forum";s:6:"Cookie";a:2:{s:4:"Salt";s:10:"XJXYPSBP4L";s:6:"Domain";s:0:"";}s:12:"Registration";a:2:{s:12:"ConfirmEmail";b:1;s:6:"Method";s:5:"Basic";}s:5:"Email";a:8:{s:11:"SupportName";s:10:"ISTA Forum";s:14:"SupportAddress";s:22:"discuss.ista@gmail.com";s:7:"UseSmtp";s:1:"1";s:8:"SmtpHost";s:12:"smtpcorp.com";s:8:"SmtpUser";s:22:"discuss.ista@gmail.com";s:12:"SmtpPassword";s:14:"istaforumadmin";s:8:"SmtpPort";s:4:"2525";s:12:"SmtpSecurity";s:0:"";}s:14:"InputFormatter";s:4:"Html";s:4:"Html";a:1:{s:10:"SafeStyles";b:1;}s:7:"Version";s:6:"2.1.11";s:11:"RewriteUrls";b:1;s:4:"Cdns";a:1:{s:7:"Disable";b:0;}s:16:"CanProcessImages";b:1;s:12:"SystemUserID";s:1:"2";s:9:"Installed";b:1;s:5:"Theme";s:9:"bootstrap";s:12:"ThemeOptions";a:1:{s:4:"Name";s:9:"Bootstrap";}}s:7:"Plugins";a:2:{s:14:"GettingStarted";a:4:{s:9:"Dashboard";s:1:"1";s:7:"Plugins";s:1:"1";s:10:"Discussion";s:1:"1";s:10:"Categories";s:1:"1";}s:9:"Incognito";a:1:{s:6:"UserID";s:1:"3";}}s:6:"Routes";a:1:{s:17:"DefaultController";s:11:"discussions";}s:7:"Vanilla";a:1:{s:7:"Version";s:6:"2.1.11";}}}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Media`
--

CREATE TABLE IF NOT EXISTS `GDN_Media` (
`MediaID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignID` int(11) DEFAULT NULL,
  `ForeignTable` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImageWidth` smallint(5) unsigned DEFAULT NULL,
  `ImageHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbWidth` smallint(5) unsigned DEFAULT NULL,
  `ThumbHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Message`
--

CREATE TABLE IF NOT EXISTS `GDN_Message` (
`MessageID` int(11) NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllowDismiss` tinyint(4) NOT NULL DEFAULT '1',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssetTarget` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CssClass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Permission`
--

CREATE TABLE IF NOT EXISTS `GDN_Permission` (
`PermissionID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  `JunctionTable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionColumn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionID` int(11) DEFAULT NULL,
  `Garden.Email.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Messages.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.SignIn.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Curation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.PersonalInfo.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.AdvancedNotifications.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Conversations.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Approval.Require` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Me` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Close` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Incognito` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Incognito` tinyint(4) NOT NULL DEFAULT '0',
  `Plugins.Incognito.Allow` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Permission`
--

INSERT INTO `GDN_Permission` (`PermissionID`, `RoleID`, `JunctionTable`, `JunctionColumn`, `JunctionID`, `Garden.Email.View`, `Garden.Settings.Manage`, `Garden.Settings.View`, `Garden.Messages.Manage`, `Garden.SignIn.Allow`, `Garden.Users.Add`, `Garden.Users.Edit`, `Garden.Users.Delete`, `Garden.Users.Approve`, `Garden.Activity.Delete`, `Garden.Activity.View`, `Garden.Profiles.View`, `Garden.Profiles.Edit`, `Garden.Moderation.Manage`, `Garden.Curation.Manage`, `Garden.PersonalInfo.View`, `Garden.AdvancedNotifications.Allow`, `Conversations.Moderation.Manage`, `Conversations.Conversations.Add`, `Vanilla.Approval.Require`, `Vanilla.Comments.Me`, `Vanilla.Discussions.View`, `Vanilla.Discussions.Add`, `Vanilla.Discussions.Edit`, `Vanilla.Discussions.Announce`, `Vanilla.Discussions.Sink`, `Vanilla.Discussions.Close`, `Vanilla.Discussions.Delete`, `Vanilla.Comments.Add`, `Vanilla.Comments.Edit`, `Vanilla.Comments.Delete`, `Vanilla.Discussions.Incognito`, `Vanilla.Comments.Incognito`, `Plugins.Incognito.Allow`) VALUES
(1, 0, NULL, NULL, NULL, 3, 2, 2, 2, 3, 2, 2, 2, 2, 2, 3, 3, 3, 2, 2, 2, 2, 2, 3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2),
(2, 2, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 4, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 8, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(6, 32, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(7, 16, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(8, 0, 'Category', 'PermissionCategoryID', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 0),
(9, 2, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 4, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 8, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0),
(12, 32, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(13, 16, 'Category', 'PermissionCategoryID', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Regarding`
--

CREATE TABLE IF NOT EXISTS `GDN_Regarding` (
`RegardingID` int(11) NOT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `OriginalContent` text COLLATE utf8_unicode_ci,
  `ParentType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `Reports` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Role`
--

CREATE TABLE IF NOT EXISTS `GDN_Role` (
`RoleID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Deletable` tinyint(4) NOT NULL DEFAULT '1',
  `CanSession` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_Role`
--

INSERT INTO `GDN_Role` (`RoleID`, `Name`, `Description`, `Sort`, `Deletable`, `CanSession`) VALUES
(2, 'Guest', 'Guests can only view content. Anyone browsing the site who is not signed in is considered to be a "Guest".', 1, 0, 0),
(3, 'Unconfirmed', 'Users must confirm their emails before becoming full members. They get assigned to this role.', 2, 1, 1),
(4, 'Applicant', 'Users who have applied for membership, but have not yet been accepted. They have the same permissions as guests.', 3, 0, 1),
(8, 'Member', 'Members can participate in discussions.', 4, 1, 1),
(16, 'Administrator', 'Administrators have permission to do anything.', 6, 1, 1),
(32, 'Moderator', 'Moderators have permission to edit most content.', 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Session`
--

CREATE TABLE IF NOT EXISTS `GDN_Session` (
  `SessionID` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `TransientKey` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Spammer`
--

CREATE TABLE IF NOT EXISTS `GDN_Spammer` (
  `UserID` int(11) NOT NULL,
  `CountSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CountDeletedSpam` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_Tag`
--

CREATE TABLE IF NOT EXISTS `GDN_Tag` (
`TagID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `CategoryID` int(11) NOT NULL DEFAULT '-1',
  `CountDiscussions` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_TagDiscussion`
--

CREATE TABLE IF NOT EXISTS `GDN_TagDiscussion` (
  `TagID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_User`
--

CREATE TABLE IF NOT EXISTS `GDN_User` (
`UserID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varbinary(100) NOT NULL,
  `HashMethod` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8_unicode_ci,
  `Email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ShowEmail` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` enum('u','m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'u',
  `CountVisits` int(11) NOT NULL DEFAULT '0',
  `CountInvitations` int(11) NOT NULL DEFAULT '0',
  `CountNotifications` int(11) DEFAULT NULL,
  `InviteUserID` int(11) DEFAULT NULL,
  `DiscoveryText` text COLLATE utf8_unicode_ci,
  `Preferences` text COLLATE utf8_unicode_ci,
  `Permissions` text COLLATE utf8_unicode_ci,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateSetInvitations` datetime DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `DateFirstVisit` datetime DEFAULT NULL,
  `DateLastActive` datetime DEFAULT NULL,
  `LastIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllIPAddresses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HourOffset` int(11) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT '0',
  `Verified` tinyint(4) NOT NULL DEFAULT '0',
  `Banned` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `Points` int(11) NOT NULL DEFAULT '0',
  `CountUnreadConversations` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) DEFAULT NULL,
  `CountUnreadDiscussions` int(11) DEFAULT NULL,
  `CountComments` int(11) DEFAULT NULL,
  `CountDrafts` int(11) DEFAULT NULL,
  `CountBookmarks` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_User`
--

INSERT INTO `GDN_User` (`UserID`, `Name`, `Password`, `HashMethod`, `Photo`, `Title`, `Location`, `About`, `Email`, `ShowEmail`, `Gender`, `CountVisits`, `CountInvitations`, `CountNotifications`, `InviteUserID`, `DiscoveryText`, `Preferences`, `Permissions`, `Attributes`, `DateSetInvitations`, `DateOfBirth`, `DateFirstVisit`, `DateLastActive`, `LastIPAddress`, `AllIPAddresses`, `DateInserted`, `InsertIPAddress`, `DateUpdated`, `UpdateIPAddress`, `HourOffset`, `Score`, `Admin`, `Verified`, `Banned`, `Deleted`, `Points`, `CountUnreadConversations`, `CountDiscussions`, `CountUnreadDiscussions`, `CountComments`, `CountDrafts`, `CountBookmarks`) VALUES
(1, 'admin', 0x2450244269424e4c6f4550694b313766736e58745250505059536464776f5449692e, 'Vanilla', NULL, NULL, NULL, NULL, 'discuss.ista@gmail.com', 0, 'u', 1, 0, NULL, NULL, NULL, NULL, '', 'a:1:{s:12:"TransientKey";s:12:"XPY18QO3FMDF";}', NULL, '1975-09-16 00:00:00', '2015-10-04 16:44:15', '2015-10-04 18:07:59', '127.0.0.1', '127.0.0.1', '2015-10-04 16:44:15', '127.0.0.1', '2015-10-04 16:44:15', NULL, 5, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'System', 0x3248594a50375557494d5436543135534f484932, 'Random', 'http://localhost/istaforum/applications/dashboard/design/images/usericon.png', NULL, NULL, NULL, 'system@domain.com', 0, 'u', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-10-04 16:44:15', NULL, NULL, NULL, 0, NULL, 2, 0, 0, 0, 0, NULL, 0, NULL, 1, NULL, NULL),
(3, 'anonymous', 0x2450244264414a42504b4b64767a3546445a456a706a6b622e504168466f306f3630, 'Vanilla', NULL, NULL, NULL, NULL, 'diss.cus.ista@gmail.com', 0, 'u', 0, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '2015-10-04 16:49:48', '2015-10-04 16:49:48', '127.0.0.1', NULL, '2015-10-04 16:49:48', '127.0.0.1', '2015-10-04 17:32:30', '127.0.0.1', 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, NULL),
(4, '[Deleted User]', 0x4643525254503546455a, 'Vanilla', NULL, NULL, NULL, '', 'user_4@deleted.email', 0, 'u', 0, 0, 0, NULL, '', NULL, '', 'a:1:{s:5:"State";s:7:"Deleted";}', NULL, NULL, '2015-10-04 16:55:34', '2015-10-04 18:07:51', '127.0.0.1', '127.0.0.1', '2015-10-04 16:55:34', '127.0.0.1', '2015-10-04 18:08:10', '127.0.0.1', 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthentication`
--

CREATE TABLE IF NOT EXISTS `GDN_UserAuthentication` (
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthenticationNonce`
--

CREATE TABLE IF NOT EXISTS `GDN_UserAuthenticationNonce` (
  `Nonce` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthenticationProvider`
--

CREATE TABLE IF NOT EXISTS `GDN_UserAuthenticationProvider` (
  `AuthenticationKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticationSchemeAlias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssociationSecret` text COLLATE utf8_unicode_ci,
  `AssociationHashMethod` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AuthenticateUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignInUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignOutUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProfileUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserAuthenticationToken`
--

CREATE TABLE IF NOT EXISTS `GDN_UserAuthenticationToken` (
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TokenSecret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TokenType` enum('request','access') COLLATE utf8_unicode_ci NOT NULL,
  `Authorized` tinyint(4) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Lifetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserCategory`
--

CREATE TABLE IF NOT EXISTS `GDN_UserCategory` (
  `UserID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateMarkedRead` datetime DEFAULT NULL,
  `Unfollow` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserComment`
--

CREATE TABLE IF NOT EXISTS `GDN_UserComment` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserConversation`
--

CREATE TABLE IF NOT EXISTS `GDN_UserConversation` (
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `CountReadMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  `DateCleared` datetime DEFAULT NULL,
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `DateConversationUpdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_UserConversation`
--

INSERT INTO `GDN_UserConversation` (`UserID`, `ConversationID`, `CountReadMessages`, `LastMessageID`, `DateLastViewed`, `DateCleared`, `Bookmarked`, `Deleted`, `DateConversationUpdated`) VALUES
(1, 1, 0, 1, NULL, NULL, 0, 0, '2015-10-04 16:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserDiscussion`
--

CREATE TABLE IF NOT EXISTS `GDN_UserDiscussion` (
  `UserID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateLastViewed` datetime DEFAULT NULL,
  `Dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserMerge`
--

CREATE TABLE IF NOT EXISTS `GDN_UserMerge` (
`MergeID` int(11) NOT NULL,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserMergeItem`
--

CREATE TABLE IF NOT EXISTS `GDN_UserMergeItem` (
  `MergeID` int(11) NOT NULL,
  `Table` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Column` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `RecordID` int(11) NOT NULL,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserMeta`
--

CREATE TABLE IF NOT EXISTS `GDN_UserMeta` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserPoints`
--

CREATE TABLE IF NOT EXISTS `GDN_UserPoints` (
  `SlotType` enum('d','w','m','y','a') COLLATE utf8_unicode_ci NOT NULL,
  `TimeSlot` datetime NOT NULL,
  `Source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Total',
  `UserID` int(11) NOT NULL,
  `Points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GDN_UserRole`
--

CREATE TABLE IF NOT EXISTS `GDN_UserRole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GDN_UserRole`
--

INSERT INTO `GDN_UserRole` (`UserID`, `RoleID`) VALUES
(0, 2),
(1, 16),
(3, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GDN_Activity`
--
ALTER TABLE `GDN_Activity`
 ADD PRIMARY KEY (`ActivityID`), ADD KEY `IX_Activity_Notify` (`NotifyUserID`,`Notified`), ADD KEY `IX_Activity_Recent` (`NotifyUserID`,`DateUpdated`), ADD KEY `IX_Activity_Feed` (`NotifyUserID`,`ActivityUserID`,`DateUpdated`), ADD KEY `IX_Activity_DateUpdated` (`DateUpdated`), ADD KEY `FK_Activity_InsertUserID` (`InsertUserID`);

--
-- Indexes for table `GDN_ActivityComment`
--
ALTER TABLE `GDN_ActivityComment`
 ADD PRIMARY KEY (`ActivityCommentID`), ADD KEY `FK_ActivityComment_ActivityID` (`ActivityID`);

--
-- Indexes for table `GDN_ActivityType`
--
ALTER TABLE `GDN_ActivityType`
 ADD PRIMARY KEY (`ActivityTypeID`);

--
-- Indexes for table `GDN_AnalyticsLocal`
--
ALTER TABLE `GDN_AnalyticsLocal`
 ADD UNIQUE KEY `UX_AnalyticsLocal` (`TimeSlot`);

--
-- Indexes for table `GDN_Ban`
--
ALTER TABLE `GDN_Ban`
 ADD PRIMARY KEY (`BanID`), ADD UNIQUE KEY `UX_Ban` (`BanType`,`BanValue`);

--
-- Indexes for table `GDN_Category`
--
ALTER TABLE `GDN_Category`
 ADD PRIMARY KEY (`CategoryID`), ADD KEY `FK_Category_InsertUserID` (`InsertUserID`);

--
-- Indexes for table `GDN_Comment`
--
ALTER TABLE `GDN_Comment`
 ADD PRIMARY KEY (`CommentID`), ADD KEY `IX_Comment_1` (`DiscussionID`,`DateInserted`), ADD KEY `IX_Comment_DateInserted` (`DateInserted`), ADD KEY `FK_Comment_InsertUserID` (`InsertUserID`), ADD FULLTEXT KEY `TX_Comment` (`Body`);

--
-- Indexes for table `GDN_Conversation`
--
ALTER TABLE `GDN_Conversation`
 ADD PRIMARY KEY (`ConversationID`), ADD KEY `FK_Conversation_FirstMessageID` (`FirstMessageID`), ADD KEY `FK_Conversation_InsertUserID` (`InsertUserID`), ADD KEY `FK_Conversation_DateInserted` (`DateInserted`), ADD KEY `FK_Conversation_UpdateUserID` (`UpdateUserID`), ADD KEY `IX_Conversation_RegardingID` (`RegardingID`);

--
-- Indexes for table `GDN_ConversationMessage`
--
ALTER TABLE `GDN_ConversationMessage`
 ADD PRIMARY KEY (`MessageID`), ADD KEY `FK_ConversationMessage_ConversationID` (`ConversationID`), ADD KEY `FK_ConversationMessage_InsertUserID` (`InsertUserID`);

--
-- Indexes for table `GDN_Discussion`
--
ALTER TABLE `GDN_Discussion`
 ADD PRIMARY KEY (`DiscussionID`), ADD KEY `IX_Discussion_Type` (`Type`), ADD KEY `IX_Discussion_ForeignID` (`ForeignID`), ADD KEY `IX_Discussion_DateInserted` (`DateInserted`), ADD KEY `IX_Discussion_DateLastComment` (`DateLastComment`), ADD KEY `IX_Discussion_RegardingID` (`RegardingID`), ADD KEY `IX_Discussion_CategoryPages` (`CategoryID`,`DateLastComment`), ADD KEY `FK_Discussion_CategoryID` (`CategoryID`), ADD KEY `FK_Discussion_InsertUserID` (`InsertUserID`), ADD FULLTEXT KEY `TX_Discussion` (`Name`,`Body`);

--
-- Indexes for table `GDN_Draft`
--
ALTER TABLE `GDN_Draft`
 ADD PRIMARY KEY (`DraftID`), ADD KEY `FK_Draft_DiscussionID` (`DiscussionID`), ADD KEY `FK_Draft_CategoryID` (`CategoryID`), ADD KEY `FK_Draft_InsertUserID` (`InsertUserID`);

--
-- Indexes for table `GDN_Invitation`
--
ALTER TABLE `GDN_Invitation`
 ADD PRIMARY KEY (`InvitationID`), ADD KEY `FK_Invitation_InsertUserID` (`InsertUserID`);

--
-- Indexes for table `GDN_Log`
--
ALTER TABLE `GDN_Log`
 ADD PRIMARY KEY (`LogID`), ADD KEY `IX_Log_RecordType` (`RecordType`), ADD KEY `IX_Log_RecordID` (`RecordID`), ADD KEY `IX_Log_RecordIPAddress` (`RecordIPAddress`), ADD KEY `IX_Log_ParentRecordID` (`ParentRecordID`), ADD KEY `FK_Log_CategoryID` (`CategoryID`);

--
-- Indexes for table `GDN_Media`
--
ALTER TABLE `GDN_Media`
 ADD PRIMARY KEY (`MediaID`);

--
-- Indexes for table `GDN_Message`
--
ALTER TABLE `GDN_Message`
 ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `GDN_Permission`
--
ALTER TABLE `GDN_Permission`
 ADD PRIMARY KEY (`PermissionID`), ADD KEY `FK_Permission_RoleID` (`RoleID`);

--
-- Indexes for table `GDN_Regarding`
--
ALTER TABLE `GDN_Regarding`
 ADD PRIMARY KEY (`RegardingID`), ADD KEY `FK_Regarding_Type` (`Type`);

--
-- Indexes for table `GDN_Role`
--
ALTER TABLE `GDN_Role`
 ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `GDN_Session`
--
ALTER TABLE `GDN_Session`
 ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `GDN_Spammer`
--
ALTER TABLE `GDN_Spammer`
 ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `GDN_Tag`
--
ALTER TABLE `GDN_Tag`
 ADD PRIMARY KEY (`TagID`), ADD UNIQUE KEY `UX_Tag` (`Name`,`CategoryID`), ADD KEY `IX_Tag_Type` (`Type`), ADD KEY `FK_Tag_InsertUserID` (`InsertUserID`);

--
-- Indexes for table `GDN_TagDiscussion`
--
ALTER TABLE `GDN_TagDiscussion`
 ADD PRIMARY KEY (`TagID`,`DiscussionID`), ADD KEY `IX_TagDiscussion_CategoryID` (`CategoryID`);

--
-- Indexes for table `GDN_User`
--
ALTER TABLE `GDN_User`
 ADD PRIMARY KEY (`UserID`), ADD KEY `FK_User_Name` (`Name`), ADD KEY `IX_User_Email` (`Email`), ADD KEY `IX_User_DateLastActive` (`DateLastActive`), ADD KEY `IX_User_DateInserted` (`DateInserted`);

--
-- Indexes for table `GDN_UserAuthentication`
--
ALTER TABLE `GDN_UserAuthentication`
 ADD PRIMARY KEY (`ForeignUserKey`,`ProviderKey`), ADD KEY `FK_UserAuthentication_UserID` (`UserID`);

--
-- Indexes for table `GDN_UserAuthenticationNonce`
--
ALTER TABLE `GDN_UserAuthenticationNonce`
 ADD PRIMARY KEY (`Nonce`);

--
-- Indexes for table `GDN_UserAuthenticationProvider`
--
ALTER TABLE `GDN_UserAuthenticationProvider`
 ADD PRIMARY KEY (`AuthenticationKey`);

--
-- Indexes for table `GDN_UserAuthenticationToken`
--
ALTER TABLE `GDN_UserAuthenticationToken`
 ADD PRIMARY KEY (`Token`,`ProviderKey`);

--
-- Indexes for table `GDN_UserCategory`
--
ALTER TABLE `GDN_UserCategory`
 ADD PRIMARY KEY (`UserID`,`CategoryID`);

--
-- Indexes for table `GDN_UserComment`
--
ALTER TABLE `GDN_UserComment`
 ADD PRIMARY KEY (`UserID`,`CommentID`);

--
-- Indexes for table `GDN_UserConversation`
--
ALTER TABLE `GDN_UserConversation`
 ADD PRIMARY KEY (`UserID`,`ConversationID`), ADD KEY `IX_UserConversation_Inbox` (`UserID`,`Deleted`,`DateConversationUpdated`), ADD KEY `FK_UserConversation_ConversationID` (`ConversationID`);

--
-- Indexes for table `GDN_UserDiscussion`
--
ALTER TABLE `GDN_UserDiscussion`
 ADD PRIMARY KEY (`UserID`,`DiscussionID`), ADD KEY `FK_UserDiscussion_DiscussionID` (`DiscussionID`);

--
-- Indexes for table `GDN_UserMerge`
--
ALTER TABLE `GDN_UserMerge`
 ADD PRIMARY KEY (`MergeID`), ADD KEY `FK_UserMerge_OldUserID` (`OldUserID`), ADD KEY `FK_UserMerge_NewUserID` (`NewUserID`);

--
-- Indexes for table `GDN_UserMergeItem`
--
ALTER TABLE `GDN_UserMergeItem`
 ADD KEY `FK_UserMergeItem_MergeID` (`MergeID`);

--
-- Indexes for table `GDN_UserMeta`
--
ALTER TABLE `GDN_UserMeta`
 ADD PRIMARY KEY (`UserID`,`Name`), ADD KEY `IX_UserMeta_Name` (`Name`);

--
-- Indexes for table `GDN_UserPoints`
--
ALTER TABLE `GDN_UserPoints`
 ADD PRIMARY KEY (`SlotType`,`TimeSlot`,`Source`,`UserID`);

--
-- Indexes for table `GDN_UserRole`
--
ALTER TABLE `GDN_UserRole`
 ADD PRIMARY KEY (`UserID`,`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `GDN_Activity`
--
ALTER TABLE `GDN_Activity`
MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `GDN_ActivityComment`
--
ALTER TABLE `GDN_ActivityComment`
MODIFY `ActivityCommentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_ActivityType`
--
ALTER TABLE `GDN_ActivityType`
MODIFY `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `GDN_Ban`
--
ALTER TABLE `GDN_Ban`
MODIFY `BanID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_Category`
--
ALTER TABLE `GDN_Category`
MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `GDN_Comment`
--
ALTER TABLE `GDN_Comment`
MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `GDN_Conversation`
--
ALTER TABLE `GDN_Conversation`
MODIFY `ConversationID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `GDN_ConversationMessage`
--
ALTER TABLE `GDN_ConversationMessage`
MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `GDN_Discussion`
--
ALTER TABLE `GDN_Discussion`
MODIFY `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `GDN_Draft`
--
ALTER TABLE `GDN_Draft`
MODIFY `DraftID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_Invitation`
--
ALTER TABLE `GDN_Invitation`
MODIFY `InvitationID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_Log`
--
ALTER TABLE `GDN_Log`
MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `GDN_Media`
--
ALTER TABLE `GDN_Media`
MODIFY `MediaID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_Message`
--
ALTER TABLE `GDN_Message`
MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_Permission`
--
ALTER TABLE `GDN_Permission`
MODIFY `PermissionID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `GDN_Regarding`
--
ALTER TABLE `GDN_Regarding`
MODIFY `RegardingID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_Role`
--
ALTER TABLE `GDN_Role`
MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `GDN_Tag`
--
ALTER TABLE `GDN_Tag`
MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GDN_User`
--
ALTER TABLE `GDN_User`
MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `GDN_UserMerge`
--
ALTER TABLE `GDN_UserMerge`
MODIFY `MergeID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
